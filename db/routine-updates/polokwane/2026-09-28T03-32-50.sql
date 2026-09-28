-- Job 4: description enrichment sweep (batch of 7 -- clears the entire remaining backlog)

UPDATE businesses
SET description = 'Electric Eel Contractors CC is an electrical contracting business serving Flora Park and the greater Polokwane area.',
    description_enriched_at = datetime('now')
WHERE slug = 'electric-eel-contractors-cc-flora-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grandmark International''s Polokwane branch, based in Ladanna, is part of one of South Africa''s largest privately owned automotive aftermarket parts distributors, supplying components such as brakes, suspension, cooling and auto-electrical parts to the local motor trade.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.grandmarkltd.com/polokwane/index.html", "https://www.brabys.com/za/limpopo/polokwane/ladine/motor-vehicle-parts/grandmark-international", "https://grandmark.co.za/"]'
WHERE slug = 'grandmark-international-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Limpopo Structures is a structural steel engineering and manufacturing company based in Ladanna, Polokwane, serving industrial and commercial clients across Limpopo with steel structure design, manufacturing and erection services since 2003.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/limpopo-structures-polokwane", "https://www.polokwane.info/steel-manufacturers-in-polokwane/limpopo-structures-2/", "https://limpopostructures.com/"]'
WHERE slug = 'limpopo-structures-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Marakalala Transport is a transport and logistics operator based in Flora Park, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'marakalala-transport-flora-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mizpah Motor Trimmers specialises in motor vehicle upholstery, re-trimming and auto valet services in Superbia, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'mizpah-motor-trimmers-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ndzalama Training is an accredited education and skills development provider in Ladanna, Polokwane, offering SETA-accredited assessor, moderator and facilitator training since 2002.',
    description_enriched_at = datetime('now')
WHERE slug = 'ndzalama-training-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S H S Security is a security services provider based in Fauna Park, Polokwane, offering round-the-clock security services to homes and businesses in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 's-h-s-security-fauna-park' AND description_enriched_at IS NULL;
