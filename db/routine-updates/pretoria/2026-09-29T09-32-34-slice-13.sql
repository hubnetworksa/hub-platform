-- Description enrichment sweep (job 4) — slice 13
-- 50 businesses, alphabetical (sharlife-weavind-park .. signarama-centurion-hennopspark)

UPDATE businesses
SET description = 'Sharlife is an industrial supplies and manufacturing business based on Pitts Avenue in Weavind Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sharlife-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'She Means Business International is a Kilner Park-based coaching and consulting network for women entrepreneurs, offering business coaching, financial budgeting guidance, team-building support and strategy planning.',
    description_enriched_at = datetime('now')
WHERE slug = 'she-means-business-international-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheerline Aluminium Systems | Branch | Pretoria specialises in the design and distribution of aluminium curtain wall, window, door and shopfront systems, supported by an extensive range of hardware components.',
    description_enriched_at = datetime('now')
WHERE slug = 'sheerline-aluminium-systems-branch-pretoria-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street Hammanskraal is a branch of the Sheet Street home textiles and furniture retail chain, trading from Shop 17 in Jubilee Mall, Hammanskraal.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/hammanskraal/sheet-street-shop-jubilee-mall-cnr-jubilee-harry-gwala-road/40276", "https://my-catalogue.co.za/stores/pretoria/sheet-street/jubilee-mall-cnr-jubilee-harry-gwala-road-hammanskraal", "https://www.sheetstreet.com/sheet-street-hammanskraal-jubilee-mall-30143"]'
WHERE slug = 'sheet-street-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street Gezina is a branch of the Sheet Street home products chain, established in 1990, offering bedroom, living room, bathroom and kitchen textiles and furnishings from Gezina Galleries.',
    description_enriched_at = datetime('now')
WHERE slug = 'sheet-street-gezina-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shelev Accountants is a Moregloed-based accounting and tax practice providing accounting and tax services with a private, client-focused approach.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://shelevacc.co.za/", "https://www.findmy.co.za/services/business/shelev-accounting-cc/35233"]'
WHERE slug = 'shelev-accountants-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shelf Company For Sale Pretoria sells pre-registered, fully compliant shelf companies to businesses in the Pretoria/Tshwane area, with optional VAT and customs code registration.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://shelfcompaniesforsale.co.za/", "https://shelfcompaniesforsale.co.za/shelf-companies-for-sale-in-pretoria/"]'
WHERE slug = 'shelf-company-for-sale-pretoria-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shell 893 Rubenstein Drive, also known as Shell Moreleta Motors, is a Shell-branded fuel station in Moreleta Park offering V-Power and unleaded fuel grades alongside a convenience shop, fast food counter and restrooms.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/way/592690888", "https://www.cylex.net.za/company/shell-23757865.html"]'
WHERE slug = 'shell-893-rubenstein-drive' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shell Salvokop Service Station is a 24-hour Shell fuel station at the corner of Potgieter Street and Skietpoort Avenue in Salvokop, offering diesel and ethanol-free petrol alongside a convenience store, ATM and fast-food counter.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://find.shell.com/za/fuel/10043283-salvokop-service-station/en_ZA", "https://za.africabz.com/gauteng/shell-salvokop-service-station-24688", "https://pretoria.co.za/listing/shell-12/"]'
WHERE slug = 'shell-salvokop-service-station-salvokop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ShelvCraft (Pty) Ltd is a shelving, racking and retail display manufacturer with over 40 years in the industry, supplying hardware stores, supermarkets, pharmacies, clothing retailers and warehouses.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.shelvcraft.co.za/", "https://shelvcraft.shop/pages/about-us"]'
WHERE slug = 'shelvcraft-pty-ltd-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shemory Private Limited is a hardware store based in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shemory-private-limited-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shephtin Construction and Projects is a Waterkloof Park-based building company specialising in Nutec home construction, renovations, roofing and tiling.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00'
WHERE slug = 'shephtin-construction-and-projects-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheraton Pretoria is a 175-room five-star hotel in Arcadia that opened in 1999, offering conference venues, an outdoor pool, gym, spa, and a restaurant and bar near the Union Buildings.',
    description_enriched_at = datetime('now')
WHERE slug = 'sheraton-pretoria-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shere Decor is a bespoke furniture and decor studio making custom wood pieces that blend vintage and contemporary styles, trading by appointment.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://sheredecor.co.za/", "https://www.facebook.com/sheredecorpretoria"]'
WHERE slug = 'shere-decor-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheriff Pretoria South West is a Sheriff of the Court office on Iron Terrace in West Park, responsible for serving and executing court documents such as summonses, notices, warrants and court orders across its Pretoria South West jurisdiction.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.sheriffflow.com/sheriff-office-map/sheriff-pretoria-south-west"]'
WHERE slug = 'sheriff-pretoria-south-west-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sherlock Data Recovery Services is a data recovery specialist in Waterkloof Glen handling RAID, server, NAS and SAN recovery as well as hard-drive recovery from fire, water and physical damage, serving clients across Pretoria, Centurion, Midrand and Johannesburg.',
    description_enriched_at = datetime('now')
