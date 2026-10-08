// Small SVG chart kit for Hub Admin: line charts (crosshair + tooltip),
// grouped column charts (per-bar tooltip) and horizontal bar lists.
// Colours come from CSS tokens (--s1..--s3 per city, see styles.css), so the
// light/dark themes swap in one place. All labels go in with textContent:
// business names and search queries are user data.

import { motion } from './motion.js';
import { helpIcon } from './help.js';

const NS = 'http://www.w3.org/2000/svg';

// Animate a chart only the first time it's drawn, not on every resize.
function firstDraw(holder) {
  if (holder.dataset.drawn) return false;
  holder.dataset.drawn = '1';
  return true;
}

function svgEl(tag, attrs = {}, parent) {
  const el = document.createElementNS(NS, tag);
  for (const [k, v] of Object.entries(attrs)) el.setAttribute(k, String(v));
  if (parent) parent.appendChild(el);
  return el;
}

function text(parent, x, y, str, attrs = {}) {
  const t = svgEl('text', { x, y, fill: 'var(--muted)', 'font-size': 11.5, ...attrs }, parent);
  t.textContent = str;
  return t;
}

// Top of the y-axis: a round number, and never below 4 so the four
// gridline steps stay whole numbers on small counts (no "1, 1, 2, 2").
export function niceMax(v) {
  if (v <= 4) return 4;
  const exp = Math.pow(10, Math.floor(Math.log10(v)));
  for (const m of [1, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10]) if (m * exp >= v) return m * exp;
  return 10 * exp;
}

export const fmt = {
  int: (n) => Math.round(n).toLocaleString('en-ZA'),
  short: (n) => (n >= 10000 ? `${(n / 1000).toFixed(n >= 100000 ? 0 : 1)}k` : Math.round(n).toLocaleString('en-ZA')),
  rand: (cents) => `R${(cents / 100).toLocaleString('en-ZA', { maximumFractionDigits: 0 })}`,
  randShort: (cents) => {
    const r = cents / 100;
    return r >= 10000 ? `R${(r / 1000).toFixed(r >= 100000 ? 0 : 1)}k` : `R${Math.round(r).toLocaleString('en-ZA')}`;
  },
  day: (iso) => new Date(`${iso}T00:00:00Z`).toLocaleDateString('en-ZA', { day: 'numeric', month: 'short', timeZone: 'UTC' }),
  dayLong: (iso) => new Date(`${iso}T00:00:00Z`).toLocaleDateString('en-ZA', { weekday: 'short', day: 'numeric', month: 'long', timeZone: 'UTC' }),
  month: (ym) => new Date(`${ym}-01T00:00:00Z`).toLocaleDateString('en-ZA', { month: 'short', timeZone: 'UTC' }),
  monthLong: (ym) => new Date(`${ym}-01T00:00:00Z`).toLocaleDateString('en-ZA', { month: 'long', year: 'numeric', timeZone: 'UTC' }),
};

// ── Tooltip (one for the whole app) ────────────────────────────────────────
let tipEl;
function tip() {
  if (!tipEl) {
    tipEl = document.createElement('div');
    tipEl.className = 'tip';
    tipEl.setAttribute('role', 'status');
    document.body.appendChild(tipEl);
  }
  return tipEl;
}
export function showTip(x, y, head, rowsData) {
  const el = tip();
  el.replaceChildren();
  const h = document.createElement('div');
  h.className = 't-head';
  h.textContent = head;
  el.appendChild(h);
  for (const r of rowsData) {
    const row = document.createElement('div');
    row.className = 't-row';
    if (r.color) {
      const i = document.createElement('i');
      i.style.background = r.color;
      row.appendChild(i);
    }
    const b = document.createElement('b');
    b.textContent = r.value;
    const s = document.createElement('span');
    s.textContent = r.label;
    row.append(b, s);
    el.appendChild(row);
  }
  el.style.display = 'block';
  const w = el.offsetWidth;
  const hgt = el.offsetHeight;
  const left = Math.min(window.innerWidth - w - 8, x + 14);
  const top = y - hgt - 12 < 8 ? y + 16 : y - hgt - 12;
  el.style.left = `${Math.max(8, left)}px`;
  el.style.top = `${top}px`;
}
export function hideTip() {
  if (tipEl) tipEl.style.display = 'none';
}

