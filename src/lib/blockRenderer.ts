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
// click text to edit it in place. The page's core info (name, address,
// etc.) is a separate, similarly free-form layer — see the core-item
// rendering in src/pages/business/[slug].astro — so this file only ever
// deals with the sections an owner explicitly added.
export interface CustomBlock {
  /** 'core' for one of the page's fixed info pieces (name, address, a
   *  contact button, etc.), repositioned/resized like any other item but
   *  never carrying its own content — see coreId. Absent (or 'custom')
   *  for an owner-added section, which does carry its own content below. */
  kind?: 'core' | 'custom';
  /** kind: 'core' only — which piece of the page's info this is. See
   *  CORE_ITEM_IDS. */
  coreId?: string;
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
   *  on narrow screens regardless of this value. */
  colSpan?: number;
}

export const MIN_BLOCK_HEIGHT = 100;
export const MAX_BLOCK_HEIGHT = 480;
export const MIN_COL_SPAN = 3;
export const MAX_COL_SPAN = 12;

// The page's core info, expressed as the same kind of grid item as an
// owner-added section — see the per-id rendering in
// src/pages/business/[slug].astro (needs live business/suburb/category
// data a shared renderer here has no access to). A stored block with
// kind 'core' only ever carries coreId/colSpan/heightPx — its actual
// content always comes fresh from the business record, never from what's
// stored, so editing a business's name/address/etc. still only happens
// on the real edit form, not by typing into the page-builder grid.
export const CORE_ITEM_IDS = [
  'name', 'tags', 'description', 'address',
  'action-website', 'action-phone', 'action-email', 'action-maps',
  'hours',
] as const;
function heightStyle(block: CustomBlock, prop: 'min-height' | 'height'): string {
  if (!block.heightPx) return '';
  return `${prop}:${block.heightPx}px;`;
}

// The one style attribute on each item's outer div (core or custom) —
// always carries --col-span (read by the CSS grid-column rule) and, when
// the item's been resized taller, min-height (a floor, so a photo type's
// own extra height rule below never conflicts with it). Exported since
// business/[slug].astro's core-item rendering needs the exact same
// wrapper style a custom block gets.
export function outerStyleAttr(block: CustomBlock): string {
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

  switch (block.type) {
    case 'banner':
      return `<div class="custom-block custom-block-banner" data-block-index="${index}"${outerStyleAttr(block)}>
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

// The one grid that holds everything on a Premium page: the fixed info
// (name, address, a contact button, hours — kind 'core', rendered by the
// caller-supplied renderCoreItem since only the page itself has the live
// business/suburb/category data those need) interleaved, in whatever
// order they're stored in, with the sections an owner explicitly added
// (kind 'custom' or unset, rendered here as always).
export function renderFullLayoutHtml(items: CustomBlock[], renderCoreItem: (item: CustomBlock) => string): string {
  if (!items.length) return '';
  const html = items.map((item, i) => (item.kind === 'core' ? renderCoreItem(item) : renderOneBlock(item, i))).join('');
  return `<div class="custom-blocks">${html}</div>`;
}