WHERE slug = 'sherlock-data-recovery-services-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shield Express Car Wash Hazeldean Square is a branch of the Shield Express car wash and detailing chain, offering exterior and interior vehicle cleaning with specially formulated cleaning products.',
    description_enriched_at = datetime('now')
WHERE slug = 'shield-express-car-wash-hazeldean-square-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shield Financial Services (Pty) Ltd is an insurance services provider based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shield-financial-services-pty-ltd-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shilombe Trading (Pty) Ltd, trading from Queenswood Quarter, provides advertising, branding and digital marketing services, including outdoor and billboard advertising, media buying and IT hardware solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'shilombe-trading-pty-ltd-queenswood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shine SA is a Centurion-based property compliance consultancy helping owners with building approvals, inspections, certificates of compliance and town planning across Gauteng.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00'
WHERE slug = 'shine-sa-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoo-Shoo''s Halaal Catering is a halaal catering business based in Laudium, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoo-shoo-s-halaal-catering-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is a supermarket located in Sunnypark Shopping Centre, Sunnyside, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is a supermarket on Lilian Ngoyi Street in Pretoria Central, offering groceries and household goods to the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-pretoria-central-6' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite / Checkers DC is a commercial distribution centre operated by the Shoprite/Checkers retail group in Louwlardia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-checkers-dc-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Atteridgeville is a supermarket in Atlyn Shopping Centre, Atteridgeville, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-atteridgeville-atteridgeville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Cash & Carry Pretoria West is a bulk cash-and-carry grocery outlet on Van Der Hoff Road in Kirkney, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-cash-carry-pretoria-west-kirkney' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Gezina is a supermarket on Steve Biko Road in Gezina, Pretoria, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-gezina-gezina' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Lotus Gardens is a supermarket at the corner of Ruth First Street and Joe Modise Road in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-lotus-gardens-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Lyttelton is a supermarket in Lyttelton Shopping Centre, Lyttelton Manor, Centurion, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-lyttelton-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Mamelodi Crossing is a supermarket in the Mamelodi Crossing shopping centre, Mamelodi, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-mamelodi-crossing-mamelodi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Olievenhoutbosch is a supermarket on the R55 in Olievenhoutbosch, Centurion, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-olievenhoutbosch-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Silverton is a supermarket in Silver Mall, Silverton, Pretoria, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Soshanguve Crossing is a supermarket in the Soshanguve Crossing shopping centre, Soshanguve, offering groceries and household goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-soshanguve-crossing-soshanguve' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Usave is a budget-format supermarket on Scheiding Street in Pretoria Central, offering discounted groceries and household basics.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-usave-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shula Developers is a built-environment company offering architecture, civil and structural engineering, construction, facilities management and power/energy solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'shula-developers-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shumani Optimal Holdings is a Monavoni-based digital company developing mobile apps, business websites, branding and digital marketing solutions, and distributes its own mobile apps and games via Google Play.',
    description_enriched_at = datetime('now')
WHERE slug = 'shumani-optimal-holdings-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shutcor Engineering (Pty) Ltd is an engineering business based on Henning Street in Jan Niemand Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shutcor-engineering-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shuttle South Africa is a Jan Niemand Park-based transport operator offering shared and private airport shuttle transfers, hourly car hire and corporate transport, available around the clock.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'shuttle-south-africa-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shuttles is a travel and shuttle transport business based on Paff Street in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'shuttles-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siann Daycare & Pre-Primary is a daycare and pre-primary school on Margaritha Street in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'siann-daycare-pre-primary-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sidepro Solutions (PTY) Ltd is an industrial supplies and manufacturing business on Paul Kruger Street in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sidepro-solutions-pty-ltd-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siemens Digital Industries Software SA is an engineering software business based in Tijger Vallei Office Park, Tijger Valley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'siemens-digital-industries-software-sa-tijger-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sifiso Electronics is a computer and electronics services business on William Street in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sifiso-electronics-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sign Consult Africa is a signage and printing business based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sign-consult-africa-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sign Crusade is a signage and printing business on Caledon Street in Daspoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sign-crusade-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sign Image is a Centurion-based signage company, established in 1996, specialising in the design, fabrication, installation and maintenance of corporate and franchise signage, illuminated signs, pylons and printed graphics across South Africa and the SADC region.',
    description_enriched_at = datetime('now')
WHERE slug = 'sign-image-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sign Maestro is a signage and printing business on Bart Joubert Street in Erasmia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sign-maestro-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sign Republik - Signage Superstore is a large-format signage retail store in Eco Boulevard Shopping Centre, Eco-Park Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sign-republik-signage-superstore-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SignTec is a Raslouw-based signage and printing company offering vinyl printing and cutting, custom signage, CNC cutting and fabrication, and LED and neon sign installation, operating since 1996.',
    description_enriched_at = datetime('now')
WHERE slug = 'signtec-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Signarama Centurion is a signage and branding franchise producing pylon signs, illuminated signs, vehicle wraps and building signage for retail, medical, corporate, real estate, education and hospitality clients including KFC, SPAR and Vodacom.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30'
WHERE slug = 'signarama-centurion-hennopspark' AND description_enriched_at IS NULL;
