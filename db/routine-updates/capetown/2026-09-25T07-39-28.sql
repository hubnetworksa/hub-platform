-- Job 4: description enrichment sweep, checkpoint 1 of 2 (10 records)
UPDATE businesses
SET description = 'Bargain Books is a book and stationery retailer with a branch inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'bargain-books-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brights Hardware is a hardware store located within Plattekloof Village, Plattekloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'brights-hardware-plattekloof-village-shopping-centre-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cincinnati Spur is a restaurant inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 11:00-19:00, Sat 10:00-19:00, Sun 10:00-18:00'
WHERE slug = 'cincinnati-spur-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Drive Thru is a fast-food restaurant with a drive-thru inside Richmond Corner, Richwood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-23:00, Sun 07:00-22:00'
WHERE slug = 'kfc-drive-thru-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC is a fast-food restaurant inside Plattekloof Village, Plattekloof.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 06:00-22:00'
WHERE slug = 'kfc-plattekloof-village-shopping-centre-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LNR Computers is a computer hardware and IT services store inside Plattekloof Village, Plattekloof, offering system upgrades, virus removal, screen replacement, data recovery, custom-built computers, and a call-out repair service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.yellowpages.net.za/phone-27-215584428-computer-store-Cape-Town-ZA10960.html", "https://za.africabz.com/western-cape/lnr-computers-237778", "https://lnrcomputers.co.za/"]'
WHERE slug = 'lnr-computers-plattekloof-village-shopping-centre-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pinelands Hardware is a hardware store at Central Square, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:00, Fri 08:30-12:45 & 14:00-17:00, Sat 09:00-13:00'
WHERE slug = 'pinelands-hardware-central-square-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Richmond Corner is a beauty and nail salon inside Richmond Corner, Richwood, offering manicures, pedicures, massages, threading, tinting, and waxing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/sorbet-richmond-corner-330977", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1838355", "https://www.beautynailhairsalons.com/ZA/Cape-Town/106973161759350/Sorbet-Group---Richmond-Corner"]'
WHERE slug = 'sorbet-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Pinelands is an optometrist and eyewear store inside Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-16:00, Sun Closed'
WHERE slug = 'specsavers-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida e Caffè Richmond Corner is a coffee shop inside Richmond Corner, Richwood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-18:00, Sun & Public Holidays 07:30-17:00'
WHERE slug = 'vida-e-caffe-richmond-corner-richwood' AND description_enriched_at IS NULL;
