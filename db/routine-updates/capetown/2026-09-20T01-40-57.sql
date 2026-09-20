UPDATE businesses
SET description = 'Athlone Pharmacy is a community pharmacy on Old Klipfontein Road in Athlone, dispensing prescription medicines and everyday health and wellness products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun Closed'
WHERE slug = 'athlone-pharmacy-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bonteheuwel Pharmacy is a community pharmacy on Bonteheuwel Avenue in Bonteheuwel, providing prescription medicines and everyday health products.',
    description_enriched_at = datetime('now')
WHERE slug = 'bonteheuwel-pharmacy-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkout Bonteheuwel is a supermarket in the Bonteheuwel town centre on Jakkalsvlei Avenue, stocking everyday groceries and offering delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-19:00, Sun 08:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/checkout-bonteheuwel-125991", "https://www.yep.co.za/biz/store/iyp/15569262_2", "https://www.africabizinfo.com/ZA/checkout-bonteheuwel-021-694-4401"]'
WHERE slug = 'checkout-bonteheuwel-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Vangate Mall is a branch of the Clicks pharmacy and health-and-beauty retail chain, in Vangate Mall, Athlone.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-21:00, Sat 08:00-21:00, Sun & Public Holidays 09:00-19:00'
WHERE slug = 'clicks-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eziko Restaurant is a restaurant and catering school in Langa township whose name means "the stove" in Xhosa; it serves traditional South African meals such as lamb or chicken with samp and pap, is a regular stop on township tours, and includes an on-site crafts shop selling locally made crafts and jewellery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ezikorestaurant.co.za/restaurant/", "https://www.dining-out.co.za/md/Eziko/5988", "http://www.modernoverland.com/south-africa/cape-town/langa/eziko/"]'
WHERE slug = 'eziko-restaurant-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Guga S''thebe Arts and Culture Centre is a community arts and culture venue in Langa, established in the 1990s, offering programmes in dance, traditional dance, choir, music, poetry, pottery and metalwork, with an amphitheatre and, since 2015, its own Guga S''Thebe Theatre.',
    description_enriched_at = datetime('now')
WHERE slug = 'guga-sthebe-arts-and-culture-centre-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MaNeo''s B&B and Catering is a bed and breakfast in Zone 7, Langa, and was the first township B&B to open in Langa, in 1999; it offers three guest rooms -- one in the main house and two in outbuildings -- with African meals available on request.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/westerncape/bandb/langa.php", "https://heybedbreakfast.co.za/Cape_Town/Kwa-Langa_township/", "https://www.capetownmagazine.com/things-to-do-cape-town/true-african-hospitality-in-langa-township/15_52_1307"]'
WHERE slug = 'maneos-bb-and-catering-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Modack''s Superstore is a supermarket on Jakkalsvlei Avenue in Bonteheuwel, with dedicated fish and meat counters alongside its general grocery range.',
    description_enriched_at = datetime('now')
WHERE slug = 'modacks-superstore-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mzansi Restaurant is a traditional South African and Xhosa-cuisine restaurant on Harlem Avenue in Langa, serving a buffet-style menu that includes bobotie, chakalaka and malva pudding, with a live marimba band and township dance performances for booked groups.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mzansi45.co.za/contact-us/", "https://www.eatout.co.za/venue/mzansi-restaurant/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d5996581-Reviews-Mzansi-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'mzansi-restaurant-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nceduluntu Driving School is a driving school in Khayelitsha offering Code 08, Code 10 and Code 14 learner and driving-licence tuition.',
    description_enriched_at = datetime('now')
WHERE slug = 'nceduluntu-driving-school-khayelitsha' AND description_enriched_at IS NULL;
