UPDATE businesses
SET description = 'Nampak Liquid Packaging is a manufacturing plant in Seshego that produces packaging for liquid products, operated by Nampak, Africa''s largest diversified packaging company.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/seshego/containers-sales-hire/nampak-liquid-packaging-pty-ltd", "https://www.ananzi.co.za/ads/za/limpopo/polokwane/seshego/containers-sales-hire/nampak-liquid-packaging-pty-ltd", "https://www.findmy.co.za/services/business/nampak-liquid-packaging/12613", "https://en.wikipedia.org/wiki/Nampak"]'
WHERE slug = 'nampak-liquid-packaging-seshego' AND description_enriched_at IS NULL;
