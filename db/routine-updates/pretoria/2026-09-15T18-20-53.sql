-- Job 4: description enrichment sweep (temporary description-only routine, 3-hourly cadence)
-- Batch of 8 businesses, capped per the temporary routine's schedule instructions.

UPDATE businesses
SET description = 'IR Consult is a business and management consulting firm based in De Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ir-consult-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Irma Kahts Estate Agents is an estate agency serving the Florauna area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'irma-kahts-estate-agents-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IRS Attorneys is a law firm offering legal services from its offices in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'irs-attorneys-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'InQuestech Solutions is a software development company based in Thatchfield Estate, Centurion, building custom web and enterprise applications and drawing on experience in the telecommunications, GIS, life insurance and banking sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.inquestech.co.za/", "https://inquestech.co.za/"]'
WHERE slug = 'inquestech-solutions-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'InXpress Pretoria is a local franchise of the global InXpress courier and freight network, helping small and medium businesses in the Boardwalk Manor area ship parcels efficiently with dedicated local customer service.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.inxpress.com/locations/pretoria/", "https://inxpress.com/"]'
WHERE slug = 'inxpress-pretoria-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'InXpress South Africa Head Office is the country head office for the InXpress global shipping and logistics network, coordinating courier and freight services for small and medium businesses across South Africa from its Centurion offices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.inxpress.com/?utm_source=google_maps&utm_medium=website_button&utm_campaign=SP&utm_content=SP", "https://inxpress.com/"]'
WHERE slug = 'inxpress-south-africa-head-office-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Innovative Switchboard Technologies is a hardware store based in Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'innovative-switchboard-technologies-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Innoventix Consulting is a management and technical consulting firm based in Centurion, in operation since its incorporation in 2007.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://innoventix.co.za/", "https://www.dnb.com/business-directory/company-profiles.innoventix_consulting_(pty)_ltd.03b5306a6dd6073a6f46291d4097741f.html"]'
WHERE slug = 'innoventix-consulting-blue-valley-golf-estate' AND description_enriched_at IS NULL;
