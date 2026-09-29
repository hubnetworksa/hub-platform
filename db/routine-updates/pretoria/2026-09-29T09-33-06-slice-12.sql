-- Slice 12 description-enrichment batch (job 4 only), 50 businesses.
-- Each UPDATE is guarded by description_enriched_at IS NULL so it is safely re-runnable.

UPDATE businesses
SET description = 'Security Med 24 is a Pretoria-based security company offering armed and unarmed guarding, CCTV surveillance, alarm monitoring and gate/vehicle tracking, distinguished by on-site medically trained first responders who assist with both crime and non-crime medical emergencies.',
    description_enriched_at = datetime('now')
WHERE slug = 'security-med-24-pty-ltd-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Security Mega-Store is a Sinoville security retailer supplying CCTV cameras and DVR/NVR kits, alarm systems, gate and garage automation motors, electric fencing and solar lighting, along with on-site security assessments.',
    description_enriched_at = datetime('now')
WHERE slug = 'security-mega-store-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Security Warehouse, founded in 1997 and headquartered in Hennopspark, is a leading South African distributor of CCTV, access control, alarm, gate automation, electric fencing and solar security equipment, and runs a PSIRA/SASSETA-accredited training academy for installers.',
    description_enriched_at = datetime('now')
WHERE slug = 'security-warehouse-headquarters-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sedgars Home is a furniture and homeware retailer stocking contemporary furniture, household appliances, mattresses and carpets, trading from Shop 60 in Menlyn Retail Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/6543306495", "https://sedgarshome.co.za/store-location/"]'
WHERE slug = 'sedgars-home-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sedibelo Platinum Mines (now trading as Sedibelo Resources) is a platinum group metals mining and exploration company operating the Grootboom Platinum Mine, with an office in Southdowns Office Park, Irene, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sedibeloplatinum.com/", "http://www.sedibeloresources.com/"]'
WHERE slug = 'sedibelo-platinum-mines-ltd-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sedupe and Metja Consulting is a 100% black-owned business consultancy, established in 2011, offering internal audit, risk management, corporate governance, economic advisory and forensic accounting services from its Highveld, Centurion office.',
    description_enriched_at = datetime('now')
WHERE slug = 'sedupe-and-metja-consulting-pty-ltd-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seebo Group CC, established in 2009 and 100% black-owned, is a plant and equipment hire and mining services company also active in wholesale fuel supply and exploration drilling, operating across six South African provinces from its Magalieskruin base.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://seebogroup.co.za/", "https://tlb.co.za/company/seebo-group-cc/"]'
WHERE slug = 'seebo-group-cc-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seeff Centurion is a residential real estate agency offering property sales, rentals, valuations and bond-origination support across roughly 40 Centurion-area suburbs including Doringkloof, Clubview and Irene.',
    description_enriched_at = datetime('now')
WHERE slug = 'seeff-centurion-pretoria-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seeff Pretoria East is a real estate agency handling residential, commercial, industrial and holiday-letting property sales and rentals across Pretoria East suburbs such as Arcadia, Garsfontein, Lynnwood and Moreleta Park, from its Selati Park office in Alphen Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'seeff-pretoria-east-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seeff Properties, part of the Seeff Property Group''s Pretoria East branch based at Selati Park, 36 Selati Street, handles residential, commercial and industrial property sales, rentals and vacant land across Pretoria East''s suburbs.',
    description_enriched_at = datetime('now')
WHERE slug = 'seeff-properties-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seegene South Africa is the local office of Seegene, a global molecular diagnostics company that develops high-multiplex PCR syndromic testing panels and automated diagnostic systems used across more than 100 countries.',
    description_enriched_at = datetime('now')
WHERE slug = 'seegene-south-africa-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seek Security, founded by the Orren family in 2019, is a Centurion-based security company offering armed response, guarding, VIP protection, vehicle tracking, high-risk escorts, investigations and 24/7 alarm and CCTV monitoring.',
    description_enriched_at = datetime('now')
