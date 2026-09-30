UPDATE businesses
SET description = 'Dr I Bux is a general practice in Southfield, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-i-bux-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Natural Body Therapy is a day spa on Victoria Road offering massages, body scrubs, hot stone treatments, sports massage, and manicures and pedicures, in Southfield.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00',
    source_urls = '["https://www.fresha.com/lvp/natural-body-therapy-spa-victoria-road-cape-town-loPyPY", "https://www.cylex.net.za/company/natural-body-therapy-spa-23790925.html", "https://www.thespaguide.co.za/listing/cape-town/spa/natural-body-therapy/", "https://naturalbodytherapycpt.co.za/"]'
WHERE slug = 'natural-body-therapy-southfield' AND description_enriched_at IS NULL;
