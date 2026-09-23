UPDATE businesses
SET description = 'OK Furniture Westgate Mall is a furniture and home appliance retailer inside Westgate Mall, Westgate, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'ok-furniture-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street Westgate Mall is a home textiles and manchester retailer inside Westgate Mall, Westgate, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'sheet-street-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafelsig Clinic is a public primary healthcare clinic serving the Tafelsig community in Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'tafelsig-clinic-tafelsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafelsig Community Centre is a City of Cape Town-run hall-hire venue with a capacity of around 130, offering a stage, shared kitchen, ablutions and parking for weddings, birthday parties, corporate meetings and other functions.',
    description_enriched_at = datetime('now')
WHERE slug = 'tafelsig-community-centre-tafelsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafelsig Primary School is a no-fee, Quintile 4 public primary school on Olifantshoek Avenue serving around 1,187 learners.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://skools.co.za/listings/tafelsig-primary-school/", "https://schoolsdigest.co.za/listings/tafelsig-primary-school/", "https://nursingsouthafrica.co.za/primary-schools-in-mitchells-plain/"]'
WHERE slug = 'tafelsig-primary-school-tafelsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Grillfather Westridge is a burger, steak, chicken and ribs grill in Westridge Shopping Centre, Westridge, known locally for its Tsek Burger and a deliberately small, focused menu.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 11:00-21:00, Sun 11:00-17:00',
    source_urls = '["https://thegrillfather.co.za/contact/", "https://www.hungryfoody.com/za/the-grillfather-s-a-mitchells-plain/", "https://iamcapetown.co.za/tour/the-grillfather-sa/"]'
WHERE slug = 'the-grillfather-westridge-westridge' AND description_enriched_at IS NULL;