export function legend(series, kind = 'line') {
  const wrap = document.createElement('div');
  wrap.className = 'legend';
  for (const s of series) {
    const span = document.createElement('span');
    const i = document.createElement('i');
    if (kind === 'box') i.className = 'box';
    i.style.background = s.color;
    const t = document.createElement('span');
    t.textContent = s.name;
    span.append(i, t);
    wrap.appendChild(span);
  }
  return wrap;
}

// Chart heights come from the two CSS tokens (--chart-lg 240px, --chart-sm 160px).
// `height` (a number) still overrides, for callers that already pass one.
function chartHeight(el, opts) {
  if (typeof opts.height === 'number') return opts.height;
  const token = opts.size === 'sm' ? '--chart-sm' : '--chart-lg';
  const v = parseFloat(getComputedStyle(el).getPropertyValue(token));
  return Number.isFinite(v) && v > 0 ? v : opts.size === 'sm' ? 160 : 240;
}

// Re-render on width change (cards resize with the window and the sidebar).
function responsive(el, draw) {
  let w = 0;
  const run = () => {
    const nw = Math.round(el.clientWidth);
    if (nw && nw !== w) {
      w = nw;
      draw(w);
    }
  };
  new ResizeObserver(run).observe(el);
  run();
}

// ── Line chart ─────────────────────────────────────────────────────────────
// opts: { x: ['2026-09-01', ...], series: [{ name, color, values }], format, size?: 'lg' | 'sm', height? }
export function lineChart(el, opts) {
  const { x, series, format = fmt.int } = opts;
  el.classList.add('chart');
  const height = chartHeight(el, opts);
  el.replaceChildren();
  if (series.length > 1) el.appendChild(legend(series));
  const holder = document.createElement('div');
  el.appendChild(holder);
  const labelled = series.length <= 4;

  responsive(holder, (W) => {
    holder.replaceChildren();
    const m = { l: 42, r: labelled ? 96 : 12, t: 10, b: 26 };
    if (W < 420) m.r = labelled ? 74 : 8;
    const iw = Math.max(40, W - m.l - m.r);
    const ih = height - m.t - m.b;
    const max = niceMax(Math.max(1, ...series.flatMap((s) => s.values)));
    const sx = (i) => m.l + (x.length < 2 ? iw / 2 : (i / (x.length - 1)) * iw);
    const sy = (v) => m.t + ih - (v / max) * ih;
    const svg = svgEl('svg', { viewBox: `0 0 ${W} ${height}`, height, role: 'img', 'aria-label': opts.label || 'Line chart' }, holder);

    for (let k = 0; k <= 4; k++) {
      const v = (max / 4) * k;
      const y = sy(v);
      svgEl('line', { x1: m.l, x2: m.l + iw, y1: y, y2: y, stroke: k === 0 ? 'var(--axis)' : 'var(--grid)', 'stroke-width': 1 }, svg);
      text(svg, m.l - 8, y + 4, format(v), { 'text-anchor': 'end' });
    }
    const ticks = Math.min(x.length, W < 480 ? 4 : 6);
    for (let k = 0; k < ticks; k++) {
      const i = Math.round((k / Math.max(1, ticks - 1)) * (x.length - 1));
      text(svg, sx(i), height - 6, fmt.day(x[i]), { 'text-anchor': k === 0 ? 'start' : k === ticks - 1 ? 'end' : 'middle' });
    }

    for (const s of series) {
      const d = s.values.map((v, i) => `${i ? 'L' : 'M'}${sx(i).toFixed(1)},${sy(v).toFixed(1)}`).join('');
      svgEl('path', { d, fill: 'none', stroke: s.color, 'stroke-width': 2, 'stroke-linejoin': 'round', 'stroke-linecap': 'round' }, svg);
    }

    // Direct labels at the line ends, nudged apart so they never overlap.
    if (labelled) {
      const ends = series
        .map((s) => ({ s, y: sy(s.values[s.values.length - 1] ?? 0) }))
        .sort((a, b) => a.y - b.y);
      for (let i = 1; i < ends.length; i++) if (ends[i].y - ends[i - 1].y < 14) ends[i].y = ends[i - 1].y + 14;
      for (const e of ends) {
        const lx = sx(x.length - 1) + 8;
        text(svg, lx, e.y + 4, e.s.short || e.s.name, { fill: 'var(--text-2)', 'font-size': 12, 'font-weight': 600 });
      }
    }

    if (firstDraw(holder)) motion.lines(svg);

    // Hover / keyboard layer: crosshair snaps to the nearest day.
    const cross = svgEl('line', { y1: m.t, y2: m.t + ih, stroke: 'var(--muted)', 'stroke-width': 1, visibility: 'hidden' }, svg);
    const dots = series.map((s) => svgEl('circle', { r: 4.5, fill: s.color, stroke: 'var(--surface)', 'stroke-width': 2, visibility: 'hidden' }, svg));
    const hit = svgEl('rect', { x: m.l - 6, y: 0, width: iw + 12, height, fill: 'transparent', tabindex: 0, 'aria-label': `${opts.label || 'Chart'}: use arrow keys to read values` }, svg);
    let cur = x.length - 1;
    const show = (i, cx, cy) => {
      cur = Math.max(0, Math.min(x.length - 1, i));
      const px = sx(cur);
      cross.setAttribute('x1', px);
      cross.setAttribute('x2', px);
      cross.setAttribute('visibility', 'visible');
      series.forEach((s, j) => {
        dots[j].setAttribute('cx', px);
        dots[j].setAttribute('cy', sy(s.values[cur] ?? 0));
        dots[j].setAttribute('visibility', 'visible');
      });
      const rect = svg.getBoundingClientRect();
      const rowsData = series
        .map((s) => ({ color: s.color, label: s.name, raw: s.values[cur] ?? 0 }))
        .sort((a, b) => b.raw - a.raw)
        .map((r) => ({ ...r, value: format(r.raw) }));
      showTip(cx ?? rect.left + (px / W) * rect.width, cy ?? rect.top + 20, fmt.dayLong(x[cur]), rowsData);
    };
    const hide = () => {
      cross.setAttribute('visibility', 'hidden');
      dots.forEach((d) => d.setAttribute('visibility', 'hidden'));
      hideTip();
    };
    hit.addEventListener('pointermove', (e) => {
      const rect = svg.getBoundingClientRect();
      const px = ((e.clientX - rect.left) / rect.width) * W;
      const i = x.length < 2 ? 0 : Math.round(((px - m.l) / iw) * (x.length - 1));
      show(i, e.clientX, e.clientY);
    });
    hit.addEventListener('pointerleave', hide);
    hit.addEventListener('blur', hide);
    hit.addEventListener('focus', () => show(cur));
    hit.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowLeft') show(cur - 1);
      else if (e.key === 'ArrowRight') show(cur + 1);
      else return;
      e.preventDefault();
    });
  });
}

