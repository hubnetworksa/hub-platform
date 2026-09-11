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
// click text to edit it in place, and place in the main content or in a
// left/right sidebar (see `zone`). The page's core info (name/description/
// photos/address/hours) is fixed and never rendered through here — an
// owner can only append sections and set the page's colors.
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
   *  on narrow screens regardless of this value. Meaningless (always
   *  full width of its column) for a sidebar block — see zone. */
  colSpan?: number;
  /** Which column of the page this section lives in — unset (or
   *  'main') for the normal column below the description, 'left'/'right'
   *  for a sidebar running alongside the *entire* fixed page content
   *  (name through hours), only present at all once an owner has placed
   *  at least one section there. */
  zone?: 'left' | 'right';
}

export const MIN_BLOCK_HEIGHT = 100;
export const MAX_BLOCK_HEIGHT = 480;
export const MIN_COL_SPAN = 3;
export const MAX_COL_SPAN = 12;

function heightStyle(block: CustomBlock, prop: 'min-height' | 'height'): string {
  if (!block.heightPx) return '';
  return `${prop}:${block.heightPx}px;`;
}

// The one style attribute on each block's outer .custom-block div —
// always carries --col-span (read by the CSS grid-column rule — a no-op
// for a sidebar block, whose column isn't a 12-wide grid, so it just
// stays full width there) and, when the block's been resized taller,
// min-height (a floor, so a photo type's own extra height rule below
// never conflicts with it).
function outerStyleAttr(block: CustomBlock): string {
  return ` style="--col-span:${block.colSpan || MAX_COL_SPAN};${heightStyle(block, 'min-height')}"`;
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
  const style = outerStyleAttr(block);

  switch (block.type) {
    case 'banner':
      return `<div class="custom-block custom-block-banner" data-block-index="${index}"${style}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy" />` : '<div class="photo-placeholder">No photo chosen</div>'}
        <div class="banner-overlay">
          <h2 data-field="title">${title}</h2>
          ${block.body ? `<p data-field="body">${body}</p>` : ''}
        </div>
      </div>`;
    case 'side-image': {
      const side = block.side === 'right' ? ' side-right' : '';
      const imgStyle = heightStyle(block, 'height');
      return `<div class="custom-block custom-block-side-image${side}" data-block-index="${index}"${style}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy"${imgStyle ? ` style="${imgStyle}"` : ''} />` : '<div class="photo-placeholder">No photo chosen</div>'}
        <div class="side-image-text">
          <h3 data-field="title">${title}</h3>
          <p data-field="body">${body || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
        </div>
      </div>`;
    }
    case 'photo': {
      const imgStyle = heightStyle(block, 'height');
      return `<div class="custom-block custom-block-photo" data-block-index="${index}"${style}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy"${imgStyle ? ` style="${imgStyle}"` : ''} />` : '<div class="photo-placeholder">No photo chosen</div>'}
        ${block.title ? `<p class="photo-caption" data-field="title">${title}</p>` : ''}
      </div>`;
    }
    case 'divider':
      return `<div class="custom-block custom-block-divider" data-block-index="${index}"${style}><hr /></div>`;
    case 'cta':
      return `<div class="custom-block custom-block-cta" data-block-index="${index}"${style}>
        <p class="cta-text" data-field="title">${title}</p>
        <span class="btn btn-primary cta-btn" data-field="body">${body || 'Get in touch'}</span>
      </div>`;
    case 'testimonial':
      return `<div class="custom-block custom-block-testimonial" data-block-index="${index}"${style}>
        <p class="testimonial-quote" data-field="body">&ldquo;${body}&rdquo;</p>
        <p class="testimonial-author" data-field="title">— ${title}</p>
      </div>`;
    default:
      return `<div class="custom-block" data-block-index="${index}"${style}>
        <h2 data-field="title">${title}</h2>
        <p data-field="body">${body.replace(/\n/g, '<br />') || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
      </div>`;
  }
}

// Renders one zone's worth of sections — the caller (business/[slug].astro)
// filters `blocks` by `zone` first and calls this once per zone (main,
// left sidebar, right sidebar), since each is its own independent ordered
// list stacked in its own column.
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
