UPDATE businesses
SET description = '1UP Cash & Carry is a cash-and-carry grocery store on the corner of Military Road and Coniston Avenue in Steenberg, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 08:00-12:15 and 14:00-17:30, Sat 08:00-14:30, Sun and public holidays 08:30-12:30',
    source_urls = '["https://my-catalogue.co.za/stores/steenberg/1up-cash-and-carry/cnr-military-cornistan-avenue", "https://za.africabz.com/western-cape/1up-cash-carry-steenberg-367142", "https://my-catalogue.co.za/stores/cape-town/1up-cash-and-carry/cnr-military-coniston-park-steenberg"]'
WHERE slug = '1up-cash-and-carry-steenberg' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Dr Bianca Barron is a general practice based in the Foodprop Centre on Military Road in Steenberg, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-bianca-barron-steenberg' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Dr M S Jassiem is a general practice on Military Road in Steenberg, Cape Town, serving local patients.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-m-s-jassiem-steenberg' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Engen Strandfontein Service Station is a fuel station at the corner of Spine Road and Trafalgar Drive in Strandfontein Village, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'engen-strandfontein-strandfontein' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'OK MiniMark is a convenience grocery store in Blackberry Mall, at the corner of Dennegeur and Church streets in Strandfontein, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:30-21:00, Sun 08:00-20:30',
    source_urls = '["https://za.africabz.com/western-cape/ok-minimark-319543", "https://www.guzzle.co.za/ok-minimark/strandfontein/", "https://www.tiendeo.co.za/stores/mitchells-plain/ok-minimark-blackberry-mall-shop-no/37794"]'
WHERE slug = 'ok-minimark-strandfontein' AND description_enriched_at IS NULL;
