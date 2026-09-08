-- Description enrichment, batch 1 (interactive session, per owner request
-- 2026-09-02 to start job 4's work immediately rather than wait for the
-- hourly routine). Top of the alphabetical backlog (description_enriched_at
-- IS NULL). Each business researched individually via its own website
-- (WebFetch) or WebSearch when no website was on file; "researched" ones
-- cite what was actually found, "reworded" ones use only already-verified
-- fields (name/category/suburb) when no additional real information turned
-- up. Guarded by description_enriched_at IS NULL so this is safe to re-run.

UPDATE businesses SET
  description = 'Loydrills is a software development company based in Monavoni, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'loydrills-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '+Group Properties is a property development and investment specialist, partnering with developers to offer buyers and investors residential units -- from affordable townhouses to higher-end estates -- across South Africa.',
  description_enriched_at = datetime('now')
WHERE slug = 'group-properties-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '0 is a guesthouse in Eldorette, Akasia.',
  description_enriched_at = datetime('now')
WHERE slug = '0-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '0861Nutsman is a handyman and renovation service covering painting, building, electrical work, steelwork, security installations and roofing, with over 13 years of experience across South Africa.',
  description_enriched_at = datetime('now')
WHERE slug = '0861nutsman-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '1 Circle Energy Group is an electrical and solar company offering custom-designed solar systems -- from basic backup to fully off-grid setups -- alongside electrical contracting, pool pump installation and compliance certification.',
  description_enriched_at = datetime('now')
WHERE slug = '1-circle-energy-group-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '1 Online Digital Marketing is a digital marketing agency offering web design, SEO, Google Ads management and social media services on a flexible, month-to-month basis with no long-term contracts.',
  description_enriched_at = datetime('now')
WHERE slug = '1-online-digital-marketing-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '11 2nd Avenue Investments is an enterprise development partner in Centurion''s CBD, supporting clients'' day-to-day business functions under the banner "Growth through Integrity."',
  description_enriched_at = datetime('now'),
  source_urls = '["http://www.112ndave.co.za/"]'
WHERE slug = '11-2nd-avenue-investments-clubview' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '123 Logistics and Services is a furniture removal and moving company handling office relocations, professional packing and long-distance moves across major South African cities.',
  description_enriched_at = datetime('now')
WHERE slug = '123-logistics-and-services-furniture-removal-moving-company-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '148 NT Projects is an ICT services firm offering end-to-end technology solutions spanning AI, cloud security, managed services, cybersecurity and unified communications, certified by IBM and Microsoft.',
  description_enriched_at = datetime('now')
WHERE slug = '148-nt-projects-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '1Worx develops cloud-based Industrial Internet of Things (IIoT) and augmented reality solutions for mining operations, giving real-time visibility into production, assets and safety to reduce downtime.',
  description_enriched_at = datetime('now')
WHERE slug = '1worx-pty-ltd-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '1stop4u is an online retailer selling consumer electronics, clothing, kids'' sneakers and safety equipment, with items ranging from wireless chargers and laptops to smart locks and home automation devices.',
  description_enriched_at = datetime('now')
WHERE slug = '1stop4u-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '2-Way Skips provides skip bin hire and waste removal services in La Montagne, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = '2-way-skips-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '20 Elevation Construction and Landscaping provides construction and landscaping services in Eco-Park, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = '20-elevation-construction-and-landscaping-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '22 TWN Group is an IT and business services company covering network security, computer hardware and software, plus bookkeeping, payroll, tax filing and company registration for small and medium enterprises.',
  description_enriched_at = datetime('now')
WHERE slug = '22-twn-group-pty-ltd-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '2271 Media is a marketing and advertising business based in Brooklands Lifestyle Estate, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = '2271-media-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '23 on Hazelwood is a street cafe, restaurant, bar and bakery known for its breakfast and brunch menu -- eggs Benedict, waffles and breakfast burgers -- alongside croissants, pastries and its red velvet cake.',
  description_enriched_at = datetime('now'),
  source_urls = '["https://www.eatout.co.za/venue/23-hazelwood/", "https://www.tripadvisor.com/Restaurant_Review-g312583-d8431433-Reviews-23_on_Hazelwood-Pretoria_Gauteng.html"]'
WHERE slug = '23-on-hazel-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '24/7 Centurion Plumbing offers round-the-clock emergency plumbing -- burst pipe repairs, drain unblocking, geyser maintenance and leak detection -- with no call-out fee for assessments and a 30-60 minute response time.',
  description_enriched_at = datetime('now')
WHERE slug = '24-7-centurion-plumbing-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '247 SEO is a search engine optimisation service based in Murrayfield, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = '247-seo-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '24Century Shelf Company sells pre-registered shelf companies for entrepreneurs looking for a fast route to starting a business in South Africa.',
  description_enriched_at = datetime('now')
WHERE slug = '24century-shelf-company-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '24IT Business Solutions is a computer and IT services company based in Silverton, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = '24it-business-solutions-silverton' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '2Moro''s Eat & Drink Bistro is a rustic Italian-style cafe at Montana Value Centre, known for its breakfast, cappuccino, homemade pies, milkshakes, steaks and cakes -- it also sells local artwork and leather bags.',
  description_enriched_at = datetime('now'),
  source_urls = '["https://www.facebook.com/2Moros-Eat-Drink-1051567704886871/", "https://www.tripadvisor.com/Restaurant_Review-g312583-d12966556-Reviews-2Moro_s_Eat_Drink_Bistro-Pretoria_Gauteng.html"]'
WHERE slug = '2moro-s-eat-drink-bistro-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '3 Avenues Group is a real estate agency in Midstream Estate handling property sales and rental management.',
  description_enriched_at = datetime('now')
WHERE slug = '3-avenues-group-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '3 Step Teambuilding runs customised corporate team-building activities and training, from small teams of 6 up to 600+ participants, including challenges and drumming sessions delivered nationwide.',
  description_enriched_at = datetime('now')
WHERE slug = '3-step-teambuilding-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '3% Properties - Parris Inc. is part of the 3%.Com Properties network, combining practising attorneys and estate agents to handle property sales and transfers for a 3% commission.',
  description_enriched_at = datetime('now'),
  source_urls = '["https://pretoria.co.za/place/3com-properties-parris-inc"]'
WHERE slug = '3-properties-parris-inc-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = '3%.Com Properties (NEA Inc.) combines real estate and legal services, offering home buyers and sellers both attorney and agent support for a 3% sales commission with no hidden costs.',
  description_enriched_at = datetime('now')
WHERE slug = '3-com-properties-in-centurion-and-midstream-nea-inc-midstream-estate' AND description_enriched_at IS NULL;
