UPDATE businesses
SET description = 'African Bank Goodwood Mall is a bank branch inside Goodwood Mall in Goodwood, offering personal and business banking services.',
    description_enriched_at = datetime('now')
WHERE slug = 'african-bank-goodwood-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank Goodwood Mall is a bank branch inside Goodwood Mall in Goodwood, offering everyday banking, savings and lending services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00, Sun 08:00-12:00'
WHERE slug = 'capitec-bank-goodwood-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Parow Centre Pharmacy is a pharmacy and health retailer inside Parow Centre in Parow, offering dispensing services alongside health, beauty and wellness products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://www.cylex.net.za/company/dis-chem-parow-centre-pharmacy-23758464.html", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=412178", "https://www.dischem.co.za/parow-centre-pharmacy"]'
WHERE slug = 'dis-chem-parow-centre-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hungry Lion Goodwood Mall is a fast-food outlet inside Goodwood Mall in Goodwood, serving fried chicken, burgers and family meal buckets for dine-in and takeaway.',
    description_enriched_at = datetime('now')
WHERE slug = 'hungry-lion-goodwood-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Brackenfell is a fried-chicken fast-food outlet on Old Paarl Road inside Brackenfell Shopping Centre, offering dine-in and takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 06:00-22:00'
WHERE slug = 'kfc-brackenfell-shopping-centre-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mini-Kem Pharmacy is an independent pharmacy near Goodwood Mall''s Entrance 1 in Goodwood, offering dispensing and everyday health products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/mini-kem-179331", "https://www.yep.co.za/biz/store/iyp/53832_2", "https://www.openhours-southafrica.com/en/cape-town/mini-kem"]'
WHERE slug = 'mini-kem-pharmacy-goodwood-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monument Pharmacy is an independent pharmacy on Voortrekker Road in Goodwood Estate, offering dispensing and everyday health products with extended weekday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-20:00, Fri 09:00-12:30 & 14:00-20:00, Sat 09:00-15:00, Sun 10:00-13:00'
WHERE slug = 'monument-pharmacy-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Cape Gate is a fashion and homeware retailer inside Cape Gate Shopping Centre in Brackenfell, offering affordable clothing, accessories and home goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 09:00-17:00',
    source_urls = '["https://www.thinklocal.co.za/biz/mr-price-cape-gate-cape-town", "https://capegatecentre.co.za/shop/mr-price", "https://www.mrp.com/en_za/store/mr-price-cape-gate"]'
WHERE slug = 'mr-price-cape-gate-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Navaho Spur is a family-style steakhouse inside Brackenfell Shopping Centre, part of the Spur Steak Ranches chain, serving steaks, ribs, burgers and seafood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-22:00, Fri-Sat 08:00-23:00, Sun 08:00-22:00',
    source_urls = '["https://magicpin.com/south-africa/Cape-Town/Brackenfell/Restaurant/Navaho-Spur/store/2362555", "https://www.dining-out.co.za/md/Navaho-Spur-Steak-Ranch-Brackenfell/4297", "https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/brackenfell/navaho-spur"]'
WHERE slug = 'navaho-spur-brackenfell-shopping-centre-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Goodwood Mall is a clothing and homeware retailer inside Goodwood Mall in Goodwood, offering affordable everyday apparel and household essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:30-15:00, Sun 09:00-14:00'
WHERE slug = 'pep-goodwood-mall-goodwood' AND description_enriched_at IS NULL;
