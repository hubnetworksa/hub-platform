UPDATE businesses
SET description = 'Clip Culture CPT is a barbershop on Welgelegen Avenue in Strandfontein offering haircuts, beard trims, shaves and head shaves.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 09:00-18:00, Thu 09:00-18:30, Fri 09:00-19:00, Sat 07:00-13:00, Sun Closed'
WHERE slug = 'clip-culture-cpt-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'De Abreu & Cohen Attorneys is a law firm in Table View established in 1999, offering conveyancing, commercial law, general litigation, family law, wills, trusts and notarial services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/de-abreu-cohen-attorneys", "https://zaf.soopage.com/company/DE-ABREU-COHEN-INC_4qn.html", "https://www.southafricanlawyer.co.za/law-firm/de-abreu-cohen/table-view/", "https://deabreuandcohen.co.za/"]'
WHERE slug = 'de-abreu-cohen-attorneys-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'De Kock Estates is an estate agency in Fish Hoek that has served the False Bay area for over 50 years, handling residential property sales and rentals.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dekockestates.co.za/", "https://www.yellosa.co.za/company/855865/de-kock-property-group-fish-hoek", "https://www.property24.com/estate-agents/de-kock-estates/28950"]'
WHERE slug = 'de-kock-estates-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr H Goolam is a general practitioner''s rooms in Strandfontein, providing general medical consultations.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-h-goolam-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr RB Daya is a dispensing general practice in Strandfontein, providing consultations and dispensing prescription medication on site, and accepting a wide range of medical aid schemes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.recomed.co.za/general-practitioner/cape-town/rupesh-daya/37926/46661/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=251348", "https://www.recomed.co.za/general-practitioner/cape-town/rb-daya/2109/1894/"]'
WHERE slug = 'dr-rb-daya-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Excellent Meat Market is a butchery on Wetton Road in Ottery selling Halaal beef, lamb and poultry, part of a family-owned chain trading since 1970.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/excellent-meat-market-45152", "https://www.cybo.com/ZA-biz/excellent-meat-market", "https://excellentmeat.co.za/find-us/", "https://www.sayellow.com/view/south-africa/excellent-meat-market-in-cape-town-1"]'
WHERE slug = 'excellent-meat-market-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Healthfort Clinics is a multidisciplinary healthcare practice on Racecourse Road in Milnerton, offering GP consultations, dentistry, physiotherapy, sports rehabilitation and an onsite blood-testing lab.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.recomed.co.za/private-practice/milnerton/healthfort-clinics-milnerton/51093/", "https://www.healthfortclinic.com/our-locations/gp-milnerton", "https://www.healthfortclinic.com/"]'
WHERE slug = 'healthfort-clinics-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hout Bay Handiman Centre is a hardware store on Victoria Avenue in Hout Bay stocking building, plumbing, electrical and paint supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/hout-bay-handiman-centre-50868", "https://www.brabys.com/za/western-cape/cape-town/hout-bay/hardware-retailers/hout-bay-handiman-centre", "https://fixfind.co.za/service/handyman/hout-bay/handiman-hardware-store/"]'
WHERE slug = 'hout-bay-handiman-centre-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inn-Hair is a unisex hair salon on Loxton Road in Milnerton.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-18:00, Sat 06:00-15:00, Sun Closed',
    source_urls = '["https://www.thinklocal.co.za/biz/inn-hair-milnerton", "https://www.yep.co.za/biz/store/iyp/3509215_3", "https://www.brabys.com/za/western-cape/milnerton/salons/inn-hair", "https://magicpin.com/south-africa/Cape-Town/Milnerton/Beauty/Inn-hair/store/235c3a9"]'
WHERE slug = 'inn-hair-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Melkbosstrand is a fried-chicken and fast-food outlet with a drive-thru at Shop 22, Birkenhead Shopping Centre in Melkbosstrand.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://locations.kfc.co.za/western-cape/vredekloof/shop-22-birkenhead-centre", "https://za.africabz.com/western-cape/kfc-melkbos-98211", "https://www.melkbosonline.co.za/item/kfc-melkbosstrand/"]'
WHERE slug = 'kfc-melkbosstrand' AND description_enriched_at IS NULL;
