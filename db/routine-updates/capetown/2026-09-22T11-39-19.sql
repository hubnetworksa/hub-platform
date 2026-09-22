UPDATE businesses
SET description = 'Algarve Restaurant & Bar is a Portuguese-influenced restaurant and bar in Kuils River known for seafood platters, chicken livers, creamy mussels and espetada, plus themed nights including Wednesday salsa dancing and Thursday/Sunday karaoke.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Wed 15:00-22:00, Thu-Fri 15:00-02:00, Sat-Sun 09:00-02:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g2213035-d27119572-Reviews-Algarve_Restaurant_Bar_Venue-Kuils_River_Western_Cape.html", "https://www.findglocal.com/ZA/Kuils-River/105233781057842/Algarve-Restaurant-&-Bar", "https://www.dining-out.co.za/md/Algarve-Restaurant-Bar/11308"]'
WHERE slug = 'algarve-restaurant-bar-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beantree Coffee Shop is a coffee shop and breakfast spot inside the Spar at Haasendal Gables in Kuils River, popular for its coffee and pancakes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g2213035-d17697555-Reviews-Beantree_Coffee_Shop-Kuils_River_Western_Cape.html", "https://www.sluurpy.co.za/kuils-river/restaurant/5031916/beantree-coffee-shop", "https://www.facebook.com/SUPERSPARHaasendal/posts/come-and-visit-beantree-haasendal-superspar-for-the-best-breakfast-coffee-and-me/367792793932714/"]'
WHERE slug = 'beantree-coffee-shop-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Kuilsriver is a second-hand goods and pawnbroking store in River Park Shopping Centre, Kuils River, buying and selling used electronics, tools and other everyday items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-15:00, Sun 09:00-13:00',
    source_urls = '["https://www.yellosa.co.za/company/899257/cash-crusaderskuils-river", "https://cashcrusaders.co.za/storedetails?location=Kuilsrivier", "https://my-catalogue.co.za/stores/cape-town/cash-crusaders/corner-nooiensfontein-and-mason-streets-kuilsriver"]'
WHERE slug = 'cash-crusaders-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lizelle Van Viegen Physiotherapist is a physiotherapy practice in Bothasig offering physiotherapy and dry needling treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:30-18:00, Tue-Thu 09:00-18:00, Fri 09:00-17:00, Sat-Sun Closed'
WHERE slug = 'lizelle-van-viegen-physiotherapist-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Payne & Louw Incorporated is a dental practice in Edgemead Shopping Centre providing general dentistry services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'payne-louw-incorporated-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Power is an automation systems and equipment supplier based in Edgemead Business Park, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'sa-power-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Barber''s Range Bothasig is a barbershop and hair salon in Bothasig Square offering haircuts and grooming services for men.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-19:00, Fri 08:00-13:00, 14:00-19:00, Sat 08:00-17:00, Sun 08:00-15:00',
    source_urls = '["https://www.fresha.com/lvp/the-barbers-range-bothasig-vryburger-avenue-kaapstad-30AyDN", "https://za.africabz.com/western-cape/the-barbers-range-bothasig-48887", "https://thebarbersrange.co.za/barbers-cape-town-branches/bothasig-barber/"]'
WHERE slug = 'the-barbers-range-bothasig' AND description_enriched_at IS NULL;
