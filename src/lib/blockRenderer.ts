// The ONE place custom-block HTML gets built — imported both by
// src/pages/business/[slug].astro (Node/build time, via Vite) and by
// src/pages/my-businesses/customize.astro's client script (browser, via
// the same Vite bundling for Astro client scripts). Before this, the two
// had separately hand-written copies of the same markup that had to be
// kept in sync by hand — exactly the kind of thing that quietly drifts
// after a few more feature requests. Now there's only one implementation
// to drift.
export interface BlockLayout {
  /** 1-indexed grid row. Blocks sharing a row sit side by side (grid
   *  auto-height per row, so nothing clips regardless of content length). */
  row: number;
  /** 0-11, left edge of the block's column span in the 12-column grid. */
  col: number;
  /** 1-12, how many columns wide. */
  w: number;
}

export interface BlockStyle {
  bg?: keyof typeof BG_STYLES;
  color?: keyof typeof TEXT_COLORS;
  font?: keyof typeof FONT_STYLES;
  spacing?: keyof typeof SPACING_STYLES;
}

export interface CustomBlock {
  type: string;
  title: string;
  body: string;
  /** R2 key for 'photo' blocks — reuses the same MEDIA bucket/serving
   *  endpoint as the gallery, just referenced by a block instead of the
   *  fixed gallery position. */
  imageKey?: string;
  /** Free-form grid placement — a 12-column grid that collapses to a
   *  single stacked column on mobile via CSS, so "place anywhere" stays
   *  safe on small screens instead of breaking like true pixel-absolute
   *  positioning would. Missing/undefined falls back to one full-width
   *  block per row, in array order — i.e. every page published before
   *  this feature existed renders exactly as it did before. */
  layout?: BlockLayout;
  style?: BlockStyle;
}

export const BLOCK_TYPES = ['story', 'specials', 'team', 'gallery', 'photo', 'testimonial', 'cta', 'divider'] as const;

export const BLOCK_TITLES: Record<string, string> = {
  story: 'Our Story',
  specials: 'Specials & Promotions',
  team: 'Team',
  gallery: 'Gallery',
  photo: 'Photo',
  testimonial: 'Testimonial',
  cta: 'Call to Action',
  divider: 'Divider',
};

export const GRID_COLUMNS = 12;

// Curated, safe style options — a fixed palette rather than a free-form
// color/font picker, so every combination stays legible and on-brand and
// nothing needs sanitizing beyond "is this key one of the known ones".
export const BG_STYLES = {
  none: 'transparent',
  card: 'var(--bg-card)',
  subtle: 'var(--bg-subtle)',
  tint: 'rgba(var(--accent-rgb), 0.08)',
  accent: 'var(--accent)',
  navy: 'var(--navy)',
} as const;

export const TEXT_COLORS = {
  default: 'var(--text)',
  muted: 'var(--text-muted)',
  white: '#ffffff',
  accent: 'var(--accent)',
} as const;

// 'serif'/'rounded' load an extra Google Font — business/[slug].astro only
// includes that <link> when a business's blocks actually use one, computed
// at build time, so pages that don't use them pay no extra cost.
export const FONT_STYLES = {
  default: 'inherit',
  serif: "'Playfair Display', Georgia, serif",
  rounded: "'Quicksand', inherit",
} as const;

export const SPACING_STYLES = {
  compact: '0.6rem 0.75rem',
  comfortable: '1rem 1.1rem',
  spacious: '1.75rem 1.85rem',
} as const;

export function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}

/** Blocks saved before free-form layout existed (or never touched by it)
 *  have no `layout` — treat them as one full-width block per row, in the
 *  order they're stored, which is exactly how they rendered before. */
export function layoutOf(block: CustomBlock, index: number): BlockLayout {
  return block.layout ?? { row: index + 1, col: 0, w: GRID_COLUMNS };
}

export function blockStyleAttr(style: BlockStyle | undefined): string {
  if (!style) return '';
  const decls: string[] = [];
  if (style.bg && style.bg in BG_STYLES) {
    decls.push(`background:${BG_STYLES[style.bg]}`);
    if (style.bg === 'accent' || style.bg === 'navy') decls.push('color:#fff');
  }
  if (style.color && style.color in TEXT_COLORS) decls.push(`color:${TEXT_COLORS[style.color]}`);
  if (style.font && style.font in FONT_STYLES) decls.push(`font-family:${FONT_STYLES[style.font]}`);
  if (style.spacing && style.spacing in SPACING_STYLES) decls.push(`padding:${SPACING_STYLES[style.spacing]}`);
  return decls.length ? ` style="${decls.join(';')}"` : '';
}

function renderOneBlock(block: CustomBlock, index: number): string {
  const title = escapeHtml(block.title || BLOCK_TITLES[block.type] || 'More');
  const body = escapeHtml(block.body || '');
  const { row, col, w } = layoutOf(block, index);
  const gridStyle = `grid-column:${col + 1} / span ${w};grid-row:${row}`;
  const extraStyle = blockStyleAttr(block.style);
  // extraStyle already starts with ` style="..."` (or is empty) — merge the
  // grid placement into the same attribute rather than emitting two.
  const styleAttr = extraStyle
    ? extraStyle.replace(' style="', ` style="${gridStyle};`)
    : ` style="${gridStyle}"`;

  switch (block.type) {
    case 'photo':
      return `<div class="custom-block custom-block-photo" data-block-index="${index}"${styleAttr}>
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy" />` : '<div class="photo-placeholder">No photo chosen</div>'}
        ${block.title ? `<p class="photo-caption" data-field="title">${title}</p>` : ''}
      </div>`;
    case 'divider':
      return `<div class="custom-block custom-block-divider" data-block-index="${index}"${styleAttr}><hr /></div>`;
    case 'cta':
      return `<div class="custom-block custom-block-cta" data-block-index="${index}"${styleAttr}>
        <p class="cta-text" data-field="title">${title}</p>
        <span class="btn btn-primary cta-btn" data-field="body">${body || 'Get in touch'}</span>
      </div>`;
    case 'testimonial':
      return `<div class="custom-block custom-block-testimonial" data-block-index="${index}"${styleAttr}>
        <p class="testimonial-quote" data-field="body">&ldquo;${body}&rdquo;</p>
        <p class="testimonial-author" data-field="title">— ${title}</p>
      </div>`;
    default:
      return `<div class="custom-block" data-block-index="${index}"${styleAttr}>
        <h2 data-field="title">${title}</h2>
        <p data-field="body">${body.replace(/\n/g, '<br />') || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
      </div>`;
  }
}

export function usesExtraFont(blocks: CustomBlock[]): boolean {
  return blocks.some((b) => b.style?.font === 'serif' || b.style?.font === 'rounded');
}

// Passed to BaseLayout's `extraFonts` prop — must match the family names
// used in FONT_STYLES above.
export const EXTRA_FONTS_QUERY = 'family=Playfair+Display:wght@700&family=Quicksand:wght@500;700';

export function renderCustomBlocksHtml(blocks: CustomBlock[]): string {
  if (!blocks.length) return '';
  // The extra wrapper establishes container-size containment scoped to just
  // this feature (rather than the site-wide .container class), so the
  // mobile collapse below is driven by container queries and correctly
  // previews inside the customize page's own width-constrained preview
  // frame — a real @media breakpoint wouldn't fire there, since narrowing
  // that preview only shrinks a container, not the actual browser viewport.
  return `<div class="custom-blocks-container">
    <div class="custom-blocks">${blocks.map(renderOneBlock).join('')}</div>
  </div>`;
}
