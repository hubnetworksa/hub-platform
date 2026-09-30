-- Job 4: description enrichment sweep, checkpoint 1 of 2 (records 1-10)
UPDATE businesses
SET description = 'BB Used Polokwane is a used-vehicle dealership on Landdros Mare Street stocking a wide range of makes, including Volkswagen, Nissan, Ford, Mazda, Suzuki, Renault, Mahindra, Honda and Haval, with dozens of pre-owned vehicles typically in stock.',
    description_enriched_at = datetime('now')
WHERE slug = 'bb-used-polokwane-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank Limpopo Mall is a Capitec Bank branch trading inside Limpopo Mall in Polokwane Central, offering everyday banking, savings and loan services to mall shoppers.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-limpopo-mall-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chicken Licken Fly-Thru is a drive-through branch of the Chicken Licken fried-chicken chain on Grobler Street in the Polokwane CBD, serving customers well into the evening every day of the week.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 09:00-21:00, Fri-Sat 09:00-22:00',
    source_urls = '["https://www.waze.com/live-map/directions/za/lp/polokwane/chicken-licken-fly-thru", "https://restaurantguru.com/Chicken-Licken-Fly-Thru-Polokwane-2", "https://chickenlickenmenu.co.za/chicken-licken-polokwane/"]'
WHERE slug = 'chicken-licken-fly-thru-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Limpopo Mall is a Clicks pharmacy and health-and-beauty store trading at the corner of Market and Rissik Streets inside Limpopo Mall (formerly known as Middestad Mall), offering a dispensary alongside its retail range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-limpopo-mall-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Corrie Nel & Kie Attorneys is a Bendor-based law firm specialising in property law and conveyancing, commercial and corporate law, personal estate planning, and litigation.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-16:00'
WHERE slug = 'corrie-nel-kie-attorneys-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Diamond Inc Attorneys is a Bendor law firm established in 1976, handling personal injury claims, High Court and Magistrate Court litigation, corporate and commercial law, and business rescue matters.',
    description_enriched_at = datetime('now')
WHERE slug = 'diamond-inc-attorneys-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ehlers Law Inc is a boutique Bendor law firm offering corporate, family, labour, divorce, commercial and immigration law alongside conveyancing, debt recovery, general litigation and mediation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'ehlers-law-inc-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jacaranda Lodge is a 38-room guesthouse on Voortrekker Street offering luxury and standard en-suite rooms, 24-hour security with electric fencing, covered parking, free WiFi, a dining hall and conference facilities.',
    description_enriched_at = datetime('now')
WHERE slug = 'jacaranda-lodge-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LIMCOAT Sandblasting and Powder Coating is an industrial coating specialist on Chroom Street offering sandblasting, powder coating and on-site sandblasting for larger projects anywhere in Limpopo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-15:00, Sat-Sun Closed'
WHERE slug = 'limcoat-sandblasting-and-powder-coating-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PJ Mathebula Attorneys is a Bendor-based law firm operating from offices on Pierre Street, Bendor Ext 30.',
    description_enriched_at = datetime('now')
WHERE slug = 'pj-mathebula-attorneys-bendor' AND description_enriched_at IS NULL;
