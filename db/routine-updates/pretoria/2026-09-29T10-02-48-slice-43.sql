-- Description enrichment sweep (job 4) — slice 43
-- 50 businesses, alphabetical "waverley-tree-service..." through "werner-prinsloo-attorneys..."

UPDATE businesses
SET description = 'Waverley Tree Service & Tree Felling is a tree felling and garden care business serving Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'waverley-tree-service-tree-felling-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Waverley Tilers is a tiling and building contractor serving Moregloed, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'waverley-tilers-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Way Travel Consulting ZA is a travel agency serving Amandasig, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'way-travel-consulting-za-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WayleaveCENTRAL is a web-based wayleave management platform for municipalities and utility service providers, handling online applications, mobile inspections and compliance tracking; the company has developed the system since 1999 and counts Tshwane Municipality and Rand Water among its clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'wayleavecentral-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'We Are Centurion is a local community platform combining a business directory, an online community TV channel and an events calendar for the Centurion area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'we-are-centurion-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'We Buy Laptops purchases used laptops directly from the public in Pretoria, offering an online quote, in-store inspection and collection, and payment by bank transfer once a final offer is accepted.',
    description_enriched_at = datetime('now')
WHERE slug = 'we-buy-laptops-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'We Do All Catering Equipment & Refrigeration supplies and repairs commercial catering, bakery, refrigeration and butchery equipment for restaurants, bakeries and other food service businesses, including installation and extraction system setup.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-16:30, Sat-Sun Closed'
WHERE slug = 'we-do-all-catering-equipment-refrigeration-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'We Do Digital is a digital marketing and strategy agency in The Willows, Pretoria, offering SEO, PPC, social media management, web design, copywriting, photography and videography for businesses of all sizes.',
    description_enriched_at = datetime('now')
WHERE slug = 'we-do-digital-pty-ltd-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'We Render Pest Control provides pest eradication services in Die Wilgers, Pretoria, taking a people-centred approach for individuals, organisations and government clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'we-render-pest-control-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'We4Cused Trading and Projects, registered with CIPC in 2015, supplies cleaning chemicals, stationery, electronics and transport services, and has since expanded into licensed petroleum products including diesel, oil and paraffin, delivering nationwide from Karen Park, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'we4cused-trading-and-projects-pty-ltd-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WeSolve Distribution (Pty) Ltd is a logistics and courier transport business serving Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wesolve-distribution-pty-ltd-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wealth Creation Engines (Pty) Ltd is a software development business based in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'wealth-creation-engines-pty-ltd-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weather Master, established in 1953 and known as the original inventor of the louvre awning, manufactures and installs louvre awnings, fixed awnings and sun screens for residential, commercial and architectural clients across Gauteng, the Free State and the Northern Cape.',
    description_enriched_at = datetime('now')
WHERE slug = 'weather-master-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weavind & Weavind Inc is a law firm of attorneys, notaries and conveyancers with roots dating back to 1905, practising commercial law, litigation, property law, estates, labour law, intellectual property and criminal law.',
    description_enriched_at = datetime('now')
WHERE slug = 'weavind-weavind-inc-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weavind Park Community Skills Centre is a training and education provider serving Weavind Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'weavind-park-community-skills-centre-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weavind Park Liquor City is a liquor store on Weavind Boulevard in Weavind Park, Pretoria, noted by customers for being well stocked with good service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 09:30-15:30',
    source_urls = '["https://2pos.co.za/4/27996", "https://readymap.co.za/8/55992", "https://za.polomap.com/pretoria/69990"]'
WHERE slug = 'weavind-park-liquor-city-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weavind Superette is a neighbourhood supermarket and grocery store on Weavind Boulevard in Weavind Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'weavind-superette-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Web Innovations is a web design business based in Heatherview, Pretoria North, offering e-commerce website design, domain hosting, and logo and graphic design services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.webinnovations.co.za/", "https://www.designrush.com/agency/website-design-development/za/pretoria"]'
WHERE slug = 'web-innovations-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Web Maniacs, formed in November 2020 through a merger of two established Pretoria technology and design businesses, builds custom responsive websites on WordPress and Elementor and offers branding, social media marketing, domain and hosting services from Die Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'web-maniacs-pty-ltd-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Web Thrive is a web design, SEO and digital marketing agency based in Wapadrand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'web-thrive-web-design-agency-seo-digital-marketing-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WebBest designs and develops custom, responsive websites and progressive web apps, along with native mobile apps for iOS and Android and desktop apps for Windows and macOS, from Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'webbest-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WebDSL, with over a decade of experience in web design, provides website design, online shop development, web hosting, fibre and fixed-LTE internet services, SEO and web security from Theresapark, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.webdsl.co.za/"]'
WHERE slug = 'webdsl-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WebDevine has been helping South African clients grow online since 2003, offering website design and development, Google Ads and SEO, social media management, branding and web hosting from its Pretoria and Cape Town offices.',
    description_enriched_at = datetime('now')
WHERE slug = 'webdevine-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'WebScripto Pty Ltd, established in 2015 in Montana Park, Pretoria, designs websites including e-commerce, membership and non-profit sites, and has expanded into digital marketing services such as SEO, social media and Google Ads.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.webscripto.co.za/", "https://www.findmy.co.za/services/business/webscripto-pty-ltd/2707"]'
WHERE slug = 'webscripto-pty-ltd-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webbi is a Centurion-based digital agency offering website design and development, logo and branding, Facebook advertising, SEO and Google Ads, specialising in Shopify e-commerce stores and Bootstrap-based websites.',
    description_enriched_at = datetime('now')
