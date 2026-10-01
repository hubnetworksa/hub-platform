UPDATE businesses
SET description = 'Holly Wood Kitchens and Furniture is a design-led kitchen and furniture studio in Retreat, trading since 1999, specialising in farm-style freestanding kitchen furniture such as sink cupboards, islands and dressers crafted from reclaimed Oregon wood, offered in French Provencal, shaker, contemporary and South African country styles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-16:30, Fri 08:30-15:15, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.hotfrog.co.za/company/1099859734970368/holly-wood-kitchens-and-furniture/retreat/furniture", "https://www.cylex.net.za/company/holly-wood-kitchens-and-furniture-17765552.html", "https://hollywooddesignstudio.com/pages/about-us"]'
WHERE slug = 'holly-wood-kitchens-and-furniture-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rocklands Clinic is a City of Cape Town public primary healthcare facility on the corner of Lancaster Road and Park Avenue, offering child health, HIV care and testing, family planning, STI assessment and treatment, vaccinations and basic antenatal care on a walk-in basis.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://d7.westerncape.gov.za/facility/rocklands-clinic", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf", "https://clinicfinder.co.za/clinics/western-cape/rocklands-community-clinic-rocklands"]'
WHERE slug = 'rocklands-clinic-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rocklands Pharmacy operates from the BP garage on the corner of Caravelle Street and Handley-Page in Rocklands, offering prescription dispensing and over-the-counter medicine with a focus on affordable pricing for the local community, and is registered on the Woolworths Healthcare Fund pharmacy network.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/savemorepharmacies/", "https://distributors.oxygenproducts.org/listing/rocklands-pharmacies/", "https://www.wooltruhealthcarefund.co.za/static-assets/siteFiles/WHF_Pharmacy_WC_2025.pdf"]'
WHERE slug = 'rocklands-pharmacy-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shopmate Fish Traders is a fresh and frozen seafood supplier based in Retreat, established in 2007, delivering daily to restaurants and retail stores across the Western Cape and sourcing stock from sustainable fishing operations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1099862268551168/shopmate/retreat/foods", "https://cape-town.infoisinfo.co.za/card/shopmate/517122", "https://www.facebook.com/Shopmatefishtraders/"]'
WHERE slug = 'shopmate-fish-traders-retreat' AND description_enriched_at IS NULL;
