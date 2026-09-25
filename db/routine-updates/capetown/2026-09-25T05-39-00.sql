UPDATE businesses
SET description = 'Anchor Industries is a marine and offshore mooring equipment supplier established in 1994 and based in Ndabeni. It supplies new and used mooring gear and buoys, and offers anchor and buoy rental along with rigging and testing services including onsite socketing and splicing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://anchors.co.za/contact/", "https://za.africabz.com/western-cape/anchor-industries-145157", "https://www.processregister.com/Anchor_Industries/Supplier/sid15994.htm"]'
WHERE slug = 'anchor-industries-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Freeline is a screen printing and garment decoration business in Ndabeni, trading since the early 1980s and under its current ownership since 1995. It offers textile screenprinting, digital print and transfer, vinyl cut and transfer, sublimation printing, sportswear manufacture and embroidery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-16:30',
    source_urls = '["https://freeline.co.za/contact/", "https://www.africanadvice.com/1258202/Screen_Printers/Cape_Town/Freeline_Screenprint/", "https://freeline.co.za/"]'
WHERE slug = 'freeline-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pro-Fit Exhausts is a stainless steel exhaust specialist in Brooklyn, offering standard and performance exhaust systems, custom exhaust design and installation for all vehicle makes and models.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:00-17:00, Tue-Thu Closed, Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/pro-fit-exhausts-138616", "https://www.cybo.com/ZA-biz/pro-fit-exhausts_1c", "https://www.pro-fitexhausts.co.za/"]'
WHERE slug = 'pro-fit-exhausts-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superior Packaging Industries manufactures plastic packaging at its Ndabeni plant, handling extrusion, printing, laminating, bag-making and sheeting for the fresh produce, food, dairy, fertiliser and FMCG sectors. It holds BRC Global Standard certification at the highest AA grade for high-hygiene-risk packaging.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://superiorpackaging.co.za/contact/", "https://www.brabys.com/za/western-cape/cape-town/ndabeni/packaging-companies/superior-packaging-industries", "https://superiorpackaging.co.za/products/"]'
WHERE slug = 'superior-packaging-industries-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Voltmill is a generator and solar energy supplier in Ndabeni, offering sales, servicing and installation of solar power systems and generators for residential and commercial use in the Western Cape.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://voltmill.co.za/contact/", "https://www.cylex.net.za/company/voltmill-generators-and-solar-western-cape-23870206.html", "https://voltmill.co.za/installation/"]'
WHERE slug = 'voltmill-ndabeni' AND description_enriched_at IS NULL;
