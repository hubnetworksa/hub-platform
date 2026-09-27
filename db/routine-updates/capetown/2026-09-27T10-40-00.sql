UPDATE businesses
SET description = '@home is a homeware and decor retailer inside Constantia Village, Constantia, stocking furniture, soft furnishings and home accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-14:00, Tue-Sat 09:00-18:00, Sun 09:00-17:00'
WHERE slug = 'home-constantia-village-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ackermans is a national clothing, footwear and homeware retailer with a branch inside Maynard Mall, Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:00, Sat 09:00-13:00'
WHERE slug = 'ackermans-maynard-mall-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Alphen Veterinary Hospital is a small-animal veterinary practice in Constantia, offering routine wellness care, vaccinations, surgery and diagnostics, and is accredited as a Cat Friendly Clinic by the International Society of Feline Medicine.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-12:30 & 15:00-18:30, Sat 09:00-12:00, Sun 09:00-10:00'
WHERE slug = 'alphen-veterinary-hospital-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beeline Clothing is a family and children''s clothing factory shop chain, with a branch inside Maynard Mall, Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'beeline-clothing-maynard-mall-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Constantia Veterinary Hospital is a veterinary clinic in Constantia, offering care and treatment for pets in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'constantia-veterinary-hospital-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cosy Corner is a halaal Cape Malay eatery in Wynberg, established in 1973, known for its gatsbys, masala steak sandwiches, grills and curries, with a takeaway counter and no alcohol served.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 10:00-17:00',
    source_urls = '["https://www.eatout.co.za/venue/cosy-corner-wynberg/", "https://www.yep.co.za/biz/store/iyp/15952704_2", "https://winemag.co.za/food/restaurant-review/cosy-corner/"]'
WHERE slug = 'cosy-corner-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hair Freedom is a hair salon inside Kenilworth Centre offering precision cuts, colour services including balayage and colour correction, keratin treatments and specialist curl care, with walk-ins welcome for cuts and blow-dries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://za.africabz.com/western-cape/hair-freedom-227233", "https://kenilworthcentre.co.za/stores/store-list/hair-freedom/", "https://partnershair.co.za/pages/hair-freedom-hair-salon-kenilworth"]'
WHERE slug = 'hair-freedom-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC is a fried-chicken fast-food chain with a branch inside Maynard Mall, Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-22:00'
WHERE slug = 'kfc-maynard-mall-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Knead is an artisan bakery and cafe chain with a branch inside Constantia Emporium, serving bread, pastries and cafe meals.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-16:00'
WHERE slug = 'knead-constantia-emporium-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Multiserv is a shoe repair, key cutting and dry-cleaning franchise inside Maynard Mall, Wynberg, also offering leather repair, stitching, battery sales and courier services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-15:00'
WHERE slug = 'multiserv-maynard-mall-wynberg' AND description_enriched_at IS NULL;
