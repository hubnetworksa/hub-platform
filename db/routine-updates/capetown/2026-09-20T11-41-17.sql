UPDATE businesses
SET description = 'Cash Converters is a general retail store inside Ottery Hyper in Ottery.',
    description_enriched_at = datetime('now')
WHERE slug = 'cash-converters-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem is a pharmacy inside Ottery Hyper in Ottery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-16:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/dischem-shop--ottery-shopping-centre-new-ottery-road-ottery-cape-town/75598", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1866824", "https://www.dischem.co.za/ottery-western-cape"]'
WHERE slug = 'dis-chem-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mandela Park Spar is a supermarket inside Khaya Corner in Mandela Park, Khayelitsha, trading seven days a week.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-19:00'
WHERE slug = 'mandela-park-spar-mandela-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Hyper is a large-format supermarket inside Ottery Hyper in Ottery.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-hyper-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tirepoint is a tyre fitment and repair centre in Matroosfontein, offering wheel alignment, balancing and puncture repairs alongside a 24-hour national breakdown call centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/tyre-dealers/tirepoint-cape-town-pty-ltd", "https://tirepoint.co.za/contact/", "https://tirepoint.co.za/services/"]'
WHERE slug = 'tirepoint-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Fish Hoek Town Square in Fish Hoek.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue & Thu-Sun 09:00-19:30, Wed 09:00-17:00'
WHERE slug = 'woolworths-fish-hoek-town-square-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Victoria Wharf Shopping Centre in V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'woolworths-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside 3Arts Village in Plumstead.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Fri 08:00-19:00, Sat 08:30-13:30',
    source_urls = '["https://za.africabz.com/western-cape/woolworths-3arts-village-555571", "https://en.wikipedia.org/wiki/3Arts_Village", "https://my-catalogue.co.za/stores/cape-town/woolworths/shop-29-260-main-rd-plumstead"]'
WHERE slug = 'woolworths-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Capricorn Square in Muizenberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-19:00'
WHERE slug = 'woolworths-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket inside Edgemead Village Centre in Edgemead.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-19:00'
WHERE slug = 'woolworths-edgemead-village-centre-edgemead' AND description_enriched_at IS NULL;
