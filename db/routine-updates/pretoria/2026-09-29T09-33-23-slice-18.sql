-- Description enrichment sweep (job 4), slice 18 of 50 parallel agents.
-- Each UPDATE is guarded by description_enriched_at IS NULL so it only ever applies once.

UPDATE businesses
SET description = 'Spacerocket Shipping Company is a courier and freight logistics provider operating from Annlin, offering shipping and delivery services to customers across Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spacerocket-shipping-company-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spaces Byls Bridge provides commercial office space in the Byls Bridge Boulevard precinct in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spaces-byls-bridge-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spaces Menlyn Maine provides commercial office space in the Menlyn Maine precinct of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spaces-menlyn-maine-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spar is a supermarket on Dely Road in Newlands, Pretoria, offering groceries and everyday essentials to the surrounding neighbourhood.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-menlyn-2' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spar is a neighbourhood supermarket at the corner of Main and Crown Streets in Waterkloof, Pretoria, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spar Soshanguve Crossing is a supermarket inside the Soshanguve Crossing shopping centre, trading seven days a week including public holidays.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-19:00'
WHERE slug = 'spar-soshanguve-crossing-soshanguve' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spares Wise East-Lynne is an aftermarket auto parts retailer offering performance parts, interior and exterior accessories, and expert consultation on replacement parts for a wide range of vehicles.',
    description_enriched_at = datetime('now')
WHERE slug = 'spares-wise-east-lynne-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sparkle Marketing Consultancy is a marketing and advertising consultancy based in Copperleaf, Centurion Golf Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparkle-marketing-consultancy-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sparkle Picnic Events organises picnic-style events and functions from its base in Wolmer, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparkle-picnic-events-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sparkling Auto Care Centre is an automotive repair and car-care workshop at the Wonderpark Shopping Centre in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparkling-auto-care-centre-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SparkysWorkshopMJLogic (Pty) Ltd is a logistics and courier transport operator based in Pretoria North, Wolmer.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparkysworkshopmjlogic-pty-ltd-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sparrows Chartered Accountants provides chartered accounting services from Eland Techno Park in Koedoespoort Industrial, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparrows-chartered-accountants-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spatial Consulting Group is a business consulting firm operating from Lynnwood Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spatial-consulting-group-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spaza is a creative technology agency offering app and web development, e-commerce, UX/UI design, branding and illustration services, with a portfolio of over 150 completed projects.',
    description_enriched_at = datetime('now')
WHERE slug = 'spaza-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speacalized Property Sercices is an estate agency operating from Fairway Avenue in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'speacalized-property-sercices-clubview-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Groenkloof is an optometry practice at Groenkloof Plaza offering eye tests with two qualified optometrists and fundus camera diagnostics.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'spec-savers-groenkloof-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Hazeldean Square is an optometry practice offering eye tests and eyewear, staffed by senior and junior optometrists.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun and Public Holidays 09:00-14:00'
WHERE slug = 'spec-savers-hazeldean-square-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Sunny Park is an optometry practice at Sunny Park Shopping Mall in Sunnyside, offering eye tests with tonometer and autorefractor equipment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-12:00, Public Holidays 09:00-15:00',
    source_urls = '["https://www.openstreetmap.org/node/9049693717", "https://www.specsavers.co.za/store/sunny-park"]'
WHERE slug = 'spec-savers-sunny-park-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Waterkloof Ridge is an optometry and audiology practice at the Waterkloof Lifestyle Centre, offering eye tests and hearing tests with a fundus camera, tonometer and autorefractor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-13:00, Sun and Public Holidays Closed'
WHERE slug = 'spec-savers-waterkloof-ridge-waterkloof-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speccon Holdings is an accredited training and education provider offering learnerships, QCTO qualifications and online courses across more than 70 accredited programmes through multiple SETAs.',
    description_enriched_at = datetime('now')
WHERE slug = 'speccon-holdings-pty-ltd-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specialist Equipment Manufacturers supplies engineering solutions to the rebar industry, manufacturing, rebuilding and leasing machinery for cutting, bending, straightening and mesh production of reinforcing steel.',
    description_enriched_at = datetime('now')
