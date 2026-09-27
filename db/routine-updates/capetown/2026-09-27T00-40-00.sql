UPDATE businesses
SET description = 'Agrimark Sitari is a farm-and-lifestyle supply store in Sitari Village Centre, Croydon, stocking around 11,000 product lines including hardware, paint, building materials, gardening tools, pet food and braai equipment, with in-store paint mixing and delivery available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'agrimark-sitari-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Algina Wholesale Nursery is a wholesale plant nursery on Rustenhof Farm in Firgrove, growing seasonal plants and vegetable seedlings at scale and supplying community gardens and households in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00, Sun Closed',
    source_urls = '["https://www.facebook.com/AlginaWholesaleNursery/", "https://www.yellowpages.net.za/phone,27-746183901,Wholesale-Plant-Nursery,Cape-Town,ZA33547.html", "https://www.foodformzansi.co.za/agri-worker-goes-from-retrenchment-to-award-winning-entrepreneur/"]'
WHERE slug = 'algina-wholesale-nursery-firgrove' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bart''s Tavern is a laid-back neighbourhood pub in Strand Pavilion with a well-stocked bar of local and international beers, wines and cocktails alongside a pub-style menu of steaks, pizzas and seafood platters, plus live music and sports screenings some evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-02:00',
    source_urls = '["https://za.africabz.com/western-cape/barts-tavern-78104", "https://www.eatout.co.za/venue/barts-tavern/", "https://evendo.com/locations/south-africa/western-cape/bar/bart-s-tavern"]'
WHERE slug = 'barts-tavern-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belkem Pharmacy is a retail pharmacy in Macassar Shopping Centre, Macassar.',
    description_enriched_at = datetime('now')
WHERE slug = 'belkem-pharmacy-macassar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Woodstock Quarter is a coffee shop and café in Woodstock Quarter, part of the Bootlegger Coffee Company chain, serving all-day breakfast, lunch and brunch with free wifi, a kids'' menu and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat-Sun 08:00-15:00'
WHERE slug = 'bootlegger-woodstock-quarter-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caroline Berry Optometrists is an optometry practice in Sunnydale offering eye tests, spectacles, sunglasses and contact lenses for patients from school age to senior years, serving the wider Fish Hoek, Noordhoek and Constantia area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=165107", "https://www.brabys.com/za/western-cape/fish-hoek/sunnydale/optometrists/caroline-berry-optometrist", "https://carolineberry.co.za/"]'
WHERE slug = 'caroline-berry-optometrists-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Circle Pharmacy is a retail pharmacy in Circle Centre on Main Road, Somerset West, offering dispensing and everyday health and wellness products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-14:00, Sun 09:30-13:00'
WHERE slug = 'circle-pharmacy-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy and health, beauty and homeware retailer with a store in Strand Square Shopping Centre, Strand.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-14:00, Tue-Sat 09:00-18:00, Sun 08:00-16:00'
WHERE slug = 'clicks-strand-square-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy is a pharmacy and health, beauty and homeware retailer with a store in Gordon''s Bay Mall, Gordon''s Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:00-18:00, Wed 09:00-16:00, Thu 09:00-15:00, Fri-Sun 09:00-18:00'
WHERE slug = 'clicks-pharmacy-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Lifestyle on Kloof is a pharmacy and health, beauty and homeware retailer with a store in the Lifestyle on Kloof centre, Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-18:00'
WHERE slug = 'clicks-lifestyle-on-kloof-gardens' AND description_enriched_at IS NULL;