WHERE slug = 'seek-security-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seesa Employee Benefits is an insurance and employee benefits provider based in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seesa-employee-benefits-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sefako Engineering is an engineering and surveying firm operating from Boardwalk Office Park, Faerie Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sefako-engineering-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sefeko is a South African technology company supplying Android-based push-to-talk radios, guard-monitoring handsets and a cloud operations portal with GPS tracking and incident management for security, facilities, mining and logistics teams, backed by 24/7 support.',
    description_enriched_at = datetime('now')
WHERE slug = 'sefeko-pty-ltd-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Segoale Properties, established in 1996, is a women-led estate agency offering property sales, rentals, management, valuations and construction services across Gauteng, Mpumalanga, North West, Limpopo, the Northern Cape and Western Cape.',
    description_enriched_at = datetime('now')
WHERE slug = 'segoale-properties-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Segwagwa is an events and function venue at Plot 15, Farm Derdepoort, near Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'segwagwa-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sehlaba Dithole Small Business Consultants is a business consulting firm based in Lotus Gardens, Claudius, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sehlaba-dithole-small-business-consultants-claudius' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sekretari (Pty) Ltd, founded in 1984, provides outsourced company secretarial and Companies Act compliance services, including CIPC representation and board and shareholder meeting support, on a pay-for-time-used basis.',
    description_enriched_at = datetime('now')
WHERE slug = 'sekretari-pty-ltd-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Self Storage is a Pretoria East storage provider using sealed, converted shipping containers to prevent dust and water damage, offering short- and long-term unit rentals with a one-month minimum, armed response and 24/7 camera surveillance.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-18:00'
WHERE slug = 'self-storage-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Self Storage operates a Zwavelpoort facility among its Pretoria East storage sites, using sealed, converted shipping containers to prevent dust and water damage, with armed response, 24/7 camera surveillance and floodlighting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-18:00'
WHERE slug = 'self-storage-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Self Storage Estate is a brick-and-mortar storage facility on Furrow Road in Equestria, offering secure unit rentals protected by a perimeter wall, electronic fencing, cellular access control, alarms and 24-hour response, with 24-hour customer support.',
    description_enriched_at = datetime('now')
WHERE slug = 'self-storage-estate-pty-ltd-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Semen Importer Services is an animal-care business in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'semen-importer-services-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Senhor Peri-Peri Midstream is a peri-peri chicken restaurant at Square @ Midstream offering dine-in, app-based online ordering and delivery through Uber Eats and Mr D Food.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'senhor-peri-peri-midstream-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Senhor Peri-Peri Hazeldean is a peri-peri chicken restaurant and takeaway in Hazeldean Square, Hazeldean, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'senhor-peri-peri-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SeniNhle Occupational Health Services, established in 2000, is an approved inspection authority providing OHS consulting, occupational medical exams such as lung function and hearing tests, and workplace hygiene compliance surveys covering noise, chemical and dust exposure.',
    description_enriched_at = datetime('now')
WHERE slug = 'seninhle-occupational-health-services-pty-ltd-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Senic Accounting and Consulting Services provides bookkeeping, independent reviews, financial statement preparation, tax compliance, payroll and company secretarial services from its La Montagne office.',
    description_enriched_at = datetime('now')
WHERE slug = 'senic-accounting-and-consulting-services-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seno Enterprises is a building and construction business based in Olievenhoutbosch, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seno-enterprises-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sense Business Systems is a Sinoville-based compliance consultancy run by attorneys and accountants, advising on corporate governance, anti-money-laundering frameworks, POPI compliance and B-BBEE/skills-development transformation, plus training through its Sense Campus platform.',
    description_enriched_at = datetime('now')
WHERE slug = 'sense-business-systems-pty-ltd-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Senses Beauty & Spa in Erasmia offers facials, waxing, massages, manicures and pedicures, lash and brow treatments, body piercing, teeth whitening, reflexology and advanced treatments such as Dermapen micro-needling and IPL hair removal, alongside skincare brands including BABOR and Exuviance.',
    description_enriched_at = datetime('now')
WHERE slug = 'senses-beauty-spa-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sensory FX is a Centurion-based fragrance and flavour manufacturer developing custom scents and tastes for FMCG food, beverage, household and personal-care brands across Southern, East and West Africa, certified to FSSC 22000 and ISO 9001/14001/45001 standards.',
    description_enriched_at = datetime('now')
