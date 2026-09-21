UPDATE businesses
SET description = 'Asha''s Lifestyle House is a restaurant in Fauna Park with a broad African cuisine menu, including dishes such as chicken curry rice, pork ribs and chicken wings, served across both indoor and outdoor seating for dine-in or takeaway.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mrdfood.com/food-delivery/restaurant/ashas-lifestyle-house_fauna-park/15207", "https://za.polomap.com/polokwane/16235", "https://www.tiktok.com/@shantelle_ramsy/video/7240076804189474053"]'
WHERE slug = 'ashas-lifestyle-house-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Erasmus Dental is a dental practice in Fauna Park, providing dental care to the Fauna Park and greater Polokwane community.',
    description_enriched_at = datetime('now')
WHERE slug = 'erasmus-dental-fauna-park' AND description_enriched_at IS NULL;
