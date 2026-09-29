-- Slice 21 description-enrichment batch (job 4), 50 businesses.
-- Each UPDATE is guarded by description_enriched_at IS NULL so it only ever applies once.

UPDATE businesses
SET description = 'Stormcote Waterproofing provides professional waterproofing solutions for residential and commercial properties in Wingate Park, working across IBR, metal sheet, tile, and concrete slab roofs, with free inspections and quotes.',
    description_enriched_at = datetime('now')
WHERE slug = 'stormcote-waterproofing-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stormvoel Testing Station T/A SDL East is a vehicle testing station in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stormvoel-testing-station-t-a-sdl-east-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stradix SA (Pty) Ltd is an offshore property investment company based in Lynnwood Ridge, helping South Africans invest in income-producing self-storage units in Georgia to earn dollar-based income and hedge against the rand.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:00, Fri 08:00-14:00'
WHERE slug = 'stradix-sa-pty-ltd-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strand-Foam (Rosslyn) Pty Ltd is an industrial manufacturing and supply business based in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'strand-foam-rosslyn-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strat Training is a workplace safety and skills-development training provider in Pierre van Ryneveld Park, Centurion, offering over 120 accredited courses including first aid, firefighting, working at heights, dangerous goods handling, and equipment operation, with roots going back to a training company founded in 2007.',
    description_enriched_at = datetime('now')
WHERE slug = 'strat-training-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'StratIT Holdings is a value-added technology distributor based in Southdowns, Centurion, supplying integrated security and enterprise technology solutions through a network of vendor partners across Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.securitysa.com/level2.aspx?id=S9%3A3561"]'
WHERE slug = 'stratit-holdings-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strategic Marketing Tribe is a StoryBrand-certified marketing agency in Waterkloof Glen that helps service-based founders build client-acquisition systems, and says it is the only agency in South Africa certified in both StoryBrand and Duct Tape Marketing.',
    description_enriched_at = datetime('now')
WHERE slug = 'strategic-marketing-tribe-storybrand-certified-agency-in-south-africa-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strategy Lab (Pty) Ltd is a business consulting firm based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'strategy-lab-pty-ltd-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strategy356 is a business consulting firm in Midstream Estate offering strategy facilitation and implementation, project and programme management, data and AI consulting, monitoring and evaluation, and telecommunications advisory, with more than 100 projects completed.',
    description_enriched_at = datetime('now')
WHERE slug = 'strategy356-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'StrategyX is a business consulting firm based in Laudium, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'strategyx-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stratida is a web design business based in Olievenhoutbosch, Centurion, offering website design and hosting services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://stratida.com/", "https://www.afrorate.com/listing/stratida/"]'
WHERE slug = 'stratida-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stratus Business Consultants, based in Lynnwood, advises on buying and selling accounting and audit practices, business valuations, exit-strategy preparation, financial forecasting, and business restructuring including insolvency and BEE ownership support.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat-Sun Closed'
WHERE slug = 'stratus-business-consultants-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stratus Technologies, Inc. Africa is the South African office of Stratus Technologies, a global provider of fault-tolerant computing systems - including its ztC Endurance and ztC Edge platforms and everRun software - built for continuous availability in mission-critical applications, based at Lynnwood Bridge.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.stratus.com/", "https://www.penguinsolutions.com/en-us"]'
WHERE slug = 'stratus-technologies-inc-africa-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Street Eats Takeout is a takeaway restaurant in Erasmia, Centurion, located next to the OK supermarket at Erasmia Crossing.',
    description_enriched_at = datetime('now')
WHERE slug = 'street-eats-takeout-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strep Plumbing & Swimming Pools Service is a plumbing business in Amberfield Valley, Centurion, offering swimming-pool related plumbing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'strep-plumbing-swimming-pools-service-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Striptax is an accounting and tax compliance firm in Heritage Hill, Centurion, handling income tax returns, VAT and payroll tax services, corporate tax planning, foreign and expatriate tax, and company and tax registrations for individuals and businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'striptax-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stroebel Financial Consultants is a licensed financial services provider (FSP No. 44997) offering insurance and financial advice in Erasmusrand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stroebel-financial-consultants-fsp-no-44997-erasmusrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Struben Street Motors is a used-car dealership in Mayville, Pretoria, that has traded for over 35 years, stocking multiple marques including Toyota, Mercedes-Benz, Ford, and Volkswagen, with in-house multi-bank finance, trade-ins, and mechanical warranties.',
    description_enriched_at = datetime('now')
WHERE slug = 'struben-street-motors-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Structural Precast Elements is a precast concrete supplier for the building and construction industry, based in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'structural-precast-elements-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Structural Precast Elements cc is a precast concrete supplier for the building and construction industry, based in Koedoespoort Industrial Sites, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'structural-precast-elements-cc-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strydom & Bredenkamp is a law firm in Waterkloof, Pretoria, practising as attorneys, conveyancers, notaries, and civil litigators.',
    description_enriched_at = datetime('now')
WHERE slug = 'strydom-bredenkamp-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Studio Calibre is a marketing and design business in Villieria, Pretoria, that manages clients'' digital projects through its own client portal.',
    description_enriched_at = datetime('now')
