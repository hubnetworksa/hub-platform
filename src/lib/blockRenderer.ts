// The ONE place custom-block HTML gets built — imported both by
// src/pages/business/[slug].astro (Node/build time, via Vite) and by
// src/pages/my-businesses/customize.astro's client script (browser, via
// the same Vite bundling for Astro client scripts). Before this, the two
// had separately hand-written copies of the same markup that had to be
// kept in sync by hand — exactly the kind of thing that quietly drifts
// after a few more feature requests. Now there's only one implementation
// to drift.
//
// Deliberately simple by design, not by omission: the page's layout is
// fixed (name/description/photos/address/hours never move or get
// restyled) — an owner can only append pre-built sections, drag them to
// reorder or place them side by side, drag a section's edge to resize its
// width and (for photo sections) its height, and set the page's overall
// colors. No per-block style panel — that was tried and was too complex
// for owners who just want their page to look good without learning an
// editor.
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
  /** 'banner'/'photo'/'side-image' only — image height in px, set by
   *  dragging the block's bottom resize handle. Ignored by text-only
   *  block types, which always size to their content instead. Falls
   *  back to each type's own CSS default when unset. */
  heightPx?: number;
  /** How many of the page's 12 layout columns this section spans (3-12),
   *  set by dragging the block's side resize handle — this is what lets
   *  two sections sit next to each other instead of always full-width.
   *  Falls back to 12 (full width) when unset. Collapses to full width
   *  on narrow screens regardless of this value. */
  colSpan?: number;
}

export const MIN_BLOCK_HEIGHT = 100;
export const MAX_BLOCK_HEIGHT = 480;
export const MIN_COL_SPAN = 3;
export const MAX_COL_SPAN = 12;
const SIZED_TYPES = new Set(['banner', 'photo', 'side-image']);

function heightStyle(block: CustomBlock, prop: 'min-height' | 'height'): string {
  if (!SIZED_TYPES.has(block.type) || !block.heightPx) return '';
  return `${prop}:${block.heightPx}px;`;
}

// The one style attribute on each block's outer .custom-block div — always
// carries --col-span (read by the .custom-block CSS rule as a CSS Grid
// span), plus min-height for a resized banner (photo/side-image's own img
// height is set separately, see below).
function outerStyleAttr(block: CustomBlock, extra: string = ''): string {
  return ` style="--col-span:${block.colSpan || MAX_COL_SPAN};${extra}"`;
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

  switch (block.type) {
    case 'banner':
      return `<div class="custom-block custom-block-banner" data-block-index="${index}"${outerStyleAttr(block, heightStyle(block, 'min-height'))}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy" />` : '<div class="photo-placeholder">No photo chosen</div>'}
        <div class="banner-overlay">
          <h2 data-field="title">${title}</h2>
          ${block.body ? `<p data-field="body">${body}</p>` : ''}
        </div>
      </div>`;
    case 'side-image': {
      const side = block.side === 'right' ? ' side-right' : '';
      const imgStyle = heightStyle(block, 'height');
      return `<div class="custom-block custom-block-side-image${side}" data-block-index="${index}"${outerStyleAttr(block)}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy"${imgStyle ? ` style="${imgStyle}"` : ''} />` : '<div class="photo-placeholder">No photo chosen</div>'}
        <div class="side-image-text">
          <h3 data-field="title">${title}</h3>
          <p data-field="body">${body || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
        </div>
      </div>`;
    }
    case 'photo': {
      const imgStyle = heightStyle(block, 'height');
      return `<div class="custom-block custom-block-photo" data-block-index="${index}"${outerStyleAttr(block)}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy"${imgStyle ? ` style="${imgStyle}"` : ''} />` : '<div class="photo-placeholder">No photo chosen</div>'}
        ${block.title ? `<p class="photo-caption" data-field="title">${title}</p>` : ''}
      </div>`;
    }
    case 'divider':
      return `<div class="custom-block custom-block-divider" data-block-index="${index}"${outerStyleAttr(block)}><hr /></div>`;
    case 'cta':
      return `<div class="custom-block custom-block-cta" data-block-index="${index}"${outerStyleAttr(block)}>
        <p class="cta-text" data-field="title">${title}</p>
        <span class="btn btn-primary cta-btn" data-field="body">${body || 'Get in touch'}</span>
      </div>`;
    case 'testimonial':
      return `<div class="custom-block custom-block-testimonial" data-block-index="${index}"${outerStyleAttr(block)}>
        <p class="testimonial-quote" data-field="body">&ldquo;${body}&rdquo;</p>
        <p class="testimonial-author" data-field="title">— ${title}</p>
      </div>`;
    default:
      return `<div class="custom-block" data-block-index="${index}"${outerStyleAttr(block)}>
        <h2 data-field="title">${title}</h2>
        <p data-field="body">${body.replace(/\n/g, '<br />') || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
      </div>`;
  }
}

export function renderCustomBlocksHtml(blocks: CustomBlock[]): string {
  if (!blocks.length) return '';
  return `<div class="custom-blocks">${blocks.map(renderOneBlock).join('')}</div>`;
}