WHERE slug = 'sensory-fx-pty-ltd-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sephaku Cement manufactures blended and general-purpose cement products, including the Sephaku 32R, 42N, 42R and 52 ranges, plus SepROAD road-stabilisation material, supplying hardware retailers and construction and tender projects across Southern Africa from its Southdowns office.',
    description_enriched_at = datetime('now')
WHERE slug = 'sephaku-cement-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sequestration Online (Pty) Ltd is a business consulting firm based in Candlewoods Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sequestration-online-pty-ltd-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Serendipity Toiletries is an ISO 22716-certified contract manufacturer of bath, body, beauty, sunscreen and anti-ageing products for retailers including Clicks, Woolworths and Pick n Pay, handling formulation, stability testing and packaging through to launch.',
    description_enriched_at = datetime('now')
WHERE slug = 'serendipity-toiletries-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Serenity Accounting Company serves small and medium businesses in Pretoria with bookkeeping, payroll, auditing, tax return preparation, business registrations and SARS dispute-resolution assistance.',
    description_enriched_at = datetime('now')
WHERE slug = 'serenity-accounting-company-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seriti Printing is a printing services business in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seriti-printing-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Servco operates from Waterkloof under divisions including ServCo Premium Bars for event bar services and ServCo Asset Solutions, with a creative agency division in development.',
    description_enriched_at = datetime('now')
WHERE slug = 'servco-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Server Warehouse, operating since 2007, is an online enterprise-IT retailer in Midstream Estate supplying Dell, Lenovo and HPE servers, networking equipment, NAS/SAN storage, UPS power systems and structured cabling, with delivery across South Africa or collection by appointment.',
    description_enriched_at = datetime('now')
WHERE slug = 'server-warehouse-pty-ltd-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Servest is a facilities management company, operating in South Africa since 1997, providing integrated cleaning and hygiene, security, landscaping, catering and parking services, and describes itself as Africa''s first black-owned facilities management company.',
    description_enriched_at = datetime('now')
WHERE slug = 'servest-pretoria-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seshebo is a logistics and courier transport business based in Rooiwal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seshebo-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Setja''s Business Solutions is a logistics and courier transport business based in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'setja-s-business-solutions-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seven Labs Technology is a Centurion-based electronics distributor and systems integrator supplying components such as batteries, connectors, cables, harnesses, antennas and switches, with prototyping, development, assembly-kit and sourcing services for the OEM industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'seven-labs-technology-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seven Pebbles is a purified-water supplier trading from Shop 15, Northdale Shopping Centre in Ninapark.',
    description_enriched_at = datetime('now')
WHERE slug = 'seven-pebbles-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seven Pebbles Purified Water uses a seven-stage purification process (reverse osmosis, ozone injection and UV exposure) to produce purified drinking water, from its Shop 15 premises in the Northdale Shopping Centre area.',
    description_enriched_at = datetime('now')
WHERE slug = 'seven-pebbles-purified-water-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sew Easy Wierdapark is an industrial supplies and manufacturing business based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sew-easy-wierdapark-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sgadasandlovu (Pty) Ltd is a building and construction business based in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sgadasandlovu-pty-ltd-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shadowline Performance is an automotive repair business based in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shadowline-performance-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shangoni Management Services, operating since 2000, is an environmental and compliance consultancy offering environmental authorisations, mine closure and rehabilitation planning, groundwater management, water and air quality monitoring and dust-analysis laboratory services, based in Die Wilgers.',
    description_enriched_at = datetime('now')
WHERE slug = 'shangoni-management-services-pty-ltd-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ShapeUp Family Gym''s Wonderboom branch, in the basement of Wonderboom Junction Mall, offers weight training, cardio, aerobics and spinning classes, circuit and functional training, steam and sauna facilities, childcare, and the chain''s first dedicated private ladies'' gym.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 05:30-20:00, Sat 07:00-17:00, Sun 07:00-12:00'
WHERE slug = 'shapeup-family-gym-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shared Services Investment (Pty) Ltd is a business consulting firm based in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shared-services-investment-pty-ltd-rosslyn' AND description_enriched_at IS NULL;
