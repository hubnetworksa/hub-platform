UPDATE businesses
SET description = 'Alpha Pharm Lentegeur Pharmacy is a branch of the Alpha Pharm pharmacy franchise on Merrydale Road in Lentegeur, dispensing prescription medicines and other everyday pharmacy items.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.africanadvice.com/1301958/Pharmacies/Western_Cape/Lentegeur_Pharmacy/", "https://thinklocal.co.za/biz/lentegeur-pharmacy-mitchells-plain", "https://www.hotfrog.co.za/company/0dc538da048b5422832895641074ba9c/alpha-pharm-lentegeur-pharmacy/cape-town/pharmacies-prescriptions", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=182879"]'
WHERE slug = 'alpha-pharm-lentegeur-pharmacy-lentegeur' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Electrician CPT is a licensed and insured electrical contractor based in Lotus River, handling residential and commercial wiring, installations and repairs with over 10 years in the trade, including 24/7 emergency call-outs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://electriciancpt.co.za/lotus-river-electrician/", "https://www.biznizdirectory.co.za/electriciancpt-maintenance-construction-and-maintenance-in-lotus-river-grassy-park-western-cape-73805.html", "https://www.bestdirectory.co.za/electrician-cpt-building-types-construction-and-maintenance-in-lotus-river-grassy-park-western-cape.html", "https://electriciancpt.co.za/emergency-electrical-services/"]'
WHERE slug = 'electrician-cpt-lotus-river' AND description_enriched_at IS NULL;
