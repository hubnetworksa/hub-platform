UPDATE businesses
SET description = 'Alf Makaleng Primary School is a public, no-fee primary school in Seshego, classified Quintile 3, serving around 1,400 learners in the Seshego community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-14:30'
WHERE slug = 'alf-makaleng-primary-school-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hairby Ntshunxeko is a hair salon in Seshego specialising in cornrows and braided hairstyles, taking bookings by phone or WhatsApp.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/p/Hairby-Ntshunxeko-100072040531565/", "https://www.instagram.com/hairbyntshunxeko/", "https://www.tiktok.com/@mogalentshunxeko/video/7425139664719334662"]'
WHERE slug = 'hairby-ntshunxeko-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rev M.P. Malatjie Primary School is a public, no-fee primary school in Seshego, classified Quintile 3, serving around 1,360 learners in the Seshego community.',
    description_enriched_at = datetime('now')
WHERE slug = 'rev-m-p-malatjie-primary-school-seshego' AND description_enriched_at IS NULL;
