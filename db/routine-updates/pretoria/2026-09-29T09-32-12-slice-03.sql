-- Job 4 description-enrichment, slice 03 (agent, ~50 businesses)
-- Each UPDATE guarded by description_enriched_at IS NULL so re-applying is safe.

UPDATE businesses
SET description = 'Rick Netshiozwi is a coaching and consulting practice based in Pretoria North, offering business coaching and life coaching alongside personal-development services and mentorship.',
    description_enriched_at = datetime('now')
WHERE slug = 'rick-netshiozwi-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rickard Air Diffusion''s Pretoria branch represents a variable-air-volume HVAC equipment manufacturer, operating since 1979, that designs diffusers, dampers, grilles and air-quality controls for commercial buildings.',
    description_enriched_at = datetime('now')
WHERE slug = 'rickard-air-diffusion-regional-branch-pretoria-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RideShield technologies is an industrial supplier and manufacturer based in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'rideshield-technologies-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ridge Mica is a hardware store in Waterkloof Lifestyle Centre, part of the Mica hardware group''s national network of more than 160 stores.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-18:00, Fri 08:00-17:15, Sat 08:00-16:00, Sun 09:00-14:00'
WHERE slug = 'ridge-mica-waterkloof-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ridge Pharmacy is a retail pharmacy in Sinoville Corner, Sinoville, providing pharmacy and dispensing services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:30-18:00'
WHERE slug = 'ridge-pharmacy-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ridge Surface Treatments CC and Ridge Powder Coating CC provide powder coating, sandblasting, hot-dip galvanizing and plating and anodising finishes for steel and engineering-plastic components in Sunderland Ridge, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ridge-surface-treatments-cc-ridge-powder-coating-cc-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riecktron is an industrial supplier and manufacturer based in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'riecktron-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rieks Towing Pretoria provides heavy- and medium-duty towing, vehicle recovery and roadside assistance, including accident-scene cleanup and secure vehicle storage, across the region.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'rieks-towing-pretoria-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rielle Creative Studio designs custom, conversion-focused websites for small businesses and entrepreneurs, along with website audits and semi-custom website templates.',
    description_enriched_at = datetime('now')
WHERE slug = 'rielle-creative-studio-the-hills-eco-game-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rietondale Music Centre offers music lessons in guitar, piano, violin, recorder, harp and voice, along with music theory classes and exam preparation for UNISA, Royal Schools and Trinity qualifications, for children from age 8 and adult beginners.',
    description_enriched_at = datetime('now')
WHERE slug = 'rietondale-music-centre-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rietvallei Cottages Pretoria is an accommodation provider in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rietvallei-cottages-pretoria-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RifleSURE is a specialist insurer offering tailored cover for South African hunters, sport shooters, collectors and firearm owners, with worldwide protection and public liability options across five package tiers.',
    description_enriched_at = datetime('now')
WHERE slug = 'riflesure-willow-park-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Right Quip is a hardware store serving Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'right-quip-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riken is a South African supplier of low-voltage AC and DC electrical products, operating for over 40 years with its head office in Pretoria and branches in the Eastern and Western Cape.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-15:00'
WHERE slug = 'riken-headquarters-pretoria-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rilanco Coaches operates a fleet of luxury coaches from 15 to 52 seats for charter, conference and group transport, including airport meet-and-greet service at OR Tambo.',
    description_enriched_at = datetime('now')
WHERE slug = 'rilanco-coaches-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ring Contact Fighting Art is a martial-arts organisation established in 1984, offering elite training and competitive fighting that blends boxing, knockdown karate, judo, wrestling and grappling.',
    description_enriched_at = datetime('now')
WHERE slug = 'ring-contact-fighting-art-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ring Mobile provides a cloud-based PBX phone system that lets businesses make and receive calls over the internet on mobile, desk phone or computer, with no monthly subscription.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'ring-mobile-pty-ltd-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ring-Ring-Hello (Pty) Ltd is a marketing and advertising agency based in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ring-ring-hello-pty-ltd-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ringpharm Riviera Pharmacy is a retail pharmacy offering dispensing and general pharmacy products with personalised, community-focused customer care.',
    description_enriched_at = datetime('now')
WHERE slug = 'ringpharm-riviera-pharmacy-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rise Luxury Massage Spa offers massage and wellness treatments in Garsfontein Ext 10.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-18:00'
WHERE slug = 'rise-luxury-massage-spa-garsfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rise Property Solutions is a commercial property and office space specialist serving Midfields Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rise-property-solutions-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Risima CM Consulting provides contracts management, project management and quantity surveying services, alongside cleaning products, office supplies and solar-geyser installation, and has worked with Eskom Distribution for over 17 years.',
    description_enriched_at = datetime('now')
