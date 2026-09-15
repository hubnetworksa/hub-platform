UPDATE businesses
SET description = 'Fishaways Eldoraigne is a seafood and fish & chips takeaway restaurant inside Eldoraigne Village Shopping Centre, serving battered fish, prawns, calamari and fish burgers alongside curry pots, with dine-in, takeaway and delivery options.',
    description_enriched_at = datetime('now')
WHERE slug = 'fishaways-eldoraigne-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INYHWEBA CONSULTING (PTY) LTD is a business and management consulting firm based in Irene, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'inyhweba-consulting-pty-ltd-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IOX Fleet is a software company offering an online platform for managing traffic fines and vehicle licence renewals, providing instant fine notifications, electronic payment options and renewal reminders for fleet and private vehicle owners.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ioxfleet.co.za/", "https://www.offerzen.com/companies/iox-fleet-services"]'
WHERE slug = 'iox-fleet-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IP Dimension is an IT managed service provider based in Centurion, founded in 1997, offering hardware and software sales, onsite and remote support, cloud services, cybersecurity, backups and network solutions to businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ipdimension.co.za/", "https://za.linkedin.com/company/ip-dimension-pty-ltd"]'
WHERE slug = 'ip-dimension-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IPICO SPORTS is the Africa distributor of IPICO timing systems, providing RFID-based race timing technology and equipment for running, cycling, triathlon and other mass-participation sporting events.',
    description_enriched_at = datetime('now')
WHERE slug = 'ipico-sports-alphen-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IPMS Projects is a business and management consulting firm based in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ipms-projects-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IPS is a marketing and advertising agency based in Hazeldean, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ips-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IQ Dome is an attorneys and legal services firm based in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'iq-dome-rietvalleirand' AND description_enriched_at IS NULL;