// ── Grouped column chart ───────────────────────────────────────────────────
// opts: { x: ['2026-01', ...], xLabel: fn, xLong: fn, series: [{ name, color, values }], format, height?, size?: 'lg' | 'sm' }
export function columnChart(el, opts) {
  const { x, series, format = fmt.int, xLabel = (v) => v, xLong = xLabel } = opts;
  el.classList.add('chart');
  const height = chartHeight(el, opts);
  el.replaceChildren();
  if (series.length > 1) el.appendChild(legend(series, 'box'));
  const holder = document.createElement('div');
  el.appendChild(holder);

  responsive(holder, (W) => {
    holder.replaceChildren();
    const m = { l: 50, r: 8, t: 10, b: 26 };
    const iw = W - m.l - m.r;
    const ih = height - m.t - m.b;
    const max = niceMax(Math.max(1, ...series.flatMap((s) => s.values)));
    const sy = (v) => m.t + ih - (v / max) * ih;
    const svg = svgEl('svg', { viewBox: `0 0 ${W} ${height}`, height, role: 'img', 'aria-label': opts.label || 'Column chart' }, holder);
    for (let k = 0; k <= 4; k++) {
      const v = (max / 4) * k;
      svgEl('line', { x1: m.l, x2: m.l + iw, y1: sy(v), y2: sy(v), stroke: k === 0 ? 'var(--axis)' : 'var(--grid)', 'stroke-width': 1 }, svg);
      text(svg, m.l - 8, sy(v) + 4, format(v), { 'text-anchor': 'end' });
    }
    const group = iw / x.length;
    const gap = 2;
    const bw = Math.max(2, Math.min(28, (group * 0.72 - gap * (series.length - 1)) / series.length));
    const every = W < 520 ? 2 : 1;
    x.forEach((xv, i) => {
      const gx = m.l + i * group + (group - (bw * series.length + gap * (series.length - 1))) / 2;
      if (i % every === 0) text(svg, m.l + i * group + group / 2, height - 6, xLabel(xv), { 'text-anchor': 'middle' });
      series.forEach((s, j) => {
        const v = s.values[i] ?? 0;
        const h = Math.max(0, sy(0) - sy(v));
        const bx = gx + j * (bw + gap);
        const r = Math.min(4, bw / 2, h);
        const by = sy(0) - h;
        const d = h <= 0 ? '' : `M${bx},${sy(0)} V${by + r} Q${bx},${by} ${bx + r},${by} H${bx + bw - r} Q${bx + bw},${by} ${bx + bw},${by + r} V${sy(0)} Z`;
        if (d) svgEl('path', { d, fill: s.colorAt ? s.colorAt(i) : s.color }, svg);
        const hit = svgEl('rect', { x: bx - 1, y: m.t, width: bw + gap, height: ih, fill: 'transparent', tabindex: 0, 'aria-label': `${s.name}, ${xLong(xv)}: ${format(v)}` }, svg);
        const on = (e) => {
          const rect = hit.getBoundingClientRect();
          showTip(e?.clientX ?? rect.left + rect.width / 2, e?.clientY ?? rect.top + 30, xLong(xv), [{ color: s.color, label: s.name, value: format(v) }]);
        };
        hit.addEventListener('pointermove', on);
        hit.addEventListener('focus', () => on());
        hit.addEventListener('pointerleave', hideTip);
        hit.addEventListener('blur', hideTip);
      });
    });
    if (firstDraw(holder)) motion.columns(svg);
  });
}

