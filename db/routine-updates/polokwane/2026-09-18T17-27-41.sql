-- Job 4: description enrichment sweep, checkpoint 1 of 2 (records 1-10)

UPDATE businesses
SET description = 'African Bank – Mall@Lebo is a branch of the retail bank inside Mall@Lebo, offering everyday banking, loans, savings and investment products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallatlebo.co.za/shops-v2/", "https://www.africanbank.co.za/en/home/contact-us/find-a-branch/", "https://en.wikipedia.org/wiki/African_Bank_Limited"]'
WHERE slug = 'african-bank-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inkrite is a printer cartridge specialist inside Palm Centre, offering ink and toner cartridge refills as well as cartridge refurbishment and supplies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/inkrite-polokwane", "https://www.netpages.co.za/Polokwane/Inkrite-277819.html", "https://www.brabys.com/za/limpopo/polokwane/moregloed/printers-consumables/inkrite"]'
WHERE slug = 'inkrite-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'John Craig – Mall@Lebo is a branch of the South African menswear chain, stocking suits, blazers, shirts and chinos, with in-store tailors for fittings.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallatlebo.co.za/shops-v2/", "https://johncraig.co.za/stores/mall-lebo-john-craig/", "https://johncraig.co.za/clothing.html"]'
WHERE slug = 'john-craig-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Mutual – Mall@Lebo is a branch of the financial services group, offering life assurance, investment, retirement and personal loan products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallatlebo.co.za/shops-v2/", "https://en.wikipedia.org/wiki/Old_Mutual"]'
WHERE slug = 'old-mutual-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Cell – Mall@Lebo is a mobile specialist store selling cellphones, SIM cards, starter packs and airtime bundles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-14:00, Tue-Sat 09:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://mallatlebo.co.za/shops-v2/", "https://www.tiendeo.co.za", "https://pepcell.com/", "https://www.tiendeo.co.za/stores/lebowakgomo/pep-cell-shop-no-malllebo-corner-r-r/71203"]'
WHERE slug = 'pep-cell-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Home – Mall@Lebo is the homeware and décor arm of the PEP retail chain, stocking home textiles, décor and household goods.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallatlebo.co.za/shops-v2/", "https://www.waze.com/live-map", "https://mallatlebo.co.za/business-directory/pep/"]'
WHERE slug = 'pep-home-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rheeder Attorneys is a Polokwane law firm specialising in criminal defence and family law, including divorce, maintenance and child custody matters.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-15:30',
    source_urls = '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/rheeder", "https://lawzana.com/lawyer/rheeder-attorneys/polokwane"]'
WHERE slug = 'rheeder-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Senhor Peri-Peri (Thornhill) is a Portuguese-style peri-peri restaurant inside Thornhill Shopping Centre, serving flame-grilled chicken, burgers and grilled prawns.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-21:00'
WHERE slug = 'senhor-peri-peri-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skin Deep is a beauty and skincare salon inside Thornhill Shopping Centre, offering facials, chemical peels, microdermabrasion, waxing and nail treatments.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "http://www.skindeepplk.co.za/", "https://belliata.co.za/v/skindeep-polokwane-l10391-d72576"]'
WHERE slug = 'skin-deep-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Engen Bendor is a branch of the Steers flame-grilled fast-food chain, serving 100% pure beef burgers, chicken, ribs, hand-cut chips and thick milkshakes at an Engen forecourt in Bendor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/bendor-park/steers-cnr-veldspaat-and-munnik-streets-polokwane/36081", "https://www.tripadvisor.com/Restaurant_Review-g312624-d19056194-Reviews-Steers-Polokwane_Limpopo_Province.html", "https://app.steers.co.za/restaurants/polokwane"]'
WHERE slug = 'steers-engen-bendor-bendor' AND description_enriched_at IS NULL;
