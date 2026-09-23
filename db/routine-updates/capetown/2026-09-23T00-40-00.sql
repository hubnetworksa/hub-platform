-- Job 4: description enrichment sweep, batch 1 of this run (10 records)

UPDATE businesses
SET description = 'Ackermans Cavalier Belhar is a fashion and clothing retailer trading from the Cavalier Shopping Centre in Belhar.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-16:00, Sun 09:00-14:00'
WHERE slug = 'ackermans-cavalier-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ackermans Lansdowne Corner is a fashion and clothing retailer trading from the Lansdowne Corner Shopping Centre in Lansdowne.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-13:00'
WHERE slug = 'ackermans-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Agrimark Philippi is an agricultural and farming supplies store on Olieboom Road, serving the farms and smallholdings of the Philippi Horticultural Area with irrigation equipment, animal feed, gardening tools and outdoor gear, plus diesel, gas swaps, paint mixing and delivery services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.agrimark.co.za/store/agrimark-philippi", "https://www.cybo.com/ZA-biz/agrimark-philippi", "https://www.agrimark.co.za/article/helping-to-protect-cape-town-s-food-basket-agrimark-philippi-gets-a-facelift"]'
WHERE slug = 'agrimark-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BKB Boards & Hardware is a supplier and distributor of wood-based board products, hardware and fittings in Kensington, offering in-house cutting, edging and drilling services alongside flooring and other home-improvement materials.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bkbboards.com/contact/", "https://za.africabz.com/western-cape/bkb-boards-hardware-256167", "https://www.facebook.com/profile.php?id=61565077140328"]'
WHERE slug = 'bkb-boards-and-hardware-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BMC Pharmacy has served the Belhar community for over 25 years, dispensing prescriptions and supporting patients with chronic medication management.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bmcpharmacy.co.za/contacts/", "https://healthandmedical.co.za/view/b-m-c-pharmacy", "https://bmcpharmacy.co.za/"]'
WHERE slug = 'bmc-pharmacy-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BUCO Plaza is a hardware and building materials store at Station Plaza in Mitchells Plain, supplying contractors and homeowners with building supplies, tools and materials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://www.buco.co.za/capetown/plaza", "https://www.cybo.com/ZA-biz/buco-plaza-mitchells-plain", "https://www.facebook.com/BUCOPlazaMitchellsPlain/"]'
WHERE slug = 'buco-plaza-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beauty Place is a beauty salon in the La Piazza Complex in Richwood offering facials, makeup application, and eyebrow and face threading treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 09:00-19:00, Thu Closed, Fri-Sun 09:00-19:00'
WHERE slug = 'beauty-place-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beauty Zone is a body wellness, slimming and weight-loss studio in Monte Vista offering treatments such as laser lipo, body sculpting and structured weight-loss programmes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon, Wed, Fri 09:00-17:00, Sat 08:00-12:00, Tue/Thu/Sun Closed'
WHERE slug = 'beauty-zone-monte-vista' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bradlows Gugulethu Square is a furniture and homeware store trading from Shop 57 in Gugulethu Square.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun 09:00-13:00'
WHERE slug = 'bradlows-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caltex Lansdowne Corner is a FreshStop-branded Caltex fuel station in the Lansdowne Corner Shopping Centre, trading around the clock with a FreshStop convenience store alongside its fuel pumps.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'caltex-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;
