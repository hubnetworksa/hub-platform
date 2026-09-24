UPDATE businesses
SET description = 'Health on Point is a boutique pharmacy on Surrey Place in Mouille Point, offering prescription dispensing, in-store consultations, and a range of medicines, vitamins, supplements and skincare products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://www.healthonpoint.co.za/contact", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1841561", "https://www.healthonpoint.co.za/about"]'
WHERE slug = 'health-on-point-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro Spa is a massage and spa treatment provider in Bantry Bay offering professional massage therapy, including detox massage packages, in a private, discreet setting.',
    description_enriched_at = datetime('now')
WHERE slug = 'pro-spa-bantry-bay' AND description_enriched_at IS NULL;
