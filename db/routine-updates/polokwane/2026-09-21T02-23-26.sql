UPDATE businesses
SET description = 'Allpro Truck and Trailer Components supplies truck body parts and spares, plus trailer parts and accessories for brands including YTE, Swift, BPW, Henred and Load, along with Mercedes, Cummins and CAT engine parts, from its premises in Superbia, Polokwane.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed'
WHERE slug = 'allpro-truck-and-trailer-components-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phoenix Industrial & Safety Supplies is a safety-equipment manufacturer and supplier established in 1993, offering workwear, safety footwear, hard hats, cleaning rags and other protective gear to industries such as engineering, construction, mining and petrochemicals from its Superbia, Polokwane branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/phoenix-industrial-and-safety-supplies-in-polokwane", "https://www.brabys.com/za/limpopo/polokwane/safety-clothing/phoenix-industrial-safety-supplies", "https://phoenixindustrial.co.za/polokwane/", "https://phoenixindustrial.co.za/welcome-to-phoenix-industrial-and-safety-suppliers/"]'
WHERE slug = 'phoenix-industrial-safety-supplies-superbia' AND description_enriched_at IS NULL;
