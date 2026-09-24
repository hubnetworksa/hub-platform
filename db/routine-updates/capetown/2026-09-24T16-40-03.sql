-- Job 4: description enrichment sweep (7 businesses, full backlog)

UPDATE businesses
SET description = 'Be-Dazzle Hair and Beauty Salon is a hair, beauty and slimming salon in Access Park, Kenilworth, offering hair colouring, treatments, manicures, pedicures, waxing and laser hair removal, open since 2012.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 08:00-17:00, Thu-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://www.facebook.com/bedazzle.accesspark/", "https://www.hotfrog.co.za/company/1099860278091776/be-dazzle-hair-and-beauty-salon/kenilworth/cosmetics", "https://healthspas.co.za/spa/be-dazzle/kenilworth/"]'
WHERE slug = 'be-dazzle-hair-and-beauty-salon-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers at Constantia Emporium is a flagship supermarket store that opened in 2019, bringing an upmarket grocery offering to the Constantia community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/checkers-ladies-mile-road-constantia/54168", "https://www.cybo.com/ZA-biz/checkers-fx-constantia", "https://www.shopriteholdings.co.za/articles/Newsroom/2019/checkers-brings-world-class-retail-to-constantia-with-new-flagsh.html"]'
WHERE slug = 'checkers-constantia-emporium-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy and health, beauty and homeware retailer located within Wynberg Centre on Main Road, Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:30-16:00, Sun 09:00-13:00'
WHERE slug = 'clicks-wynberg-centre-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy and health, beauty and lifestyle retailer located within Constantia Emporium on Ladies Mile Road, Constantia.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-19:00, Tue 08:30-19:00, Wed-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'clicks-constantia-emporium-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem is a pharmacy and health retailer on Main Road in Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'dis-chem-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Infinite Smiles Dental Practice is a dental practice within Kenilworth Centre offering general dentistry alongside cosmetic and restorative treatments such as crowns, bridges, dentures, fillings and same-day denture repairs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-16:30, Fri-Sat 09:00-12:00, Sun Closed'
WHERE slug = 'infinite-smiles-dental-practice-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Maynard Mall is a supermarket inside Maynard Mall on Main Road, Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 08:00-17:00, Sun 08:00-14:00'
WHERE slug = 'shoprite-maynard-mall-wynberg' AND description_enriched_at IS NULL;
