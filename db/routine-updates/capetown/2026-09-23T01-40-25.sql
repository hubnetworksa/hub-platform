UPDATE businesses
SET description = 'Big Boy Crockery is a crockery and homeware store in Lansdowne, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'big-boy-crockery-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cashbuild is a building materials and hardware retailer with a branch inside Delft Mall in Delft, stocking cement, tools, hardware, and other construction supplies for builders and DIY customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-16:00, Sun 08:00-14:00',
    source_urls = '["https://locations.cashbuild.co.za/Retail-DelftMall-CashbuildDelft", "https://za.africabz.com/western-cape/cashbuild-368376", "https://www.tiendeo.co.za/stores/Delft/cashbuild-cnr-voorbrug-delft-road-delft/43799"]'
WHERE slug = 'cashbuild-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Duinefontein Service Station is a Caltex-branded fuel station on Duinefontein Road in Manenberg, providing fuel and forecourt services to the surrounding area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fueldirectory.co.za/listing-contact.php?listings_id=8365", "https://www.yep.co.za/biz/store/iyp/16272852_2", "https://caltex.co.za/forecourt-details.html?location=duinefonteinservicestation"]'
WHERE slug = 'duinefontein-service-station-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'E-Kem Pharmacy is a community pharmacy based in the Rose Centre in Eerste River, dispensing medicine and offering pharmacy health services to the local area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-19:00, Sun 09:00-15:00',
    source_urls = '["https://za.africabz.com/western-cape/e-kem-pharmacy-264210", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=396417", "https://nearmedoctors.com/business/e-kem-pharmacy-best-pharmacy-in-eerste-river/"]'
WHERE slug = 'e-kem-pharmacy-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Going Under Clothing is a casual fashion retailer with a branch in Nyanga Junction Shopping Centre in Manenberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00'
WHERE slug = 'going-under-clothing-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Going Under Clothing''s Lansdowne branch on Induland Avenue trades as a factory outlet store, selling casual fashion.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-15:00, Sun 09:00-14:00',
    source_urls = '["https://www.waze.com/live-map/directions/za/wc/cape-town/going-under-clothing-lansdowne", "https://za.africabz.com/western-cape/going-under-clothing-lansdowne-451885", "https://www.factoryshopssa.co.za/directory/going-under-clothing-landsdown/"]'
WHERE slug = 'going-under-clothing-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Honest Hardware is a hardware store in Athlone stocking electrical, plumbing, and solar and inverter equipment alongside tiles, sanitaryware, roofing and ceiling materials, paint, and general tools.',
    description_enriched_at = datetime('now')
WHERE slug = 'honest-hardware-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hungry Lion is a South African fast-food chain known for fried chicken, with a branch inside Delft Mall in Delft.',
    description_enriched_at = datetime('now')
WHERE slug = 'hungry-lion-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JAM Clothing is a fashion retailer with a branch in Gugulethu Square, part of the JAM chain known for affordable clothing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'jam-clothing-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jawitz Properties is a national real estate franchise, founded in 1969, with a branch in Central Square handling residential property sales and rentals in Pinelands and surrounding suburbs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.jawitz.co.za/contact/pinelands/1514/", "http://www.yellowpages.co.za/business/SA_6352680_BUS", "https://www.jawitz.co.za/area-profiles/cape-town/pinelands/"]'
WHERE slug = 'jawitz-properties-central-square-pinelands' AND description_enriched_at IS NULL;
