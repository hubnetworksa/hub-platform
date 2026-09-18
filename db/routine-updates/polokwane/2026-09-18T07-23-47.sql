UPDATE businesses
SET description = 'Century 21 Polokwane is a real estate agency handling residential and commercial property sales and rentals across Polokwane and its suburbs, including industrial land listings in the area''s commercial corridors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.century21.co.za/contact/", "https://www.property24.com/estate-agents/century-21-polokwane/36187", "https://www.myproperty.co.za/offices/century-21-polokwane", "https://www.century21.co.za/results/branch/2985/"]'
WHERE slug = 'century-21-polokwane-eduan-park' AND description_enriched_at IS NULL;
