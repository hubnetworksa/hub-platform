UPDATE businesses
SET description = 'AutoZone Lebowakgomo is a motor spares and auto parts store in the Cash Build Centre, Lebowakgomo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 07:30-15:00, Sun 09:00-13:00'
WHERE slug = 'autozone-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'GreyTow Salon is a hair salon near Turfloop''s Gate 2, behind the Shoprite Centre in Mankweng, offering braiding and hair styling services including knotless braids.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.instagram.com/greytow_salon/", "https://www.facebook.com/GreyTowHairSalon/", "https://www.tiktok.com/@greytowsalon"]'
WHERE slug = 'greytow-salon-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Paledi Mall is a Woolworths supermarket and grocery store located in Paledi Mall, Mankweng.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-18:00, Wed 09:00-18:00, Thu 08:00-18:00, Fri 07:00-18:00, Sat 08:00-16:00, Sun 08:00-15:00'
WHERE slug = 'woolworths-paledi-mall-mankweng' AND description_enriched_at IS NULL;
