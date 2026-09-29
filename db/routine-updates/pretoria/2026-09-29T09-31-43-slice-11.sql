-- Description enrichment sweep (job 4) — slice 11
-- 50 businesses, researched where new facts were verifiably found, reworded otherwise.

UPDATE businesses
SET description = 'Sasol Theresa Park is a fuel station in Theresapark, Akasia, offering unleaded and premium diesel fuel alongside a convenience store, Halaal food options, Vida e Caffe coffee, and a 24-hour car wash.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.sasol.co.za/", "https://www.sayellow.com/view/south-africa/sasol-theresa-park-in-pretoria"]'
WHERE slug = 'sasol-theresa-park-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Wonderboom Suid is a fuel station on Steve Biko Road offering unleaded and premium diesel fuel, plus oil, water and tyre-pressure checks.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["http://www.sasol.co.za/", "https://www.ivote.co.za/view/south-africa/sasol-wonderboom-suid-in-pretoria"]'
WHERE slug = 'sasol-wonderboom-suid-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sastec is an IT consulting and solutions provider serving Pretoria and Midrand/Johannesburg, offering maintenance contracts and service-level agreements, installation and maintenance of educational and corporate training centres, and fingerprint access-control system installation.',
    description_enriched_at = datetime('now')
WHERE slug = 'sastec-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sastel Packaging and Pharmaceuticals is a contract manufacturer and packer of health supplements, cosmetics and other liquid products, established in 1993 and now operating from a purpose-built facility in Winternest, Akasia.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.sastel.co.za/", "https://www.pharmacos.co.za/new-plant-and-location-for-sastel-pharmaceuticals/"]'
WHERE slug = 'sastel-packaging-and-pharmaceuticals-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Saunders Manufacturing & Sandblasting (Pty) Ltd specialises in sandblasting and powder-coating of commercial and industrial products, and manufactures custom steel products, while training and employing members of the local Eersterust community.',
    description_enriched_at = datetime('now')
WHERE slug = 'saunders-manufacturing-sandblasting-pty-ltd-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SavantCo is a business and taxation solutions provider in Eloffsdal offering accounts payable and receivable management, bank reconciliation, general ledger maintenance and financial reporting using cloud-based accounting software.',
    description_enriched_at = datetime('now')
WHERE slug = 'savantco-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Savax is an accounting practice based in Raslouw, Centurion, providing accounting and tax services to local businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'savax-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Savignac (Pretoria) Pty Ltd supplies aluminium window and door hardware and components from its Pretoria branch, serving both inland and coastal markets across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'savignac-pretoria-pty-ltd-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scaffold For Sale hires, supplies and erects scaffolding and formwork in Silverton, including the Quickstage and Quicklock systems, and sells refurbished scaffolding inspected and certified to SABS standards.',
    description_enriched_at = datetime('now')
WHERE slug = 'scaffold-for-sale-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scan Center Home Of Technology is a solar and renewable-energy business based in Roodeplaat, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scan-center-home-of-technology-pty-ltd-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ScanTrackSA (Pty) Ltd is a software development and IT solutions company operating from Faerie Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scantracksa-pty-ltd-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scania South Africa''s Rosslyn branch is an automotive repair and service centre for commercial trucks in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'scania-south-africa-pty-ltd-rosslyn-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scavenger Manufacturing is an industrial manufacturing business based in Silvertondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scavenger-manufacturing-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scheepers Pretorius Inc. is a law firm offering civil litigation, corporate law, criminal law, family law, labour law and correspondent services from its Brooklyn Bridge Office Park branch in Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-15:00'
WHERE slug = 'scheepers-pretorius-inc-brooklyn-pretoria-office-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scheffer Accountants offers business and personal tax returns, payroll and bookkeeping services, VAT services, and SARS and CIPC registration support from its Doornpoort office.',
    description_enriched_at = datetime('now')
