UPDATE businesses
SET description = 'Arora Lights is a lighting retailer and showroom in Northgate Estate, Ysterplaat, supplying domestic, industrial and commercial light fittings since 1987, with a projects division handling lighting design, sourcing and installation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://northgateestate.co.za/arora-lights/", "https://aroralights.co.za/contact/", "https://aroralights.co.za/"]'
WHERE slug = 'arora-lights-ysterplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Space Interiors is a furniture and homeware business based in Northgate Estate, Ysterplaat.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-space-interiors-ysterplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Thornton Campus of the College of Cape Town offers technical and vocational training in Building and Civil Engineering, Engineering and Related Design, Mechanical Engineering, and trade testing for plumbing and welding.',
    description_enriched_at = datetime('now')
WHERE slug = 'college-of-cape-town-thornton-campus-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Italian Club of Cape Town is a members'' social club in Rugby with event and function facilities, including an on-site restaurant.',
    description_enriched_at = datetime('now')
WHERE slug = 'italian-club-of-cape-town-rugby' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Portuguese Club in Rugby is a Portuguese restaurant, sports bar and social club with two function rooms seating 60 to 400 guests and an in-house caterer, hosting weddings, parties and functions as well as monthly community lunches on the first Sunday of each month.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/portuguese-club-49504", "https://www.yellowpages.net.za/phone,27-829360881,Club,Cape-Town,ZA273996.html", "https://www.facebook.com/portugueseclubcapetown"]'
WHERE slug = 'portuguese-club-rugby' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Senior Flexonics Cape Town, a subsidiary of UK-based Senior plc established in Cape Town in 1997, designs, manufactures and supplies thin-gauge flexible stainless steel components and assemblies for vehicle and engine technology applications.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://flexonics.co.za/contact-2/", "https://panjiva.com/Senior-Flexonics/5226202", "https://flexonics.co.za/"]'
WHERE slug = 'senior-flexonics-cape-town-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Building Centre is a building materials and home-improvement store in Northgate Estate, Ysterplaat, next to Builders Warehouse.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00, Sat-Sun 10:00-15:00',
    source_urls = '["https://northgateestate.co.za/the-building-centre/", "https://www.thebuildingcentre.co.za/contact-us", "https://constructioncompanies.co.za/listing/the-building-centre/"]'
WHERE slug = 'the-building-centre-ysterplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Clothing Bank is a nonprofit social enterprise, founded in 2010, that trains unemployed mothers and fathers to run small resale businesses selling discounted donated clothing and other retail stock; its Thornton warehouse is where donated items are sorted and barcoded before distribution to traders citywide.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tcb.org.za/contact-us/", "https://www.devex.com/organizations/the-clothing-bank-168282", "https://twyg.co.za/the-clothing-banks-celebrates-ten-years-and-10-million-saved-garments/"]'
WHERE slug = 'the-clothing-bank-thornton' AND description_enriched_at IS NULL;
