UPDATE businesses
SET description = 'APPA (Anderson Perry Partnership Architects) is an architecture studio in Rosebank specialising in industrial, commercial and complex residential projects, established in 2004.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.appa.za.com/contact", "https://rsa.worldorgs.com/catalog/cape-town/architect/appa-anderson-perry-partnership-architects", "https://www.appa.za.com/about"]'
WHERE slug = 'appa-anderson-perry-partnership-architects-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets Flamingo Square is a pet supplies store inside Flamingo Square offering pet food and accessories, along with an in-store pet spa for grooming.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://packleader.co.za/store/absolute-pets-flamingo-square/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=332657", "https://www.absolutepets.com/pet-spa/locator"]'
WHERE slug = 'absolute-pets-flamingo-square-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CampusKey Rosebank is a private student accommodation property near UCT, offering fully furnished private rooms, uncapped WiFi, and shared study and social spaces with on-site security.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://campuskey.co.za/location/cape-town/", "https://postmatric.co.za/student-accommodation/otgl/campuskey-rosebank-cape-town", "https://campuskey.co.za/private-student-accommodation-cape-town/"]'
WHERE slug = 'campuskey-rosebank-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Flamingo Square is a pharmacy, health and beauty retailer inside Flamingo Square, Table View.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-14:00, Public Holiday 09:00-14:00'
WHERE slug = 'clicks-flamingo-square-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Colour & Copy Solutions is a printing and copying shop that has operated from the same site in Rondebosch for over 20 years, offering posters, banners, booklets, business cards and T-shirt printing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30, Sat 09:00-12:00, Sun Closed',
    source_urls = '["https://colourandcopy.com/contact-us/", "https://www.brabys.com/za/western-cape/cape-town/rondebosch/copying-service/colour-copy-solutions", "https://colourandcopy.com/services-offered/"]'
WHERE slug = 'colour-and-copy-solutions-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gamo Hair Beauty Salon & SPA is a unisex hair and beauty salon in Rondebosch offering hair styling, beauty treatments and massage services.',
    description_enriched_at = datetime('now')
WHERE slug = 'gamo-hair-beauty-salon-spa-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kwik Spar Flamingo Square is a convenience supermarket inside Flamingo Square, Table View, trading daily.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-21:00'
WHERE slug = 'kwik-spar-flamingo-square-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Rondebosch CBD is a fashion, homeware and accessories retailer located in Rondebosch Main Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-14:00'
WHERE slug = 'mr-price-rondebosch-cbd-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tony''s Roma Flamingo Square is a bar-grill restaurant in Flamingo Square known for its ribs, char-grilled steaks and flame-grilled burgers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dining-out.co.za/md/Tonys-Roma/6242", "https://www.food-blog.co.za/tonys-roma/", "https://tonysroma.co.za/about/"]'
WHERE slug = 'tonys-roma-flamingo-square-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths (Rondebosch Main Centre) is a supermarket and food store located in Rondebosch Main Centre on Main Road.',
    description_enriched_at = datetime('now')
WHERE slug = 'woolworths-rondebosch-main-centre-rondebosch' AND description_enriched_at IS NULL;