WHERE slug = 'webbi-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webcafe (Pty) Ltd is an IT services provider in Constantia Park, Pretoria, offering remote IT support and managed services, website design and hosting, digital marketing, and hardware sales including laptops, desktops and printers.',
    description_enriched_at = datetime('now')
WHERE slug = 'webcafe-pty-ltd-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webconception is a digital agency based in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'webconception-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webmaster Africa is a business consulting service based in Akasia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'webmaster-africa-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Website Creators provides web hosting, web design and graphic design from Rietfontein, Pretoria, offering onsite and online appointments to build and manage clients'' online presence.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/website-creators"]'
WHERE slug = 'website-creators-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Website Select cc is a software development business based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'website-select-cc-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webster Software Developments builds custom software from Ninapark, Akasia, with a Municipal Integrated Management System among its offerings for enterprise and government clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'webster-software-developments-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Webtank Solutions, based in Heatherdale, Pretoria, provides website development, business software solutions and AI automation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'webtank-solutions-heatherdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wefleet Solutions is a business consulting service based in Wonderboom South, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wefleet-solutions-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weibros Transport, founded as a small furniture-removals operation with a single bakkie, now transports furniture and other loads locally and nationally for nurseries, courier companies, interior decorators and distribution businesses, from Kameeldrift, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://weibrostransport.my.canva.site/", "https://www.facebook.com/WeibrosTranport/posts/weibros-transportlocation-montana-pretoria-south-africaestablished-2010about-usw/1429194285574578/"]'
WHERE slug = 'weibros-transport-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weir Consulting is a property scheme management advisory based in Sterrewag, Pretoria, led by a Chartered Accountant with over 20 years'' experience in property finance, providing dispute mediation, financial reviews, compliance audits and board training for sectional title and HOA schemes.',
    description_enriched_at = datetime('now')
WHERE slug = 'weir-consulting-sterrewag' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weldhagen Eggs, a family-owned business operating since 1968, grades and distributes farm-fresh eggs from a facility processing up to 108,000 eggs an hour, delivering next-day to over 1,500 retail and commercial customers across Gauteng, North West and Limpopo.',
    description_enriched_at = datetime('now')
WHERE slug = 'weldhagen-eggs-pty-ltd-warehouse-wholesaler-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Well Health Pro is a physiotherapy practice group operating since 2011 with sites in Garsfontein and Lynnwood, Pretoria, offering manual therapy, electrotherapy, dry needling, sports massage and chest physiotherapy alongside biokinetics and sports-medicine services.',
    description_enriched_at = datetime('now')
WHERE slug = 'well-health-pro-pretoria-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Corner is a business in Donkerhoek, Pretoria, offering commercial premises and office space.',
    description_enriched_at = datetime('now')
WHERE slug = 'wellness-corner-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse is a South African health and wellness retailer selling supplements, natural beauty products, fitness items, food and home wellness goods; this branch trades from Southdowns Shopping Centre in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'wellness-warehouse-southdowns-centre-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness and Beauty Co is a wellness and beauty spa in Celtisdal, Centurion, offering facials, skincare, makeup and acupuncture therapy.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun 08:00-13:00',
    source_urls = '["scraped:google-places-no-website", "https://www.fresha.com/lvp/wellness-and-beauty-co-lochner-road-centurion-xZYvy6"]'
WHERE slug = 'wellness-and-beauty-co-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness at Hatfield is a clinical psychology and wellness practice at Hatfield Gables South Building on Hilda Street, Hatfield, offering counselling and therapy alongside a biokineticist on its team.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/9048264917", "https://pretoria.co.za/listing/wellnesshatfield-2/"]'
WHERE slug = 'wellness-at-hatfield-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Welman Attorneys Inc. is a law firm in Garsfontein, Pretoria, specialising in labour law, general litigation, medical malpractice and civil law, with clients including Tshwane University of Technology and the Companies and Intellectual Property Commission.',
    description_enriched_at = datetime('now')
WHERE slug = 'welman-attorneys-inc-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wenbro Hire Silverton hires, sells, repairs and manufactures construction equipment including compaction tools, generators, welders, concrete equipment, pumps and power tools, delivering across Gauteng and Limpopo from its Silverton, Pretoria branch.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-16:00, Sat 07:30-11:00, Sun Closed'
WHERE slug = 'wenbro-hire-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wenda Logistics Group is a car dealership business based in Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'wenda-logistics-group-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wendy Huts Trading builds Nutec homes, log cabins, small cabin units and custom floor plans, along with interior finishing services, from Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'wendy-huts-trading-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wenkem SA is an agricultural chemical distributor in Irene, Pretoria, supplying crop-protection products from multiple multinational agrochemical companies to local farming communities.',
    description_enriched_at = datetime('now')
WHERE slug = 'wenkem-sa-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wentzel L F is a dermatology practice in Les Marais, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.snupit.co.za/pretoria/les-marais/dr-lf-wentzel/312003", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=2849"]'
WHERE slug = 'wentzel-l-f-les-marais' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wenzile Phaphama is a security services business based in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'wenzile-phaphama-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Werkie is a recruitment and job-matching platform based in Lynnwood Manor, Pretoria, positioning itself as a place to find your next opportunity.',
    description_enriched_at = datetime('now')
WHERE slug = 'werkie-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Werner Prinsloo Attorneys is an attorneys and legal practice based in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'werner-prinsloo-attorneys-garsfontein-smallholdings' AND description_enriched_at IS NULL;
