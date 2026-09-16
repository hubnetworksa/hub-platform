UPDATE businesses
SET description = 'Ackermans Savannah Mall is a clothing, footwear and homeware retail store inside Savannah Mall in Fauna Park, part of the national Ackermans chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'ackermans-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nando''s Savannah Mall is a flame-grilled chicken restaurant and takeaway inside Savannah Mall in Fauna Park, part of the national Nando''s chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'nandos-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports Savannah Mall is a sports apparel, footwear and equipment retail store inside Savannah Mall in Fauna Park, part of the national Totalsports chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalsports-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr N.C. Ngobeni is a dental practice in Fauna Park, Polokwane, providing general dentistry services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.recomed.co.za/dentist/polokwane/nc-ngobeni/947/848/", "https://docnearby.co.za/practice/ngobeni-n-c-4182/practitioner/28652", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=281408", "https://www.doctorsnearme.co.za/drWebsite/Dentist%20Polokwane%20-%20Dr%20N%20C%20Ngobeni@f41"]'
WHERE slug = 'dr-nc-ngobeni-fauna-park' AND description_enriched_at IS NULL;
