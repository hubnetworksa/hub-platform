// Browser-side state for the Monthly / Yearly switch (BillingToggle.astro).
// Bundled into client scripts; must not import anything server-only.
//
// Prices that exist in both periods are rendered as a pair: one element
// with data-period="monthly" and one with data-period="yearly" (hidden to
// start). Those elements must not carry an inline `display` style — it
// would beat the [hidden] attribute (see sponsor.astro's sp-target-wrap).
// Monthly is always the default; a request without `billing` is monthly.

export type BillingPeriod = 'monthly' | 'yearly';

export const BILLING_EVENT = 'billing-change';

export function currentBilling(): BillingPeriod {
  return document.documentElement.dataset.billing === 'yearly' ? 'yearly' : 'monthly';
}

/** Show the prices for the current period (call again after rendering new
 *  data-period elements from a client script). */
export function applyBilling(root: ParentNode = document): void {
  const period = currentBilling();
  root.querySelectorAll<HTMLElement>('[data-period]').forEach((el) => {
    el.hidden = el.dataset.period !== period;
  });
  document.querySelectorAll<HTMLButtonElement>('[data-billing-option]').forEach((btn) => {
    const on = btn.dataset.billingOption === period;
    btn.setAttribute('aria-pressed', on ? 'true' : 'false');
    btn.style.background = on ? 'var(--navy)' : '#fff';
    btn.style.color = on ? '#fff' : 'var(--navy)';
  });
}

export function setBilling(period: BillingPeriod): void {
  document.documentElement.dataset.billing = period;
  applyBilling();
  window.dispatchEvent(new CustomEvent<BillingPeriod>(BILLING_EVENT, { detail: period }));
}

export function onBillingChange(fn: (period: BillingPeriod) => void): void {
  window.addEventListener(BILLING_EVENT, (e) => fn((e as CustomEvent<BillingPeriod>).detail));
}

/** Wires every switch on the page (they all stay in step). Idempotent. */
export function initBillingToggles(): void {
  document.querySelectorAll<HTMLButtonElement>('[data-billing-option]').forEach((btn) => {
    if (btn.dataset.billingWired) return;
    btn.dataset.billingWired = '1';
    btn.addEventListener('click', () => setBilling(btn.dataset.billingOption === 'yearly' ? 'yearly' : 'monthly'));
  });
  applyBilling();
}
