UPDATE businesses
SET description = 'Nampak Liquid Packaging is a plastics blow-moulding manufacturer on Freedom Drive, Seshego, producing container packaging for the liquid goods industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/seshego/containers-sales-hire/nampak-liquid-packaging-pty-ltd", "https://www.ananzi.co.za/ads/za/limpopo/polokwane/seshego/containers-sales-hire/nampak-liquid-packaging-pty-ltd", "https://www.findmy.co.za/services/business/nampak-liquid-packaging/12613", "https://www.yep.co.za/biz/store/iyp/3803836_2"]'
WHERE slug = 'nampak-liquid-packaging-seshego' AND description_enriched_at IS NULL;
