UPDATE businesses
SET description = 'Theo Goosen Estate Agents & Auctioneers has served the Limpopo property market from Polokwane since 1960, handling residential, commercial, industrial and farm property sales as well as property auctions. The firm relocated to its current General Maritz Street, Bendor office in early 2025.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed',
    source_urls = '["https://www.theogoosen.co.za/", "https://www.citizen.co.za/review-online/theo-goosen-estate-agents-auctioneers/", "https://www.property24.com/estate-agents/theo-goosen-estate-agents-and-auctioneers/25702", "https://www.citizen.co.za/review-online/news-headlines/local-news/2025/02/09/new-home-for-well-known-estate-agents/", "https://www.shopshours.co.za/estate-agency/polokwane/2"]'
WHERE slug = 'theo-goosen-estate-agents-auctioneers-bendor' AND description_enriched_at IS NULL;
