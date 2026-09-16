// Shared structured-data helper for every page that's fundamentally a
// listing of other pages (categories, suburbs, businesses, shopping
// centres, tenants) — a schema.org CollectionPage wrapping an ItemList,
// which is the documented shape for exactly this kind of page.

export interface CollectionItemLink {
  name: string;
  url: string;
}

export function collectionPageJsonLd({
  name,
  description,
  url,
  items,
}: {
  name: string;
  description?: string;
  url: string;
  items: CollectionItemLink[];
}) {
  return {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name,
    ...(description ? { description } : {}),
    url,
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