WHERE slug = 'studio-calibre-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Studio Cut & Edge Silverton is a wood and plywood supplier in Silverton, Pretoria, offering kitchen-remodelling materials and custom furniture such as TV stands and other wood pieces.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.studiocutandedge.co.za/", "https://pretoria.co.za/place/studio-cut-amp-edge-silverton"]'
WHERE slug = 'studio-cut-edge-silverton-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Studio Del Mei Di Arte Ceramica is a tile design and manufacturing business in Koedoespoort, Pretoria, producing listelli, panels, subway tiles, bevels, and mosaics since 1984.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://studiodelmei.co.za/", "https://www.snupit.co.za/pretoria/koedoespoort/studio-del-mei-di-arte-ceramica/63905"]'
WHERE slug = 'studio-del-mei-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stuttafords was an upscale South African department store, dubbed the "Harrods of South Africa," that traded at Menlyn Park Shopping Centre as one of the mall''s largest anchor stores until the 159-year-old chain, founded in 1858, wound up operations in 2017.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.localstore.co.za/store/53765/stuttafords/pretoria/", "https://www.africanadvice.com/1351529/Clothing_Retailers/Pretoria/Stuttafords_Stores/", "https://en.wikipedia.org/wiki/Stuttafords"]'
WHERE slug = 'stuttafords-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Style America Sports is an American-sportswear and clothing retailer trading from Belle Ombre Plaza in Marabastad, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nearbyza.com/place/belle-ombre-plaza-1", "https://www.yep.co.za/biz/store/iyp/17057018_2", "https://pretoria.co.za/listing/style-america-american-sportswear/"]'
WHERE slug = 'style-america-sports-marabastad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Styled By Experts (Pty) Ltd is an events and function styling business based in Akasia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'styled-by-experts-pty-ltd-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sub Zero Ice is an ice manufacturer and supplier based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sub-zero-ice-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Subaru Centurion is an official Subaru new-vehicle dealership based in Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'subaru-centueion-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Subtropico Ltd is a financial and investment services firm based in Nieuw Muckleneuk, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'subtropico-ltd-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Success Unisex Beauty Salon & Spa is a hair and beauty salon in Mayville, Pretoria, offering unisex hair and spa treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'success-unisex-beauty-salon-spa-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Succulent Cactus Vetplant Nursery is a plant nursery in Klerksoord, Akasia, specialising in succulents and cacti.',
    description_enriched_at = datetime('now')
WHERE slug = 'succulent-cactus-vetplant-nursery-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Summer Sun Trading 184 (Pty) Ltd is a building contractor based in Montana Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'summer-sun-trading-184-pty-ltd-building-contractors-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Summit Associated Industries manufactures wooden cable drums for South Africa''s cable industry from its facility in Rosslyn, Akasia, with more than five decades in the business.',
    description_enriched_at = datetime('now')
WHERE slug = 'summit-associated-industries-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Summit Capital is a business consulting firm based in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'summit-capital-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Summit Grill and Skybar is a multi-level restaurant and rooftop bar in Menlyn offering grill-house fare, pasta, and sushi alongside a pool deck and skybar with city views, describing itself as a supper-club experience.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-22:00, Fri-Sat 08:00-02:00, Sun 08:00-23:00'
WHERE slug = 'summit-grill-and-skybar-menlyn-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sun Electricity Pty Ltd is a solar and renewable energy business based in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sun-electricity-pty-ltd-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sun Energy International is a solar and renewable energy business based in Ashlea Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sun-energy-international-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunbird Media is a creative and digital agency in Die Wilgers, Pretoria, offering web development, graphic design and branding, and web hosting, alongside supporting services such as Google Ads setup, social media management, and email marketing.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunbird-media-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunderland Post Link is a commercial property and office-space business based in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunderland-post-link-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sungardens Retail Store is the charity shop of Sungardens Palliative Care, a Pretoria hospice, selling donated clothing, household items, and books to raise funds for its palliative-care programmes.',
    description_enriched_at = datetime('now')
WHERE slug = 'sungardens-retail-store-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunnyprint Centurion is a family-run litho and digital printing business trading since 1984, producing brochures, booklets, calendars, business cards, and training manuals for clients across Pretoria and Johannesburg.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunnyprint-centurion-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunnyside Arbotion Clinic is a healthcare clinic based in Sunnyside, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunnyside-arbotion-clinic-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunset Africa Coach Lines is a coach and passenger transport operator based in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunset-africa-coach-lines-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunskills is a SETA compliance consultancy in Sinoville, Pretoria, helping employers and training providers manage skills-development administration across education and training, industrial, and generic SETA categories.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunskills-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Suntech Consulting is an ICT solutions provider in Eco Park Estate, Centurion, offering SAP and enterprise ERP consulting, cloud and digital-transformation services, software development, and software testing and quality assurance.',
    description_enriched_at = datetime('now')
WHERE slug = 'suntech-consulting-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Suntinco specialises in professional window tinting, smash-and-grab protective film, and blinds for vehicles, buildings, and homes, operating since 2005 across Johannesburg, Pretoria, Rustenburg, and Witbank, based in Florauna, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'suntinco-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunumi PTY LTD manufactures custom enclosures for solar and electrical infrastructure in Waltloo, Pretoria - including battery cabinets, inverter housings, switchgear enclosures, and containerised solutions - trading since 2023 under the Real Solid Consulting group.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunumi-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunward Motors is a car dealership based in East Lynne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunward-motors-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunward Motors Silverton is a used-car dealership in Silverton, Pretoria, focused on premium, low-mileage, accident-free vehicles, with more than 200 vehicles available across its two showrooms.',
    description_enriched_at = datetime('now')
WHERE slug = 'sunward-motors-silverton-silverton' AND description_enriched_at IS NULL;
