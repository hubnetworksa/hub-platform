UPDATE businesses
SET description = 'New Apostolic Church is a congregation in Eduan Park holding Sunday worship services and a midweek gathering.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 08:00-12:00, Wed 18:45-20:30'
WHERE slug = 'new-apostolic-church-eduan-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Peoples Church is an Assembly of God congregation in Moregloed focused on growing a relationship with Jesus Christ through Sunday services and community ministry.',
    description_enriched_at = datetime('now')
WHERE slug = 'peoples-church-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polokwane Art Museum is housed in the Danie Hough Cultural Centre within the Library Gardens complex in Polokwane Central, showcasing paintings, ceramics, mixed media and sculpture by artists from the Limpopo region.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00, Sat 10:00-12:00'
WHERE slug = 'polokwane-art-museum-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'STAFIX Electric Fence & Security is the Southern African distributor of STAFIX and JVA electric fence energisers, based in Nirvana and supplying imported and locally-manufactured fencing and security products for agricultural, wildlife and perimeter-security markets, backed by a network of accredited installers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:00, Sat 08:00-11:00, Sun Closed'
WHERE slug = 'stafix-electric-fence-security-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Irish House is a renovated National Monument in Polokwane Central, originally built in 1886 and rebuilt in 1910, that now serves as a museum with exhibitions on the cultures and origins of Limpopo''s diverse peoples.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:00',
    source_urls = '["https://www.sa-venues.com/things-to-do/limpopo/polokwane-museum/", "https://www.wheretostay.co.za/topic/5342-irish-house-and-polokwane-museum-in-polokwane-limpopo", "https://sahistory.org.za/place/irish-house-polokwane-museum"]'
WHERE slug = 'the-irish-house-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vertex Boreholes is a borehole drilling and installation company based in Bendor, offering complete solutions including borehole pumps, tank stands, water tanks, trenching and PVC/steel casing, serving Polokwane and the wider Limpopo region.',
    description_enriched_at = datetime('now')
WHERE slug = 'vertex-boreholes-bendor' AND description_enriched_at IS NULL;
