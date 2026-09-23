UPDATE businesses
SET description = 'LEDA Seshego Training Centre provides skills and trade training programmes for entrepreneurs and small businesses, as part of the wider LEDA network supporting economic development across Limpopo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-16:00, Sat-Sun Closed',
    source_urls = '["https://www.lieda.co.za/index.php/leda-seshego-training-centre/", "https://www.findmy.co.za/services/business/leda-seshego-training-centre/40363", "https://www.brabys.com/za/limpopo/seshego/training-institutes/leda-seshego-training-centre", "https://www.yep.co.za/biz/store/iyp/10224753_3"]'
WHERE slug = 'leda-seshego-training-centre-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seshego Clinic 2 is a public healthcare clinic providing primary health services to residents of Seshego.',
    description_enriched_at = datetime('now')
WHERE slug = 'seshego-clinic-2-seshego' AND description_enriched_at IS NULL;
