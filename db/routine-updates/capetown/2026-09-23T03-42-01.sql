-- Job 4: description enrichment sweep, batch 1 of 2 (10 businesses)
UPDATE businesses
SET description = 'Crawford Tops is a TOPS at SPAR liquor outlet in Crawford, stocking a range of beer, wine and spirits.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-19:00, Sat 09:00-19:00, Sun 11:00-18:00'
WHERE slug = 'crawford-tops-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Lansdowne Corner is a general clothing and homeware retailer inside Lansdowne Corner Shopping Centre, Lansdowne.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'pep-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA is a stationery, art and craft retailer inside Plattekloof Village Shopping Centre, stocking scholastic and office stationery, art and craft materials, books, educational toys and gifts.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/western-cape/pna-plattekloof-30888", "https://za.africabz.com/western-cape/pna-plattekloof-173547", "https://www.plattekloofvillageshoppingcentre.co.za/shop/pna/"]'
WHERE slug = 'pna-plattekloof-village-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Philippi Kitchen and Hardware is a hardware and kitchenware retailer at the corner of Eisleben and Lansdowne Roads in Philippi.',
    description_enriched_at = datetime('now')
WHERE slug = 'philippi-kitchen-and-hardware-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Clothing is the clothing retail division of Pick n Pay, located in Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun 09:00-15:00'
WHERE slug = 'pick-n-pay-clothing-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Local Monte Vista is a convenience supermarket on Monte Vista Boulevard, Monte Vista, offering everyday groceries.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-18:00'
WHERE slug = 'pick-n-pay-local-monte-vista' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pinelands Dental Inc is a general and cosmetic dental practice in Howard Centre, Pinelands, offering fillings, crowns, bridges, root canal treatment, extractions and implants.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, alternate Sat 08:30-12:30'
WHERE slug = 'pinelands-dental-inc-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Howard Centre is a courier, printing and postal services outlet inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun 08:30-14:00'
WHERE slug = 'postnet-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Plattekloof is a courier, printing and postal services outlet in Plattekloof Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun and public holidays closed'
WHERE slug = 'postnet-plattekloof-shopping-centre-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Eerste River is a courier, printing and postal services outlet inside Eerste River City Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun and public holidays closed'
WHERE slug = 'postnet-eerste-river' AND description_enriched_at IS NULL;