WHERE slug = 'specialist-equipment-manufacturers-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specialist Mechanical Engineers is a mechanical engineering firm based in Koedoespoort Industrial that designs and manufactures thermal and power management systems, including HVAC and power distribution solutions, serving the railway, defence, mining and automotive sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'specialist-mechanical-engineers-koedoespoort-branch-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specialist Mechanical Engineers Pty Ltd is a mechanical engineering firm operating from Rietfontein that designs and manufactures thermal and power management systems, including HVAC and power distribution solutions, serving the railway, defence, mining and automotive sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'specialist-mechanical-engineers-pty-ltd-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specialists Business Solutions (Pty) Ltd is an accounting firm based in Ashley Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'specialists-business-solutions-pty-ltd-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speciality Waterproof and Roof provides torch-on and cementitious roof waterproofing, roof leak detection and repair, and roof painting with drone inspections, serving Pretoria and Centurion including the Silverlakes and Waterkloof areas.',
    description_enriched_at = datetime('now')
WHERE slug = 'speciality-waterproof-roof-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spectrum Hearing Wierdapark is an audiology practice offering hearing tests, hearing aid fittings and trials, tinnitus treatment, and paediatric and neonatal hearing screening, in Wierdapark, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yvdwaudiology.co.za/", "https://spectrum-hearing.co.za/"]'
WHERE slug = 'spectrum-hearing-wierdapark-centurion-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speed Spot Technologies is an automotive repair workshop based in Wolmer, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'speed-spot-technologies-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speedies Fire is a fire safety and security services provider based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'speedies-fire-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speedydocuments is a business consulting and documentation services provider based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'speedydocuments-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Speelkas Kleuterskool is a pre-school and kindergarten in Highveld, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'speelkas-kleuterskool-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spektrum Print is a printing services provider based in Mondustria, Roodeplaat.',
    description_enriched_at = datetime('now')
WHERE slug = 'spektrum-print-roodeplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sperosens designs fire protection and telemetry systems for the mining and industrial sectors, including gas and dust detection, conveyor belt monitoring and fire suppression, serving clients across Africa from its Highway Business Park facility in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sperosens-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spes Guard Security CC is a security services provider based in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spes-guard-security-cc-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SpesNet is a business consulting firm operating from Die Hoewes, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spesnet-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sphiwe Amandla Construction and Maintenance is a 100% Black-owned construction company offering tiling, welding, painting, plumbing, plastering, interior design and ceiling installation, CIDB Grade 4 and NHBRC registered.',
    description_enriched_at = datetime('now')
WHERE slug = 'sphiwe-amandla-construction-and-maintenance-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spies M Plessis is a legal practice based in Clydesdale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spies-m-plessis-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spif Chicken is a poultry producer and retailer supplying farm broiler chicken products, including pre-packed cuts, sausages, patties and free-range options, through retail outlets across Gauteng, Limpopo and Mpumalanga.',
    description_enriched_at = datetime('now')
WHERE slug = 'spif-chicken-zambezi-junction-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spill-It Coffee Co. is a coffee roastery based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spill-it-coffee-co-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spin City Laundry is a self-service laundry business based at Wonderpark Estate in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spin-city-laundry-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spinnacle Power is a solar and renewable energy provider based in Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spinnacle-power-sterrewag' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spiraleye Studios is a software development company based in Ashlea Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spiraleye-studios-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spitz is a shoe store located in the Bloed Street Mall, Pretoria Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'spitz-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spitz is a shoe store located in Jubilee Mall, Hammanskraal.',
    description_enriched_at = datetime('now')
WHERE slug = 'spitz-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Splash Your Brand is a printing and branding services provider based in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'splash-your-brand-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spoor and Fisher is a legal practice operating from Byls Bridge Boulevard in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'spoor-fisher-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spoormaker and Partners is an engineering and surveying firm based in Centurion Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'spoormaker-partners-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spor-T is a printing services provider based in Les Marais, Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'spor-t-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sports Quip is a sports equipment supplier based in Derdepoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sports-quip-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportscene is a sporting goods and sportswear retailer in Jubilee Mall, Hammanskraal.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-15:00'
WHERE slug = 'sportscene-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportsmans Warehouse Centurion is a sporting goods, apparel and footwear retailer at Byls Bridge Promenade, offering cycling, fitness and outdoor gear.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'sportsmans-warehouse-highveld' AND description_enriched_at IS NULL;
