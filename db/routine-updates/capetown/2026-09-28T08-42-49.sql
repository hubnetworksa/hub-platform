UPDATE businesses
SET description = 'A.Z. Berman Primary School is a no-fee public primary school in Beacon Valley, Mitchells Plain, classified as a Quintile 4 institution.',
    description_enriched_at = datetime('now')
WHERE slug = 'az-berman-primary-school-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Alpine Primary School is a no-fee public primary school in Beacon Valley, Mitchells Plain, governed as a Section 21 school whose governing body manages its own budget.',
    description_enriched_at = datetime('now')
WHERE slug = 'alpine-primary-school-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beacon View Primary School is a no-fee public primary school on Wanderers Crescent in Beacon Valley, Mitchells Plain, serving over a thousand learners.',
    description_enriched_at = datetime('now')
WHERE slug = 'beacon-view-primary-school-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belhar High School is an English-medium public secondary school in Belhar, established in 1977 as the area''s first high school and designated one of the Western Cape Education Department''s Arts and Culture focus schools, offering Dance, Drama, Visual Art, Design and Music.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/belhar-sekondr", "https://belharhighschool.co.za/contact-us/", "https://schoolsdigest.co.za/listings/belhar-sekonder/", "https://belharhighschool.co.za/about/"]'
WHERE slug = 'belhar-high-school-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belhar Islamic Primary School is an independent primary school at 31 Syringa Crescent in Belhar with around 387 learners and 18 educators.',
    description_enriched_at = datetime('now')
WHERE slug = 'belhar-islamic-primary-school-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belhar Primary School is a public primary school on Acanthus Circle in Belhar with around 1,100 learners, offering academic, sporting and cultural programmes under the motto ''Labour En-Nobles''.',
    description_enriched_at = datetime('now')
WHERE slug = 'belhar-primary-school-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bishop Lavis Primary School is a no-fee public primary school in Bishop Lavis, classified as a Quintile 4 institution.',
    description_enriched_at = datetime('now')
WHERE slug = 'bishop-lavis-primary-school-bishop-lavis' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bishop Lavis Secondary School is a public secondary school at 57 Helderberg Road in Bishop Lavis, offering a holistic, learner-centred education alongside chess, rugby, netball and cross-country programmes.',
    description_enriched_at = datetime('now')
WHERE slug = 'bishop-lavis-secondary-school-bishop-lavis' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ieglaasi Nieyah Primary School is an independent Islamic school at 6 Kyalami Street in Beacon Valley, Mitchells Plain, offering both primary and high school phases and opened in 1995 as the area''s first independent Islamic primary school.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/ieglaasi-nieyah-school/", "https://www.brabys.com/za/western-cape/mitchells-plain/beacon-valley/islamic-school/ieglaasi-nieyah-primary-school", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/ieglaasi-nieyah-school", "https://ieglaasinieyahschool.co.za/our-history/"]'
WHERE slug = 'ieglaasi-nieyah-primary-school-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'St Vincent Clinic is a public healthcare clinic operated by the Western Cape Government on St Vincent Drive in Belhar, part of the Tygerberg Eastern Health District.',
    description_enriched_at = datetime('now')
WHERE slug = 'st-vincent-clinic-belhar' AND description_enriched_at IS NULL;
