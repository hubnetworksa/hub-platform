UPDATE businesses
SET description = 'Carole Nevin Designs is a handprinting textile studio and factory shop in Marina Da Gama, Muizenberg, producing colourful, ethically made South African fabrics, table linen, cushion covers and handbags. What began as a home-based venture nearly three decades ago has grown into a factory employing more than 40 people, with factory tours available by arrangement.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://cape-town-south-africa.bizfax.co.za/carole-nevin-designs-factory.html", "https://carolenevin.com/contact/", "https://carolenevin.com/our-story/"]'
WHERE slug = 'carole-nevin-designs-marina-da-gama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Feet4Life Lakeside is a podiatry practice based at the Stone Village Wellness Centre, treating biomechanical and sports-related foot conditions as well as skin, nail, bone and soft-tissue pathologies, including specialised care for the diabetic foot.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://feet4life.co.za/lakeside/", "https://nearmedoctors.com/business/feet4life-podiatrist-lakeside-excellent-podiatrist-in-cape-town/", "https://feet4life.co.za/"]'
WHERE slug = 'feet4life-lakeside-lakeside' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simply Asia in Lakeside Centre is a branch of the South African Simply Asia franchise, serving Thai, sushi and other Asian dishes including seafood and vegetarian options, with dine-in, takeaway and parking available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:00'
WHERE slug = 'simply-asia-lakeside' AND description_enriched_at IS NULL;
