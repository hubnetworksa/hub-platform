// Node-side client for scripts/content-upgrade/crawler.py. Spawns ONE
// persistent Python process (one shared headless-Chromium instance) and
// sends it NDJSON fetch requests, matching replies back by "id". Used by
// research.mjs instead of a raw fetch() so pages render through a real
// browser (Crawl4AI's anti-bot handling) instead of getting rate-limited or
// blocked.
import { spawn } from 'node:child_process';
import readline from 'node:readline';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

let proc = null;
let rl = null;
let nextId = 1;
const pending = new Map();
let readyResolve, readyPromise;

function findPython() {
  return process.env.PYTHON || (process.platform === 'win32' ? 'python' : 'python3');
}

export function startCrawler() {
  if (proc) return readyPromise;
  readyPromise = new Promise((res) => { readyResolve = res; });
  const script = path.join(path.dirname(fileURLToPath(import.meta.url)), 'crawler.py');
  proc = spawn(findPython(), [script], { stdio: ['pipe', 'pipe', 'inherit'] });
  rl = readline.createInterface({ input: proc.stdout });
  rl.on('line', (line) => {
    let msg;
    try { msg = JSON.parse(line); } catch { return; }
    if (msg.ready) { readyResolve(); return; }
    const id = msg.id;
    const p = pending.get(id);
    if (!p) return;
    pending.delete(id);
    clearTimeout(p.timer);
    p.resolve(msg);
  });
  proc.on('exit', (code) => {
    for (const [, p] of pending) { clearTimeout(p.timer); p.reject(new Error(`crawler process exited (${code})`)); }
    pending.clear();
    proc = null;
  });
  proc.on('error', (e) => { readyResolve?.(); console.error('crawler.py failed to start:', e.message); });
  return readyPromise;
}

export function stopCrawler() {
  if (proc) { proc.stdin.end(); proc = null; }
}

// get(url, { ua, timeoutMs }) -> { html, finalUrl } | throws Error (with .status if known)
export async function crawlerGet(url, { ua = 'chrome', timeoutMs = 25000 } = {}) {
  if (!proc) throw new Error('crawler not started');
  const id = nextId++;
  const p = new Promise((resolve, reject) => {
    const timer = setTimeout(() => { pending.delete(id); reject(Object.assign(new Error('timeout'), { status: undefined })); }, timeoutMs);
    pending.set(id, { resolve, reject, timer });
  });
  proc.stdin.write(JSON.stringify({ id, url, ua }) + '\n');
  const msg = await p;
  if (!msg.ok) {
    const err = new Error(msg.error || 'fetch failed');
    if (/429|too many requests/i.test(msg.error || '')) err.status = 429;
    else if (/403|forbidden/i.test(msg.error || '')) err.status = 403;
    throw err;
  }
  if (msg.status && msg.status >= 400) {
    const err = new Error(`HTTP ${msg.status}`); err.status = msg.status; throw err;
  }
  return { html: msg.html || '', finalUrl: msg.finalUrl || url };
}
