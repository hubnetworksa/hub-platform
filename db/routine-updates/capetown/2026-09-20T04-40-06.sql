-- Job 4: description enrichment sweep, batch 1 of 2 (10 businesses)
UPDATE businesses
SET description = 'Bel-Kem Pharmacy is an independent pharmacy in Belhar, dispensing prescription medicine and stocking everyday health and wellness products.',
    description_enriched_at = datetime('now')
WHERE slug = 'bel-kem-pharmacy-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Belhar is a pawnbroking and secondhand goods store inside Airport Shopping Centre, buying and selling used electronics, tools, jewellery and other secondhand items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.facebook.com/BelharCashCrusad/", "https://my-catalogue.co.za/stores/cape-town/cash-crusaders/airport-shopping-centre-corner-of-belhar-drive-and-stellenbosch-arterial-belhar", "https://cashcrusaders.co.za/locate-a-store/store/31/Cash%20Crusaders%20Belhar"]'
WHERE slug = 'cash-crusaders-airport-shopping-centre-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Airport Shopping Centre is a pharmacy and health, beauty and homeware store inside Airport Shopping Centre in Belhar.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-airport-shopping-centre-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Erica Square is a pharmacy and health, beauty and homeware store inside Erica Square in Belhar, with an in-store pharmacy for prescription dispensing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-18:00, Wed 09:00-18:00, Thu-Fri 08:30-18:00, Sat 08:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://clicks.co.za/store/Erica-Square/1806", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=385793", "https://opening-hours.co.za/06021140/Clicks_pharmacy_Erica_Square_Belhar"]'
WHERE slug = 'clicks-erica-square-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medirite Pharmacy Bishop Lavis is an in-store pharmacy inside the Shoprite supermarket in Bishop Lavis, offering prescription dispensing and clinic screening services covered by medical aid.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-16:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=258195", "https://www.wooltruhealthcarefund.co.za/static-assets/siteFiles/whf_network_pharmacy_list_western_cape_dec2025.pdf", "https://www.shopriteholdings.co.za/group/brands/medirite.html"]'
WHERE slug = 'medirite-pharmacy-bishop-lavis-bishop-lavis' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Airport Shopping Centre is a budget clothing, footwear and homeware store inside Airport Shopping Centre in Belhar.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://www.africabizinfo.com/ZA/pep-parow-belhar-airport-mall-021-952-6185", "https://za.africabz.com/western-cape/pep-parow-belhar-airport-mall-100342", "https://nearbyza.com/place/pep-store-365"]'
WHERE slug = 'pep-airport-shopping-centre-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Erica Square is a budget clothing, footwear and homeware retailer inside Erica Square in Belhar.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun 09:00-13:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-erica-square-cnr-erica-drive-kern-crescent-belhar-cape-town-western-cape/69865", "https://za.africabz.com/western-cape/pep-parow-belhar-erica-square-269006", "https://all-opening-hours.co.za/01975693/PEP"]'
WHERE slug = 'pep-erica-square-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Erica Square is a supermarket inside Erica Square in Belhar, stocking groceries, fresh produce and household essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-erica-square-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Airport Shopping Centre is a supermarket inside Airport Shopping Centre in Belhar, stocking groceries, fresh produce and household essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-19:00, Sun 08:00-17:00',
    source_urls = '["https://mydorpie.com/m/?page=chain_shoprite_airport_shopping_mall_belhar", "https://rsa.worldorgs.com/catalog/cape-town/grocery-store/shoprite-belhar", "https://my-catalogue.co.za/stores/belhar/shoprite/airport-shopping-mall-cnr-stellenbosch-arterial-belhar-drive"]'
WHERE slug = 'shoprite-airport-shopping-centre-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Bishop Lavis is a supermarket in Bishop Lavis, stocking groceries, fresh produce and household essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-bishop-lavis-bishop-lavis' AND description_enriched_at IS NULL;
