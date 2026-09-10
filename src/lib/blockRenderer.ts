// The ONE place custom-block HTML gets built — imported both by
// src/pages/business/[slug].astro (Node/build time, via Vite) and by
// src/pages/my-businesses/customize.astro's client script (browser, via
// the same Vite bundling for Astro client scripts). Before this, the two
// had separately hand-written copies of the same markup that had to be
// kept in sync by hand — exactly the kind of thing that quietly drifts
// after a few more feature requests. Now there's only one implementation
// to drift.
export interface CustomBlock {
  type: string;
  title: string;
  body: string;
  /** R2 key for 'photo' blocks — reuses the same MEDIA bucket/serving
   *  endpoint as the gallery, just referenced by a block instead of the
   *  fixed gallery position. */
  imageKey?: string;
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

export function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}

function renderOneBlock(block: CustomBlock, index: number): string {
  const title = escapeHtml(block.title || BLOCK_TITLES[block.type] || 'More');
  const body = escapeHtml(block.body || '');

  switch (block.type) {
    case 'photo':
      return `<div class="custom-block custom-block-photo" data-block-index="${index}">
        ${block.imageKey ? `<img src="/media/${block.imageKey}" alt="${title}" loading="lazy" />` : '<div class="photo-placeholder">No photo chosen</div>'}
        ${block.title ? `<p class="photo-caption" data-field="title">${title}</p>` : ''}
      </div>`;
    case 'divider':
      return `<div class="custom-block custom-block-divider" data-block-index="${index}"><hr /></div>`;
    case 'cta':
      return `<div class="custom-block custom-block-cta" data-block-index="${index}">
        <p class="cta-text" data-field="title">${title}</p>
        <span class="btn btn-primary cta-btn" data-field="body">${body || 'Get in touch'}</span>
      </div>`;
    case 'testimonial':
      return `<div class="custom-block custom-block-testimonial" data-block-index="${index}">
        <p class="testimonial-quote" data-field="body">&ldquo;${body}&rdquo;</p>
        <p class="testimonial-author" data-field="title">— ${title}</p>
      </div>`;
    default:
      return `<div class="custom-block" data-block-index="${index}">
        <h2 data-field="title">${title}</h2>
        <p data-field="body">${body.replace(/\n/g, '<br />') || '<span class="placeholder-text">(empty — add some text)</span>'}</p>
      </div>`;
  }
}

export function renderCustomBlocksHtml(blocks: CustomBlock[], template: string): string {
  if (!blocks.length) return '';
  const grid = template === 'services';
  return `<div class="custom-blocks${grid ? ' grid' : ''}">${blocks.map(renderOneBlock).join('')}</div>`;
}
