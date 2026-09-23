-- Job 4: description enrichment sweep, batch 2 of 2 (5 records)
UPDATE businesses
SET description = 'Spec-Savers Ottery is an optometry practice inside Ottery Centre on Woodlands Road, offering eye tests and a range of spectacles and contact lenses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-14:00, Public Holidays 09:00-14:00'
WHERE slug = 'spec-savers-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunrise Farm is a Halaal livestock abattoir in Schaapkraal, Philippi Horticultural Area, offering slaughtering, skinning, cutting, packaging, refrigeration and delivery services for sheep, goats and cattle.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunrise-farm-philippi-horticultural' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tekkie Town Ottery is a branch of the Tekkie Town sportswear and footwear chain inside Ottery Centre, stocking brands including Nike, Adidas, Puma and Reebok.',
    description_enriched_at = datetime('now')
WHERE slug = 'tekkie-town-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store Ottery is a discount variety retailer inside Ottery Pick n Pay Hypermarket, selling toys, games, party supplies, stationery and homeware.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-20:00, Fri 09:00-21:00, Sat 09:00-17:00, Sun 09:00-14:00, Public Holidays 09:00-14:00',
    source_urls = '["https://www.southafricabusinessdirectory.co.za/company/1468807997210624/the-crazy-store-ottery/cape-town/retail-stores", "https://www.callupcontact.com/b/businessprofile/The_Crazy_Store_Ottery/7724883", "https://www.crazystore.co.za/store-finder/"]'
WHERE slug = 'the-crazy-store-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Twin Peak Spur is a Halal-certified branch of the Spur steakhouse chain inside Ottery Hyper on Ottery Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-20:00',
    source_urls = '["https://www.eatout.co.za/venue/spur-twin-peak-ottery/", "https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/ottery/twin-peak-spur", "https://www.zabihah.com/restaurants/ca595a0c-7767-11ef-95ae-6045bdeb9f57/twin-peak-spur-ottery-western-cape"]'
WHERE slug = 'twin-peak-spur-ottery' AND description_enriched_at IS NULL;
