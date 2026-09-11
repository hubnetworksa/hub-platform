// The ONE place custom-block HTML gets built — imported both by
// src/pages/business/[slug].astro (Node/build time, via Vite) and by
// src/pages/my-businesses/customize.astro's client script (browser, via
// the same Vite bundling for Astro client scripts). Before this, the two
// had separately hand-written copies of the same markup that had to be
// kept in sync by hand — exactly the kind of thing that quietly drifts
// after a few more feature requests. Now there's only one implementation
// to drift.
//
// Renders the custom sections an owner appends to their page — drag to
// reorder or place side by side, drag an edge to resize width or height,
// click text to edit it in place. The page's core info (name/description/
// photos/address/hours) is fixed and never rendered through here — an
// owner can only append sections below it and set the page's colors.
export interface CustomBlock {
  type: string;
  title: string;
  body: string;
  /** R2 key for 'photo'/'banner'/'side-image' blocks — reuses the same
   *  MEDIA bucket/serving endpoint as the gallery, just referenced by a
   *  block instead of the fixed gallery position. */
  imageKey?: string;
  /** 'side-image' only — which side the image sits on. */
  side?: 'left' | 'right';
  /** Height in px, set by dragging the block's bottom resize handle —
   *  applies to every block type. For banner/photo/side-image this also
   *  sets the photo's own height; for text types it's a floor (the box
   *  can always grow taller than its text, never clips shorter). Falls
   *  back to each type's own natural/CSS-default height when unset. */
  heightPx?: number;
  /** How many of the page's 12 layout columns this section spans (3-12),
   *  set by dragging the block's side resize handle — this is what lets
   *  two sections sit next to each other instead of always full-width.
   *  Falls back to 12 (full width) when unset. Collapses to full width
   *  on narrow screens regardless of this value. Ignored when bleed is
   *  'full' (colSpan has no meaning at 100vw); still sets the panel's
   *  width, as a fraction of the browser width instead of the 720px
   *  column, when bleed is 'left'/'right'. */
  colSpan?: number;
  /** Set via the section's "Layout" control — breaks the section out of
   *  the page's otherwise-fixed 720px reading column so it can use the
   *  empty space on either side, while the rest of the page
   *  (name/description/address/hours, and any other section) stays put.
   *  'full': spans the entire browser width edge to edge. 'left'/'right':
   *  a panel anchored to that edge of the browser instead, sized by
   *  colSpan as a fraction of the browser width rather than the column. */
  bleed?: 'full' | 'left' | 'right';
}

export const MIN_BLOCK_HEIGHT = 100;
export const MAX_BLOCK_HEIGHT = 480;
export const MIN_COL_SPAN = 3;
export const MAX_COL_SPAN = 12;

function heightStyle(block: CustomBlock, prop: 'min-height' | 'height'): string {
  if (!block.heightPx) return '';
  return `${prop}:${block.heightPx}px;`;
}

// The one style attribute on each block's outer .custom-block div — for
// a normal (non-bleed) block, --col-span (read by the CSS grid-column
// rule) plus, when the block's been resized taller, min-height (a floor,
// so a photo type's own extra height rule below never conflicts with
// it). A bleed block's width instead comes from its wrapBleed() wrapper,
// so --col-span would do nothing there — only min-height still applies.
function innerStyleAttr(block: CustomBlock): string {
  if (block.bleed) {
    const heightPart = heightStyle(block, 'min-height');
    return heightPart ? ` style="${heightPart}"` : '';
  }
  return ` style="--col-span:${block.colSpan || MAX_COL_SPAN};${heightStyle(block, 'min-height')}"`;
}

// Everything the switch below returns is one normal grid cell (its width
// set by --col-span, see innerStyleAttr) *unless* the section has a
// bleed layout, in which case it's wrapped in an outer strip that spans
// the full grid row and, in turn, the full browser width — full-width
// centered for 'full', or a colSpan-wide panel flush against that edge
// of the browser for 'left'/'right'. The inner .custom-block itself is
// untouched either way, so every block type's own styling still applies.
function wrapBleed(block: CustomBlock, html: string): string {
  if (!block.bleed) return html;
  const justify = block.bleed === 'left' ? 'flex-start' : block.bleed === 'right' ? 'flex-end' : 'center';
  const panelWidth = block.bleed === 'full' ? '100vw' : `${((block.colSpan || MAX_COL_SPAN) / MAX_COL_SPAN) * 100}vw`;
  return `<div class="custom-block-bleed" style="grid-column:1/-1;width:100vw;position:relative;left:50%;transform:translateX(-50%);display:flex;justify-content:${justify};box-sizing:border-box;">
    <div style="width:${panelWidth};max-width:100vw;box-sizing:border-box;">${html}</div>
  </div>`;
}

