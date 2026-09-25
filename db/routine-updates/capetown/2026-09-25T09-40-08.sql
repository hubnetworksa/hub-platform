UPDATE businesses
SET description = 'Cashbuild is a hardware and building-materials store in Gugulethu Square on NY3, Gugulethu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-16:00, Sun 08:00-14:00'
WHERE slug = 'cashbuild-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Department of Coffee opened as Khayelitsha''s first coffee shop and has been described as Cape Town''s only township coffee shop, serving coffee and light refreshments from its Ntlazane Street premises.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownetc.com/food-and-drink/department-of-coffee-cape-towns-only-township-coffee-shop/", "https://www.foodandthefabulous.com/travel/department-of-coffee-doc-khayelitsha/", "https://groundup.news/article/khayelitshas-first-coffee-shop-opened_282/"]'
WHERE slug = 'department-of-coffee-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Edgars is a department-style clothing and homeware retailer at Liberty Promenade in Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.callupcontact.com/b/Clothing_Stores/Edgars_Promenade_Mitchell039s_Plain/3271", "http://www.netpages.co.za/Mitchells+Plain/Edgars+StoresBranchesMitchells+PlainLiberty+Promenade+Mall+17+-557860.html", "https://libertypromenade.co.za/shops/edgars/"]'
WHERE slug = 'edgars-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Foschini is a fashion and homeware retailer at Liberty Promenade in Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.sayellow.com/view/south-africa/foschini-promenade-mitchells-plain-in-cape-town", "https://www.ayoba.com/business/FoschiniLibertyPromenadeMall", "https://libertypromenade.co.za/shops/foschini/"]'
WHERE slug = 'foschini-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Innohealth Medical Centres in Mitchells Plain Town Centre provides general practitioner consultations, nursing, and physiotherapy, including chronic condition management for diabetes, high blood pressure, arthritis and epilepsy, plus women''s health services.',
    description_enriched_at = datetime('now')
WHERE slug = 'innohealth-medical-centres-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Khayelitsha Pharmacy is a pharmacy located within the Shoprite Khayelitsha complex.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
    source_urls = '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/pharmacies/Western-Cape.pdf", "https://www.brabys.com/za/western-cape/cape-town/khayelitsha/pharmacies/khayelitsha-pharmacy", "https://www.findmy.co.za/services/business/khayelitsha-pharmacy/35363"]'
WHERE slug = 'khayelitsha-pharmacy-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Gugulethu is a fast-food restaurant chain branch at Gugulethu Square on NY3, Gugulethu.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonalds-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza is a pizza restaurant and takeaway at Liberty Promenade in Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-20:00, Fri 09:00-22:00, Sat 09:00-22:00, Sun 09:00-20:00',
    source_urls = '["http://textmap.co.za/3/47913", "https://vymaps.com/ZA/ROMANS-PIZZA-164648/", "https://libertypromenade.co.za/shops/romans-pizza/"]'
WHERE slug = 'romans-pizza-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;
