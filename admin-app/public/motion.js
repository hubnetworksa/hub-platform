// Hub Admin motion: one page transition, one-time counters, the nav pill
// slide, and small responses to actions (pop, shake, badge). Chart draw-ins
// and the sign-in card are the only other movement.
// Everything here is decoration: with GSAP missing or "reduce motion" on,
// every function returns without touching the page, so content is always
// visible in its final state.

const gsap = () => window.gsap;
const reduced = () => window.matchMedia('(prefers-reduced-motion: reduce)').matches;
const on = () => !!gsap() && !reduced();
const EASE = 'power3.out';
let lastPageKey;

// Numbers in tiles count up to their value, keeping prefixes/suffixes
// ("R1,234", "44.2k", "39%").
function countUp(el, delay = 0) {
  const text = el.textContent.trim();
  const m = text.match(/^([^\d-]*)(-?[\d,]*\.?\d+)(.*)$/);
  if (!m) return;
  const [, pre, num, post] = m;
  const target = Number(num.replace(/,/g, ''));
  if (!Number.isFinite(target) || target === 0) return;
  const decimals = (num.split('.')[1] || '').length;
  const grouped = num.includes(',') || target >= 1000;
  const fmt = (v) => pre + (grouped ? v.toLocaleString('en-ZA', { minimumFractionDigits: decimals, maximumFractionDigits: decimals }) : v.toFixed(decimals)) + post;
  const o = { v: 0 };
  el.textContent = fmt(0);
  gsap().to(o, { v: target, duration: 1.1, delay, ease: 'power2.out', onUpdate: () => (el.textContent = fmt(o.v)), onComplete: () => (el.textContent = text) });
}

export const motion = {
  // A screen arriving: the content fades in and rises 8px, once per
  // navigation (`key` changes on every route change; later redraws of the
  // same screen stay still). Tile numbers count up once on that first paint.
  page(root, key) {
    if (!on() || !root) return;
    if (key !== undefined) {
      if (key === lastPageKey) return;
      lastPageKey = key;
    }
    const g = gsap();
    g.fromTo(root, { autoAlpha: 0, y: 8 }, { autoAlpha: 1, y: 0, duration: 0.28, ease: EASE, clearProps: 'opacity,visibility,transform' });
    root.querySelectorAll('.tiles .tile .value, .kpis .tile .value').forEach((v, i) => countUp(v, 0.05 + i * 0.04));
    root.querySelectorAll('.stats-row b').forEach((b, i) => countUp(b, 0.1 + i * 0.03));
  },

  // The sign-in / setup card.
  auth(card) {
    if (!on() || !card) return;
    const g = gsap();
    const tl = g.timeline({ defaults: { ease: EASE } });
    tl.from(card, { y: 40, autoAlpha: 0, scale: 0.94, duration: 0.7, ease: 'expo.out' })
      .from(card.querySelector('.auth-logo'), { scale: 0.4, rotation: -20, autoAlpha: 0, duration: 0.7, ease: 'back.out(2)' }, 0.15)
      .from(card.querySelectorAll(':scope > h1, :scope > .auth-sub'), { y: 10, autoAlpha: 0, duration: 0.45, stagger: 0.06 }, 0.25)
      .from(card.querySelectorAll(':scope > .btn, :scope > .or, form .field, form .btn, :scope > .linkish, :scope > .banner'), { y: 12, autoAlpha: 0, duration: 0.45, stagger: 0.05 }, 0.35);
    g.to(card.querySelector('.auth-logo'), { y: -4, duration: 2.2, ease: 'sine.inOut', yoyo: true, repeat: -1, delay: 1 });
  },

  // Something new appearing (an invite link, a saved message).
  pop(el) {
    if (!on() || !el) return;
    gsap().from(el, { scale: 0.92, autoAlpha: 0, y: 8, duration: 0.5, ease: 'back.out(1.8)' });
  },

  // The briefing writes itself in: headline, then each line.
  brief(card) {
    if (!on() || !card) return;
    const g = gsap();
    g.timeline({ defaults: { ease: EASE } })
      .from(card.querySelector('.brief-headline'), { y: 10, autoAlpha: 0, duration: 0.6 })
      .from(card.querySelectorAll('.brief-block h3, .brief-list li'), { y: 8, autoAlpha: 0, duration: 0.4, stagger: 0.06 }, 0.2);
  },

  // A shake for a wrong password / refused form.
  shake(el) {
    if (!on() || !el) return;
    gsap().fromTo(el, { x: 0 }, { x: 8, duration: 0.07, repeat: 5, yoyo: true, ease: 'sine.inOut', clearProps: 'x' });
  },

  // Line charts draw themselves from left to right; end labels fade in after.
  lines(svg) {
    if (!on() || !svg) return;
    const g = gsap();
    svg.querySelectorAll('path[stroke-width="2"]').forEach((p, i) => {
      const len = p.getTotalLength();
      g.fromTo(p, { strokeDasharray: len, strokeDashoffset: len }, { strokeDashoffset: 0, duration: 1.3, delay: 0.1 + i * 0.12, ease: 'power2.inOut', clearProps: 'strokeDasharray,strokeDashoffset' });
    });
    g.from(svg.querySelectorAll('text[font-weight="600"]'), { autoAlpha: 0, x: -6, duration: 0.5, delay: 1.1, stagger: 0.08 });
  },

  // Column charts grow up from the baseline.
  columns(svg) {
    if (!on() || !svg) return;
    gsap().from(svg.querySelectorAll('path[fill]'), { scaleY: 0, transformOrigin: '50% 100%', duration: 0.8, ease: 'power3.out', stagger: { each: 0.012, from: 'start' } });
  },

  // Horizontal bar lists fill in.
  bars(container) {
    if (!on() || !container) return;
    const fills = [...container.querySelectorAll('.barlist-fill')];
    gsap().from(fills, { width: 0, duration: 0.9, ease: 'power3.out', stagger: 0.06, delay: 0.2 });
  },

  // The highlight behind the active nav item slides to it.
  nav(container, active, axis = 'y') {
    if (!container || !active) return;
    let pill = container.querySelector(':scope > .nav-pill');
    if (!pill) {
      pill = document.createElement('span');
      pill.className = 'nav-pill';
      container.prepend(pill);
    }
    const box = { x: active.offsetLeft, y: active.offsetTop, width: active.offsetWidth, height: active.offsetHeight };
    if (!on() || !pill.dataset.placed) {
      Object.assign(pill.style, { transform: `translate(${box.x}px, ${box.y}px)`, width: `${box.width}px`, height: `${box.height}px` });
      pill.dataset.placed = '1';
      return;
    }
    gsap().to(pill, { x: box.x, y: box.y, width: box.width, height: box.height, duration: 0.45, ease: 'power3.out', overwrite: true });
  },

  // The "needs attention" badge pops when its number changes.
  badge(el) {
    if (!on() || !el || el.hidden) return;
    gsap().fromTo(el, { scale: 1.5 }, { scale: 1, duration: 0.5, ease: 'back.out(3)' });
  },
};

window.__hubMotion = motion;
