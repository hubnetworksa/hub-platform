UPDATE businesses
SET description = 'Simply Asia is a Thai restaurant inside Howard Centre, Pinelands, serving stir-fries, red and green curries, noodles and other Thai specialties.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/simply-asia-pinelands/", "https://stores.simplyasia.co.za/details/pinelands", "https://www.tripadvisor.co.za/Restaurant_Review-g2712907-d7856059-Reviews-Simply_Asia_Pinelands-Pinelands_Western_Cape.html"]'
WHERE slug = 'simply-asia-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sneaker Box is a footwear store inside Access Park, Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'sneaker-box-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Bothasig is a fast-food restaurant inside Bothasig Square, Bothasig.',
    description_enriched_at = datetime('now')
WHERE slug = 'steers-bothasig-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Pinelands is a fast-food restaurant inside Central Square, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 10:00-21:00, Wed 10:00-22:00, Thu 10:00-21:00, Fri 10:00-22:00, Sat-Sun 10:00-21:00'
WHERE slug = 'steers-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Welgemoed is a fast-food restaurant inside Welgemoed Forum, Welgemoed.',
    description_enriched_at = datetime('now')
WHERE slug = 'steers-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stellenberg High School is a dual-medium (Afrikaans and English), co-educational public high school in Stellenberg, Bellville, established in 1986.',
    description_enriched_at = datetime('now')
WHERE slug = 'stellenberg-high-school-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Technoline Projects is an engineering design, project management and contracting firm based in Thornton, providing turnkey telecoms infrastructure and optical fibre solutions -- including installation work for major fibre network rollouts -- to the cellular and telecommunications industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://technoline.co.za/contact-us/", "https://www.africanadvice.com/1234067/Telecommunications/Cape_Town/Technoline_Projects_(PTY)_Ltd/", "https://technoline.co.za/about-us/"]'
WHERE slug = 'technoline-projects-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store is a variety and homeware retailer inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'the-crazy-store-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tile Factory Shop, trading as Kales Tiles, is a Paarden Eiland tile retailer stocking ceramic and porcelain tiles, mosaics, cement pavers, brick tiles and cladding, established more than 20 years ago.',
    description_enriched_at = datetime('now')
WHERE slug = 'tile-factory-shop-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Timberland is a footwear store inside Access Park, Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-15:00, Sun/PH 10:00-14:00'
WHERE slug = 'timberland-kuils-river' AND description_enriched_at IS NULL;
