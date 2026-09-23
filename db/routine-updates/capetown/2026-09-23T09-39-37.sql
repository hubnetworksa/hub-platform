UPDATE businesses
SET description = 'Ackermans Westgate Mall is a fashion and clothing store located inside Westgate Mall in Westgate, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-18:00'
WHERE slug = 'ackermans-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Westgate Mall is a fast-food restaurant and takeaway branch located inside Westgate Mall in Westgate, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southern Boards & Hardware is a timber and board merchant in Wetton, stocking melamine, MDF, veneer and shopfitting boards along with cutting and PVC edging services for the building and furniture trade.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.cylex.net.za/company/southern-boards---hardware-23744798.html", "https://www.cybo.com/ZA-biz/southern-boards-and-hardware", "https://nearfinderza.com/en/business/wc/cape-town/southern-boards-hardware_677093+8.html"]'
WHERE slug = 'southern-boards-hardware-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westridge Hardware is a hardware store in the Westridge Centre on Simonsig Road, Westridge, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'westridge-hardware-westridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wetton Bolt and Nut is an industrial fastener supplier in Wetton, stocking a wide range of stainless steel, galvanized steel, high tensile steel and brass bolts and nuts.',
    description_enriched_at = datetime('now')
WHERE slug = 'wetton-bolt-and-nut-wetton' AND description_enriched_at IS NULL;
