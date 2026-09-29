-- Job 4: description enrichment sweep, batch of 10 (entire current backlog)
UPDATE businesses
SET description = 'Absa is a bank branch inside Riverside Mall, Rondebosch, offering everyday banking services to the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:30, Sat 08:00-11:00, Sun Closed'
WHERE slug = 'absa-riverside-mall-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Basilico has served homemade Italian dishes in Newlands since 1999, known for its wood-fired pizzas, pastas and salads in a relaxed, family-friendly setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:30, Sun 12:00-21:30',
    source_urls = '["https://www.eatout.co.za/venue/basilico/", "https://www.basilico.co.za/contact-us/9-uncategorised", "https://www.tripadvisor.co.za/Restaurant_Review-g312582-d5427279-Reviews-Basilico_Restaurant-Newlands_Western_Cape.html"]'
WHERE slug = 'basilico-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers is a supermarket inside Riverside Mall, Rondebosch, offering groceries and everyday essentials to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-20:00'
WHERE slug = 'checkers-riverside-mall-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Culture Wine Bar Newlands is a neighbourhood wine bar and sister venue to the original Culture Wine Bar on Bree Street, offering more than 50 wines by the glass alongside tapas and cheese in a community-focused space.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://destinali.com/cape-town/bar-nightlife/culture-wine-bar-newlands-cape-town", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d23306176-Reviews-Culture_Wine_Bar-Cape_Town_Central_Western_Cape.html", "https://www.capetownetc.com/lifestyle/culture-newlands-opens-in-cape-town-with-neighbourhood-wine-bar-experience/"]'
WHERE slug = 'culture-wine-bar-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Exact is a branch of the South African family clothing chain, offering value-priced fashion, footwear and accessories for adults, children and babies, in Claremont.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-17:00',
    source_urls = '["https://www.guzzle.co.za/exact/claremont/", "https://finderafrica.com/listing/exact-claremont/", "https://bash.com/exact"]'
WHERE slug = 'exact-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Korean Kitchen is a home-style Korean BBQ restaurant in Claremont with noraebang karaoke rooms, offering both dine-in and takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-19:30, Sun 12:00-19:00'
WHERE slug = 'korean-kitchen-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Newlands Brewery is the oldest operating brewery in South Africa, with roots tracing back to 1658 on the banks of the Liesbeek River; its historic Malthouse, Oasthouse and Mariendahl Tower buildings were granted national heritage status in 1995.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetown.travel/listing/newlands-brewery/", "https://www.tripadvisor.co.za/Attraction_Review-g312582-d6433937-Reviews-Newlands_Brewery-Newlands_Western_Cape.html", "https://sahris.sahra.org.za/node/31276"]'
WHERE slug = 'newlands-brewery-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Paradise Road is a cafe and bakery inside Cardiff Castle, Newlands, known for its croissants and French pastries, fresh bread and coffee, serving breakfast and light lunches.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.paradiseroad.co.za/", "https://thismammaloves.com/2022/05/16/table-seven-at-paradise-road/", "https://cardiffcastle.co.za/portfolio_page/paradise-road/"]'
WHERE slug = 'paradise-road-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tadka is a fully licensed, authentic Indian multicuisine restaurant in Claremont offering fine dining and takeaway, with chefs trained and recruited from India.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:30-21:30'
WHERE slug = 'tadka-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Spot is a barber shop in Mowbray offering gents, college and kids'' haircuts, plus a Full House package combining a cut, beard trim and hot towel treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 09:00-18:00'
WHERE slug = 'the-spot-mowbray' AND description_enriched_at IS NULL;
