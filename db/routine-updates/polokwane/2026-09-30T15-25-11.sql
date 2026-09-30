UPDATE businesses
SET description = 'Macgyver Commercial Panel Beaters is a panel beating and auto body repair shop in Ladanna specialising in advanced structural and major body repairs to accident-damaged vehicles and trucks, working with major insurance companies and manufacturer approvals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-16:00, Sat-Sun Closed'
WHERE slug = 'macgyver-commercial-panel-beaters-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bradbury''s Auto Body is a panel beater and auto body repair shop in Ladanna known for structural and body repairs to motor vehicles, heavy commercial vehicles and trailers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat-Sun Closed'
WHERE slug = 'bradburys-auto-body-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Platinum Auto Panel Beaters is a panel beating shop in Ladanna offering structural and minor body repairs, spray painting, mag and rim repair, dent and bumper repair, and towing, and is part of the SAMBRA repairer network with RMI and MIBCO approvals.',
    description_enriched_at = datetime('now')
WHERE slug = 'platinum-auto-panel-beaters-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A standalone Absa ATM on Witklip Street in Ladanna, offering everyday cash withdrawals and banking transactions for the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'absa-atm-ladanna-ladanna' AND description_enriched_at IS NULL;
