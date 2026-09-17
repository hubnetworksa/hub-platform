-- Job 4: description enrichment sweep (full backlog of 9 businesses)
UPDATE businesses
SET description = 'Bargain Books Mall of the North is the local branch of the Bargain Books book and stationery chain, based inside Mall of the North in Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'bargain-books-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beauty of the Bride is a bridal boutique in Standard Bank Square offering wedding gowns from local and international designers, available to buy or hire, with an optional wedding-day hair-and-makeup package arranged through partner suppliers.',
    description_enriched_at = datetime('now')
WHERE slug = 'beauty-of-the-bride-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CRD Glass & Aluminium has operated in Futura since 2004, supplying and installing glass, aluminium windows, shopfronts and balustrades, along with security and automated garage doors, for projects across Limpopo.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.findmy.co.za/services/business/crd-glass-aluminuim/12767", "https://www.thinklocal.co.za/biz/crd-glass-aluminuim-polokwane", "https://www.brabys.com/za/limpopo/polokwane/futura/glass-aluminium/c-r-d-glass-aluminium", "https://crdglass.co.za/contact-us/"]'
WHERE slug = 'crd-glass-aluminium-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Freshmark is the fresh produce procurement and distribution arm of the Shoprite Group, buying and distributing fruit and vegetables from local and international growers to supply Group stores across South Africa and the rest of Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://dir.alltrack.org/view/395070-4-freshmark-pty.-ltd.", "https://www.thinklocal.co.za/biz/freshmark-polokwane", "https://www.brabys.com/za/limpopo/polokwane/futura/fresh-fruit-vegetables/freshmark-pty-ltd", "https://www.shopriteholdings.co.za/group/brands/freshmark.html"]'
WHERE slug = 'freshmark-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Indwe Risk Services is an independent insurance brokerage in Polokwane Central offering personal and business insurance together with risk-management advice for motor, household, commercial and corporate cover.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.indwe.co.za/contact.php", "https://www.brabys.com/business/5972026/south-africa/limpopo/polokwane/schoeman-st/risk-management-services/indwe-risk-services", "https://www.iisa.co.za/indwe"]'
WHERE slug = 'indwe-risk-services-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lighthouse Mica Hardware is a Mica-branded hardware store on Jorissen Street in Polokwane Central, stocking hardware, tiles, paint, timber and sanitaryware.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-16:00, Sun Closed',
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/hardware-retailers/lighthouse-mica", "https://vymaps.com/ZA/Lighthouse-Mica-206994/", "https://www.mica.co.za/store-location/limpopo/lighthouse-mica/"]'
WHERE slug = 'lighthouse-mica-hardware-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Northern Auto Panelbeaters is a panel-beating and spray-painting workshop in Futura offering auto body repairs for private and commercial vehicles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed'
WHERE slug = 'northern-auto-panelbeaters-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Signature Cosmetics Mall of the North is a cosmetics retailer inside Mall of the North stocking its own Signature-branded beauty products alongside international brands such as Revlon, Yardley and Bio-Oil.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://mallofthenorth.co.za/shop/signature-cosmetics/", "https://www.brabys.com/za/limpopo/polokwane/bendor/cosmetic-retailers/signature-cosmetics", "https://www.tiendeo.co.za/stores/polokwane/signature-cosmetics-cnr-r-and-n-interchange/26054"]'
WHERE slug = 'signature-cosmetics-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yellow Lemon Tree is a solid-wood furniture and interior-decor shop at Standard Bank Square, offering bespoke furniture, upholstery and curtaining alongside a showroom specialising in solid wooden beds.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.yellowlemontree.co.za/contact/", "https://www.cylex.net.za/company/yellow-lemon-tree-furniture---decor-shop-23738592.html", "https://za.polomap.com/polokwane/9325", "https://www.yellowlemontree.co.za/decor/"]'
WHERE slug = 'yellow-lemon-tree-polokwane-central' AND description_enriched_at IS NULL;