WHERE slug = 'scheffer-accountants-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scholtz Partners International (Pty) Ltd. is a recruitment and HR services company based in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scholtz-partners-international-pty-ltd-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Schulenburg Attorneys is a law firm based in Lyttelton Manor, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'schulenburg-attorneys-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Schuster Industries is a building and construction business based in Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'schuster-industries-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Schutte''s Auto is an automotive repair workshop in Wonderboom South, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'schutte-s-auto-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scooters is a pizza restaurant and takeaway in Wierda 2 Shopping Centre, Wierda Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'scooters-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scotts Corner Pharmacy is a pharmacy located in Bloed Street Mall, Pretoria Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'scotts-corner-pharmacy-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Screamer Telecoms is an internet service provider offering fibre connectivity to homes and businesses in Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'screamer-telecoms-internet-service-provider-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Screamer Telecoms is an internet service provider offering fibre connectivity to homes and businesses in Olympus, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'screamer-telecoms-internet-service-provider-boardwalk-meander' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scriptlers IT Solutions is a software development and IT services company based in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scriptlers-it-solutions-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scuba Scene is a scuba-diving equipment retailer located in Lynnwood Bridge Office Park, Lynnwood Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'scuba-scene-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seal Project Management is a construction and project management business based in Donkerhoek, near Cullinan.',
    description_enriched_at = datetime('now')
WHERE slug = 'seal-project-management-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seamlessproductions.co.za is a Pretoria-based video production company creating TV ads, brand films and social media content for brands.',
    description_enriched_at = datetime('now')
WHERE slug = 'seamlessproductions-co-za-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Search My Business is a marketing and advertising business based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'search-my-business-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SearchZone Business Network is a marketing and advertising business based in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'searchzone-business-network-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seartec Trading is a copier and office-automation rental company, offering new and refurbished copiers on flexible month-to-month rental agreements to businesses across South Africa including Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seartec-trading-pretoria-branch-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seattle Coffee Co is a coffee shop and cafe at Club Crossing in Clubview, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'seattle-coffee-co-club-crossing-clubview' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seattle Coffee Company is a cafe in Brooklyn Mall, Brooklyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seattle-coffee-company-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seattle Coffee Company Castle Gate is a cafe located in Erasmus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seattle-coffee-company-castle-gate-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seawork SA Waterkloof is a general retail store in Waterkloof Heights Shopping Centre, Waterkloof Heights, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'seawork-sa-waterkloof-waterkloof-heights' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sebata Information Technology Solutions is a software development company based in Southdowns Office Park, Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sebata-information-technology-solutions-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sebata Municipal Solutions is a business consulting firm based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sebata-municipal-solutions-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seboweng Engineering Solutions, established in 2017, provides manufacturing, power generation and distribution, petrochemical, and building-services project management engineering solutions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = 'seboweng-engineering-solutions-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SecMet''s Centurion branch provides metallurgical and quality engineering services including corrosion engineering, welding engineering, plant integrity assessments, materials testing and failure analysis.',
    description_enriched_at = datetime('now')
WHERE slug = 'secmet-pty-ltd-centurion-branch-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sechepe Incorporated is a commercial property and office-space business based in Lotus Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sechepe-incorporated-lotus-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Secretary Bird - Company Secretarial Services provides company secretarial and legal support services from Benchmark Office Park in Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'secretary-bird-company-secretarial-services-clubview-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Secrets For Business Growth is a business-coaching practice offering short "Flash Coaching" sessions and customer-retention strategies to help entrepreneurs re-engage existing clients via WhatsApp, email and SMS.',
    description_enriched_at = datetime('now')
WHERE slug = 'secrets-for-business-growth-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sectech cc is an industrial supplier and manufacturer based in Rosslyn, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'sectech-cc-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Secundes Accountants offers tax advisory, accounting and payroll administration, business consulting, and estate-planning and company-secretarial services from its office on Pony Street, Hazeldean.',
    description_enriched_at = datetime('now')
WHERE slug = 'secundes-accountants-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Secure Alarm Systems Cc is a security-services provider based in Wolmer, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'secure-alarm-systems-cc-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Secure Legacy South Africa is an estate-planning practice in Magalieskruin offering wills, trusts, executorship and offshore estate-administration services.',
    description_enriched_at = datetime('now')
WHERE slug = 'secure-legacy-south-africa-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Secure Master is a security-services provider based in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'secure-master-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SecureGuard Solution (Pty) Ltd is a security-services provider based in Ninapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'secureguard-solution-pty-ltd-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Securitas Financial Group is an independent financial-services provider operating since 1989, offering life, short-term, business and medical insurance as well as wealth management, employee benefits and fiduciary services from its Boardwalk Office Park branch in Faerie Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'securitas-financial-group-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Security & Self Defense Centurion is a security-services retailer located at Centurion Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'security-self-defense-centurion-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Security Galore is a security-services provider based in Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'security-galore-bergtuin' AND description_enriched_at IS NULL;