// ── Horizontal bar list (labels and values always visible) ─────────────────
// opts: { items: [{ label, value, color?, sub?, help? }], format }
export function barList(el, opts) {
  const { items, format = fmt.int } = opts;
  el.replaceChildren();
  if (!items.length) {
    const p = document.createElement('p');
    p.className = 'empty';
    p.textContent = 'No data for this period yet.';
    el.appendChild(p);
    return;
  }
  const max = Math.max(1, ...items.map((i) => i.value));
  const list = document.createElement('div');
  list.className = 'barlist';
  for (const it of items) {
    const row = document.createElement('div');
    row.className = 'barlist-row';
    const top = document.createElement('div');
    top.className = 'barlist-top';
    const l = document.createElement('span');
    l.className = 'barlist-label';
    l.textContent = it.label;
    if (it.sub) {
      const s = document.createElement('span');
      s.className = 'barlist-sub';
      s.textContent = it.sub;
      l.appendChild(s);
    }
    if (it.help) l.appendChild(helpIcon(it.help));
    const v = document.createElement('b');
    v.className = 'barlist-value';
    v.textContent = format(it.value);
    top.append(l, v);
    const track = document.createElement('div');
    track.className = 'barlist-track';
    const bar = document.createElement('div');
    bar.className = 'barlist-fill';
    bar.style.width = `${Math.max(1, (it.value / max) * 100)}%`;
    if (it.color) bar.style.background = it.color;
    track.appendChild(bar);
    row.append(top, track);
    list.appendChild(row);
  }
  el.appendChild(list);
  motion.bars(list);
}

// ── Data table (the accessible view of any chart) ──────────────────────────
// columns: [{ key, label, num?, format?, help? }]. A plain string is shorthand
// for { key: s, label: s }; `help` adds the (i) tooltip to the header.
export function dataTable(rawColumns, rowsData) {
  const columns = rawColumns.map((c) => (typeof c === 'string' ? { key: c, label: c } : c));
  const wrap = document.createElement('div');
  wrap.className = 'table-wrap';
  const table = document.createElement('table');
  table.className = 'data-table';
  const thead = table.createTHead().insertRow();
  for (const c of columns) {
    const th = document.createElement('th');
    th.textContent = c.label;
    if (c.help) th.appendChild(helpIcon(c.help));
    if (c.num) th.className = 'num';
    thead.appendChild(th);
  }
  const tbody = table.createTBody();
  for (const r of rowsData) {
    const tr = tbody.insertRow();
    for (const c of columns) {
      const td = tr.insertCell();
      const v = r[c.key];
      if (c.render) td.appendChild(c.render(r));
      else td.textContent = c.format ? c.format(v) : v ?? '';
      if (c.num) td.className = 'num';
    }
  }
  wrap.appendChild(table);
  return wrap;
}
