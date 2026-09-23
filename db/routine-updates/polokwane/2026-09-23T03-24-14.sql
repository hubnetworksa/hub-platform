-- Job 4: description enrichment sweep, backlog cleared (9 businesses)
UPDATE businesses
SET description = 'Apple Tree Creche & Pre School is a pre-school and Grade R facility in Annadale, offering early childhood education and daycare for young children.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-17:00',
    source_urls = '["https://findapreschool.co.za/preschools/limpopo/polokwane", "https://www.facebook.com/p/Apple-Tree-Cr%C3%A8che-61562683847355/", "https://www.waze.com/live-map/directions/za/lp/polokwane/the-apple-tree-creche-andpre-school"]'
WHERE slug = 'apple-tree-creche-pre-school-annadale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bomat Security Service is a security company in Penina Park offering armed response, alarm monitoring, CCTV installation, access control and gate automation for homes and businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/penina-park/security-services/bomat-security-service", "https://www.yellosa.co.za/company/248887/bomat-security-service", "https://www.thinklocal.co.za/biz/bomat-security-services-polokwane", "https://www.procompare.co.za/providers/bomat-security-service"]'
WHERE slug = 'bomat-security-service-penina-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Enterprise Wholesalers is a fabric and textile wholesaler in Nirvana, trading since 1975, stocking fabrics, curtaining, upholstery, bridal wear, foam and bedding.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/enterprise-wholesalers-or-fabric-shops/593608", "https://www.thinklocal.co.za/biz/enterprise-wholesalers-polokwane", "https://www.facebook.com/enterprisefabrics/"]'
WHERE slug = 'enterprise-wholesalers-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fashion Crimp House is a curtain and blind specialist in Nirvana, manufacturing and installing curtains, roman, venetian, aluminium and roller blinds, and stocking fabric, haberdashery and curtain accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.nearfinderza.com/en/business/lp/polokwane/blinds/fashion-crimp-house_291806+7.html", "https://www.brabys.com/za/limpopo/polokwane/nirvana/curtains-pelmets-loose-covers/nirvana-fashion-crimp-house", "https://www.thinklocal.co.za/biz/fashion-crimp-house-nirvana-polokwane", "http://www.fashioncrimphouse.co.za/"]'
WHERE slug = 'fashion-crimp-house-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gabaza Security Services is a private security company in Hospital Park providing guarding and security services to homes and businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'gabaza-security-services-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ivy Med 24 is a family medical practice in Ivy Park offering general practitioner consultations.',
    description_enriched_at = datetime('now')
WHERE slug = 'ivy-med-24-ivy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morwa-Motsho Consulting Engineering is a consulting engineering firm in Penina Park providing engineering consultancy services.',
    description_enriched_at = datetime('now')
WHERE slug = 'morwa-motsho-consulting-engineering-penina-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shell Sediba Service Station is a Shell fuel station in Moregloed with an attached SPAR Express convenience store and a car wash.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://find.shell.com/za/fuel/10042980-sediba-service-station/en_ZA", "https://shellsediba.co.za/contact-us.html", "https://foursquare.com/v/spar-express-at-shell-sediba/5db6dd8fd2b3f600082dacca"]'
WHERE slug = 'shell-sediba-service-station-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westenburg Library is a public library in Westenburg, based at the Community Centre on Buys Avenue, offering library and reading services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'westenburg-library-westenburg' AND description_enriched_at IS NULL;
