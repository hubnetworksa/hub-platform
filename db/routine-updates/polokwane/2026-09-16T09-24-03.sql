UPDATE businesses
SET description = 'Freshwell is a supermarket and grocer inside Bendor Shopping Centre, stocking butcher''s block meat, seafood, a deli counter and everyday grocery essentials, in Bendor, Polokwane.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/limpopo/freshwell-28973", "https://www.brabys.com/za/limpopo/polokwane/bendor/supermarkets/freshwell", "https://www.cylex.net.za/company/freshwell-23698309.html"]'
WHERE slug = 'freshwell-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prego''s is a takeaway restaurant inside Bendor Shopping Centre specialising in burgers, hamburgers and chips, in Bendor, Polokwane.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/limpopo/pregos-164332", "https://www.sluurpy.co.za/polokwane/restaurant/8451300/pregos-take-away", "https://restaurantguru.com/Pregos-Polokwane"]'
WHERE slug = 'pregos-bendor' AND description_enriched_at IS NULL;
