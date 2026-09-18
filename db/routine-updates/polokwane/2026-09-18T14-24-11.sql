UPDATE businesses
SET description = 'DR Crane Hire is a mobile crane hire and rigging company in Ladanna, providing crane trucks, forklifts and transport for construction and industrial lifting projects across the region.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-crane-hire-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gasoline Alley is a vehicle service and tyre centre in Superbia, offering tyre repairs and fitment, general vehicle servicing for all makes and models, and the sale of pre-loved used cars.',
    description_enriched_at = datetime('now')
WHERE slug = 'gasoline-alley-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hadtiit Construction is a building contractor in Ladanna offering house, office and warehouse construction, renovations, roofing, paving, carports and plumbing, and can draw up building plans for council approval.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/ladanna/renovations/hadtiit-construction", "https://www.thinklocal.co.za/biz/hadtiit-construction-polokwane", "https://www.sayellow.com/view/south-africa/hadtiit-construction-in-polokwane"]'
WHERE slug = 'hadtiit-construction-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jumbo Foods is a wholesale supplier in Ladanna distributing food, liquor, general merchandise and personal care products to retailers across Limpopo and Mpumalanga.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/jumbo-foods-polokwane", "https://www.brabys.com/za/limpopo/polokwane/beverages/jumbo-foods-cc", "https://www.polokwane.info/wholesalers-in-polokwane/jumbo-foods-wholesalers-in-polokwane/"]'
WHERE slug = 'jumbo-foods-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LEDA Platinum Office is a Ladanna branch of the Limpopo Economic Development Agency, supporting investment promotion, enterprise development and SMME and cooperative finance across Limpopo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-16:00'
WHERE slug = 'leda-platinum-office-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Marnes Enterprises is a steel fabrication workshop in Superbia offering CNC plasma cutting, welding and light fabrication of mild steel, aluminium and stainless steel, including generator frames and transformer tanks.',
    description_enriched_at = datetime('now')
WHERE slug = 'marnes-enterprises-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westenburg Police Station is a South African Police Service (SAPS) station in Westenburg providing community policing, crime reporting and victim support services to the local area.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.cybo.com/ZA-biz/saps-westernburg-police-station", "https://www.africabizinfo.com/ZA/saps-westernburg-police-station-015-292-9415", "https://www.saps.gov.za/contacts/stationdetails.php?sid=1277"]'
WHERE slug = 'westenburg-police-station-westenburg' AND description_enriched_at IS NULL;
