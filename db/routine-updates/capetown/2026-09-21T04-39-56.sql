UPDATE businesses
SET description = 'Marina Pub and Bistro is a pub and bistro in Eastlake Shopping Centre, Marina Da Gama, serving pub-style meals such as burgers, ribs and pizza alongside a range of craft beers, and hosting regular events including quiz nights.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-23:00',
    source_urls = '["https://www.tripadvisor.com/LocationPhotoDirectLink-g4606907-i481281035-Marina_da_Gama_Western_Cape.html", "https://heyrestaurants.co.za/02048641/Marina_Pub_and_Bistro", "https://www.facebook.com/MarinaPubAndBistro/", "https://opening-hours.co.za/04097282/Marina_Pub_and_Bistro", "https://www.dining-out.co.za/md/Marina-Pub-and-Bistro/11094"]'
WHERE slug = 'marina-pub-and-bistro-marina-da-gama' AND description_enriched_at IS NULL;
