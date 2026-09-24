UPDATE businesses
SET description = 'Exact is a family clothing store inside Seshego Circle, Seshego, offering affordable fashion for men, women and children, including dresses, tops and shirts alongside a baby and kids range.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://businessfindersa.com/business/exact-seshego/", "https://south-africa.africa-places.com/places/exact-seshego-shop-2c", "https://centurionmall.co.za/stores/store-list/exact/"]'
WHERE slug = 'exact-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths is a fashion retailer inside Seshego Circle, Seshego, offering trend-led clothing, footwear and accessories for women and men alongside a lingerie and formalwear range.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/seshego/truworths-seshego-circle/76349", "https://www.facebook.com/Seshegocircle/photos/our-storeoftheday-today-is-our-truworths-fashion-what-is-your-favorite-item-to-b/1052693855428793/", "https://en.wikipedia.org/wiki/Truworths"]'
WHERE slug = 'truworths-seshego' AND description_enriched_at IS NULL;