export const BLOCK_TYPES = ['banner', 'side-image', 'story', 'specials', 'team', 'gallery', 'photo', 'testimonial', 'cta', 'divider'] as const;

export const BLOCK_TITLES: Record<string, string> = {
  banner: 'Banner',
  'side-image': 'Image + Text',
  story: 'Our Story',
  specials: 'Specials & Promotions',
  team: 'Team',
  gallery: 'Gallery',
  photo: 'Photo',
  testimonial: 'Testimonial',
  cta: 'Call to Action',
  divider: 'Divider',
};

export function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}

function renderOneBlock(block: CustomBlock, index: number): string {
  const title = escapeHtml(block.title || BLOCK_TITLES[block.type] || 'More');
  const body = escapeHtml(block.body || '');
  const style = innerStyleAttr(block);

  let html: string;
  switch (block.type) {
    case 'banner':
      html = `<div class="custom-block custom-block-banner" data-block-index="${index}"${style}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy" />` : '<div class="photo-placeholder">No photo chosen</div>'}
        <div class="banner-overlay">
          <h2 data-field="title">${title}</h2>
          ${block.body ? `<p data-field="body">${body}</p>` : ''}
        </div>
      </div>`;
      break;
    case 'side-image': {
      const side = block.side === 'right' ? ' side-right' : '';
      const imgStyle = heightStyle(block, 'height');
      html = `<div class="custom-block custom-block-side-image${side}" data-block-index="${index}"${style}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy"${imgStyle ? ` style="${imgStyle}"` : ''} />` : '<div class="photo-placeholder">No photo chosen</div>'}
        <div class="side-image-text">
          <h3 data-field="title">${title}</h3>
          <p data-field="body">${body || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
        </div>
      </div>`;
      break;
    }
    case 'photo': {
      const imgStyle = heightStyle(block, 'height');
      html = `<div class="custom-block custom-block-photo" data-block-index="${index}"${style}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy"${imgStyle ? ` style="${imgStyle}"` : ''} />` : '<div class="photo-placeholder">No photo chosen</div>'}
        ${block.title ? `<p class="photo-caption" data-field="title">${title}</p>` : ''}
      </div>`;
      break;
    }
    case 'divider':
      html = `<div class="custom-block custom-block-divider" data-block-index="${index}"${style}><hr /></div>`;
      break;
    case 'cta':
      html = `<div class="custom-block custom-block-cta" data-block-index="${index}"${style}>
        <p class="cta-text" data-field="title">${title}</p>
        <span class="btn btn-primary cta-btn" data-field="body">${body || 'Get in touch'}</span>
      </div>`;
      break;
    case 'testimonial':
      html = `<div class="custom-block custom-block-testimonial" data-block-index="${index}"${style}>
        <p class="testimonial-quote" data-field="body">&ldquo;${body}&rdquo;</p>
        <p class="testimonial-author" data-field="title">— ${title}</p>
      </div>`;
      break;
    default:
      html = `<div class="custom-block" data-block-index="${index}"${style}>
        <h2 data-field="title">${title}</h2>
        <p data-field="body">${body.replace(/\n/g, '<br />') || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
      </div>`;
  }
  return wrapBleed(block, html);
}

export function renderCustomBlocksHtml(blocks: CustomBlock[]): string {
  // Defensive: an earlier build of this feature briefly let a business's
  // stored blocks carry the page's fixed info (name/address/etc.) as a
  // "core" kind item mixed in with real sections. That's gone now, but a
  // business that saved a draft/live layout during that window could
  // still have one sitting in its data — silently drop it rather than
  // let this file's default case render it as a broken empty section.
  const sections = blocks.filter((b: { kind?: string }) => b.kind !== 'core');
  if (!sections.length) return '';
  return `<div class="custom-blocks">${sections.map(renderOneBlock).join('')}</div>`;
}
