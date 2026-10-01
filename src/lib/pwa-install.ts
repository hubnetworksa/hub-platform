// Client-only: the one shared handler for "install this site as an app".
// Imported by BaseLayout's footer "Install the app" button and by
// components/InstallPrompt.astro (the mobile bottom sheet). Vite bundles it
// once per page, so there is exactly one `beforeinstallprompt` listener and
// one deferred prompt that both UIs share.
//
// It also feeds the admin dashboard's anonymous "App installs" counter
// (functions/api/app-event.ts): a random device id kept in localStorage,
// an 'install' when the app is installed and an 'open' at most once a day
// while the site runs as an installed app. If storage is unavailable
// nothing is tracked.

export interface InstallPromptEvent extends Event {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' | string }>;
}

const KEY_DEVICE = 'hub-app-device-id';
const KEY_OPEN_DAY = 'hub-app-open-day';
const KEY_INSTALLED = 'hub-app-installed';
const KEY_SNOOZE = 'hub-install-snooze-until';
const SNOOZE_MS = 14 * 86_400_000;

export function storageGet(key: string): string | null {
  try {
    return window.localStorage.getItem(key);
  } catch {
    return null;
  }
}

export function storageSet(key: string, value: string): boolean {
  try {
    window.localStorage.setItem(key, value);
    return true;
  } catch {
    return false;
  }
}

export function isStandalone(): boolean {
  return (
    window.matchMedia?.('(display-mode: standalone)').matches ||
    window.matchMedia?.('(display-mode: fullscreen)').matches ||
    (navigator as Navigator & { standalone?: boolean }).standalone === true
  );
}

function isIOS(): boolean {
  const ua = navigator.userAgent;
  // iPadOS reports itself as a Mac; a touch screen gives it away.
  return /iPhone|iPad|iPod/i.test(ua) || (/Macintosh/.test(ua) && navigator.maxTouchPoints > 1);
}

/** Safari proper on iPhone/iPad — the only iOS browser whose Share sheet
 *  reliably offers "Add to Home Screen" (in-app browsers don't). */
export function isIOSSafari(): boolean {
  const ua = navigator.userAgent;
  return isIOS() && /Safari\//.test(ua) && !/CriOS|FxiOS|EdgiOS|OPiOS|GSA\/|YaBrowser|DuckDuckGo|FBAN|FBAV|Instagram|Line\//i.test(ua);
}

export function platform(): 'android' | 'ios' | 'desktop' | 'other' {
  if (isIOS()) return 'ios';
  if (/Android/i.test(navigator.userAgent)) return 'android';
  if (window.matchMedia?.('(pointer: fine)').matches) return 'desktop';
  return 'other';
}

// ---- Popup snooze / installed flags ---------------------------------------

export function wasInstalled(): boolean {
  return storageGet(KEY_INSTALLED) === '1';
}

export function isSnoozed(): boolean {
  const until = Number(storageGet(KEY_SNOOZE) ?? 0);
  return Number.isFinite(until) && until > Date.now();
}

export function snooze(): void {
  storageSet(KEY_SNOOZE, String(Date.now() + SNOOZE_MS));
}

// ---- Anonymous tracking -------------------------------------------------

function newDeviceId(): string {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') return crypto.randomUUID();
  const bytes = new Uint8Array(16);
  crypto.getRandomValues(bytes);
  return Array.from(bytes, (b) => b.toString(16).padStart(2, '0')).join('');
}

function deviceId(): string | null {
  const existing = storageGet(KEY_DEVICE);
  if (existing && /^[A-Za-z0-9_-]{16,64}$/.test(existing)) return existing;
  let id: string;
  try {
    id = newDeviceId();
  } catch {
    return null;
  }
  // Only use an id we could actually keep — otherwise every page load would
  // look like a new device.
  return storageSet(KEY_DEVICE, id) && storageGet(KEY_DEVICE) === id ? id : null;
}

function track(event: 'install' | 'open'): void {
  const id = deviceId();
  if (!id) return;
  const body = JSON.stringify({ event, device_id: id, platform: platform() });
  try {
    fetch('/api/app-event', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body, keepalive: true }).catch(() => {});
  } catch {
    try {
      navigator.sendBeacon?.('/api/app-event', new Blob([body], { type: 'application/json' }));
    } catch {
      /* tracking is best-effort */
    }
  }
}

function markInstalled(): void {
  if (wasInstalled()) return;
  storageSet(KEY_INSTALLED, '1');
  // The server ignores a repeat install from the same device id.
  track('install');
}

// ---- The shared deferred prompt -----------------------------------------

let deferred: InstallPromptEvent | null = null;
const installableListeners = new Set<() => void>();
const installedListeners = new Set<() => void>();
const usedListeners = new Set<() => void>();

window.addEventListener('beforeinstallprompt', (e) => {
  e.preventDefault();
  deferred = e as InstallPromptEvent;
  for (const cb of installableListeners) cb();
});

window.addEventListener('appinstalled', () => {
  deferred = null;
  markInstalled();
  for (const cb of installedListeners) cb();
});

/** Runs `cb` once the browser says the site is installable (immediately if
 *  it already has). */
export function onInstallable(cb: () => void): void {
  installableListeners.add(cb);
  if (deferred) cb();
}

export function onInstalled(cb: () => void): void {
  installedListeners.add(cb);
}

/** Runs `cb` when the deferred prompt has been used up (by either UI). */
export function onPromptUsed(cb: () => void): void {
  usedListeners.add(cb);
}

export function canPrompt(): boolean {
  return deferred !== null;
}

/** Shows the browser's own install dialog. A deferred prompt can only be
 *  used once, so it is cleared either way. */
export async function promptInstall(): Promise<'accepted' | 'dismissed' | 'unavailable'> {
  const p = deferred;
  if (!p) return 'unavailable';
  deferred = null;
  for (const cb of usedListeners) cb();
  try {
    await p.prompt();
    const { outcome } = await p.userChoice;
    return outcome === 'accepted' ? 'accepted' : 'dismissed';
  } catch {
    return 'dismissed';
  }
}

// Running as the installed app: count the first launch as an install (iOS
// never fires `appinstalled`, and its home-screen app has its own storage)
// and an 'open' at most once a day.
if (isStandalone()) {
  markInstalled();
  const today = new Date().toISOString().slice(0, 10);
  if (storageGet(KEY_OPEN_DAY) !== today && storageSet(KEY_OPEN_DAY, today)) track('open');
}
