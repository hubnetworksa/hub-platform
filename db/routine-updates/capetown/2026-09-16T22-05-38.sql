UPDATE businesses
SET description = 'The Cape Milner is a 57-room boutique hotel in Tamboerskloof blending Art Deco and Victorian heritage design, with a pool deck and the Glass Lounge venue, last renovated in 2014.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capemilner.com/contact/", "https://www.meetings-conventions.com/Meeting-Event-Venues/Tamboerskloof-South-Africa/Convention-Hotel/The-Cape-Milner-p2494518", "https://www.uyaphi.com/south-africa/cape-town/hotels/city/cape-milner-hotel"]'
WHERE slug = 'the-cape-milner-tamboerskloof' AND description_enriched_at IS NULL;
