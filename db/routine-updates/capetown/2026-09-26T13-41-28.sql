-- Job 4: description enrichment sweep, batch 2 of 2 (3 records)
UPDATE businesses
SET description = 'Quagga Rare Books & Art is a family-owned antiquarian bookshop in Kalk Bay specialising in rare and unusual books and art, trading since 1990.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:30-17:00, Sun 10:00-17:00',
    source_urls = '["https://quaggabooks.co.za/contact/", "https://www.cybo.com/ZA-biz/quagga-rare-books-and-art_1x", "https://ilab.org/affiliate/quagga-rare-books-art"]'
WHERE slug = 'quagga-rare-books-and-art-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Board Shop is a surf and skateboard retailer in Kommetjie.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-board-shop-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Reef is a seafood restaurant in Kalk Bay serving oysters, mussels and calamari with sea views.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-reef-kalk-bay' AND description_enriched_at IS NULL;
