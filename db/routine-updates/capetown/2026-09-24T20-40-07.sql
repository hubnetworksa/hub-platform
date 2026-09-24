UPDATE businesses
SET description = 'Brad''s Grill is a restaurant and takeaway in Harfield Village, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'brads-grill-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SVG Autoworks is an independent BMW and MINI specialist workshop in Southfield, offering vehicle servicing, diagnostics and repairs, with online booking and Saturday appointments available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:00',
    source_urls = '["https://za.africabz.com/western-cape/svg-autoworks-107939", "https://za.polomap.com/cape-town/29635", "https://www.facebook.com/SVGautoworks/", "https://miwa-members.miwa.org.za/?listing=svg-autoworks"]'
WHERE slug = 'svg-autoworks-southfield' AND description_enriched_at IS NULL;
