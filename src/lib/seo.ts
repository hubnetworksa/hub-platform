// Shared structured-data helper for every page that's fundamentally a
// listing of other pages (categories, suburbs, businesses, shopping
// centres, tenants) — a schema.org CollectionPage wrapping an ItemList,
// which is the documented shape for exactly this kind of page.

import { organizationRef, websiteRef } from './schema';
import { lastModifiedFor } from './sitemap';

export interface CollectionItemLink {
  name: string;
  url: string;
}

export function collectionPageJsonLd({
  name,
  description,
  url,
  items,
  keywords,
  dateModified,
}: {
  name: string;
  description?: string;
  url: string;
  items: CollectionItemLink[];
  keywords?: string[];
  /** Defaults to the page's sitemap <lastmod> (src/lib/sitemap.ts). */
  dateModified?: string;
}) {
  return {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name,
    ...(description ? { description } : {}),
    url,
    inLanguage: 'en-ZA',
    isPartOf: websiteRef(),
    publisher: organizationRef(),
    dateModified: dateModified ?? lastModifiedFor(new URL(url).pathname),
    ...(keywords && keywords.length > 0 ? { keywords: keywords.join(', ') } : {}),
    mainEntity: {
      '@type': 'ItemList',
      itemListElement: items.map((item, index) => ({
        '@type': 'ListItem',
        position: index + 1,
        name: item.name,
        url: item.url,
      })),
    },
  };
}