WHERE slug = 'risima-cm-consulting-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Risimati Consulting Engineers is an engineering and surveying consultancy based in Constantia Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'risimati-consulting-engineers-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rithm Solutions is a computer and IT services provider based in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'rithm-solutions-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ritluka (Pty) Ltd is an industrial supplier and manufacturer based in Eco Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ritluka-pty-ltd-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ritrovo Ristorante is a restaurant in Waterkloof Heights Shopping Centre, Waterkloof Heights, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ritrovo-ristorante-waterkloof-heights' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rivera Consulting And Projects (Pty)Ltd provides electrical engineering, substation and cable-fault-location services, along with air-conditioning and generator work and equipment repairs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'rivera-consulting-and-projects-pty-ltd-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riverside Automotive Services Pty Ltd is an engineering and surveying business based in Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'riverside-automotive-services-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riverside Castle is a wedding services venue based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'riverside-castle-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riviera Kelders is a liquor store serving Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'riviera-kelders-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riviera Vleismark is a butchery serving Riviera, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'riviera-vleismark-riviera' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riyaphanda Projects is a building and construction company based in Dorandia, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'riyaphanda-projects-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rize Property Professionals specialises in residential letting and property management across Gauteng, handling tenant placement, rental compliance and landlord services for several hundred privately owned properties.',
    description_enriched_at = datetime('now')
WHERE slug = 'rize-property-professionals-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ro Water Purified Water Shop is an industrial supplier and manufacturer based in Elardus Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ro-water-purified-water-shop-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Road Lodge is a hotel in Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'road-lodge-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roadque manufactures and retails trailer, caravan and 4x4 components, including axles, couplers, jockey wheels, wheel rims and chassis parts, and has been built locally since 1996.',
    description_enriched_at = datetime('now')
WHERE slug = 'roadque-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roamcode is an IT company offering custom software development, AI-driven workflow automation, cloud and DevOps services, and web and mobile applications for South African and international businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'roamcode-clydesdale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rob''s Spice manufactures and supplies seasonings and spice blends, including chicken, BBQ, braai, peri-peri and curry spice, along with soya mince and sauces, and has traded since 2000.',
    description_enriched_at = datetime('now')
WHERE slug = 'rob-s-spice-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robber Stopper Gearlock manufactures anti-theft gear locks for vehicles including the Toyota Hilux, Fortuner and VW Polo Vivo, built from hardened steel with countrywide courier delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'robber-stopper-gearlock-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robcom Digital Marketing Agency is a computer and IT services business based in Ninapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'robcom-digital-marketing-agency-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robin Chat Coffee is a specialty coffee roaster and online retailer selling single-origin and house-blend beans, including washed, natural and carbonic-maceration processed coffees.',
    description_enriched_at = datetime('now')
WHERE slug = 'robin-chat-coffee-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robinson & Kruger Attorneys is a law firm offering attorney, conveyancing and notary services, operating since 1995.',
    description_enriched_at = datetime('now')
WHERE slug = 'robinson-kruger-attorneys-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robinson Distribution distributes enterprise security and networking hardware across Africa, including WatchGuard and Fortinet firewalls, email security, backup and network-monitoring solutions, and has operated since 1999.',
    description_enriched_at = datetime('now')
WHERE slug = 'robinson-distribution-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robotic Innovations Pty Ltd designs turnkey industrial automation and robotic systems for welding, material handling, palletising, vision-based picking and sheet-metal bending, and has operated since 2004.',
    description_enriched_at = datetime('now')
WHERE slug = 'robotic-innovations-pty-ltd-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Robotic Steelworks manufactures and installs palisade, designer and Clearview fencing, gates, balustrades, structural steelwork and aluminium windows and doors, with hot-dip galvanising and powder-coating finishing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-13:30, Sat-Sun Closed'
WHERE slug = 'robotic-steelworks-akasia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rochester is a fashion and clothing store in Centurion Lifestyle Centre, Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'rochester-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rochester is a furniture and homeware store in Centurion Mall, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'rochester-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rock Chucker Blasting Services (RCBS) is an engineering and surveying business based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rock-chucker-blasting-services-rcbs-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rock Solid Building and Construction is a building and construction company based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rock-solid-building-and-construction-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rockblend Readymix Concrete Pretoria is a building and construction company based in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'rockblend-readymix-concrete-pretoria-zwavelpoort' AND description_enriched_at IS NULL;
