UPDATE businesses
SET description = 'Tyremart Polokwane CBD is a tyre-fitment centre on President Paul Kruger Street offering tyres, batteries, brakes, shocks, suspension work, wheel alignment, towbars and related vehicle services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.tyremart.co.za/polokwane-cbd/", "https://www.pirelli.com/tyres/en-za/car/find-your-dealer/dealer-locator/south-africa/polokwane/za0002401585", "https://tyremartpolokwane.co.za/contact-us-2/"]'
WHERE slug = 'tyremart-polokwane-cbd-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger Wheel & Tyre Polokwane CBD is a branch of the national tyre and wheel retail chain at the corner of President Paul Kruger and Grobler Street, offering tyre sales, fitment, wheel alignment and related vehicle services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'tiger-wheel-tyre-polokwane-cbd-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Turbo Tyres, trading as Point S Polokwane, is a tyre-fitment centre on President Paul Kruger Street offering tyre sales and fitment for cars, 4x4s and light commercial vehicles, along with wheel and accessory services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'turbo-tyres-point-s-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Hampton Court is a courier, printing and stationery outlet in Bendor offering copy and print services, domestic and international courier bookings, and private mailbox rental.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'postnet-hampton-court-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polokwane Tractors (Pty) Ltd is an agricultural machinery dealer in Futura specialising in Massey Ferguson and Challenger tractors and equipment for the local farming sector.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/16693293_3", "https://anyflip.com/hjwp/gygh/basic/51-100", "http://www.polokwanetractors.co.za/"]'
WHERE slug = 'polokwane-tractors-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank ATM Bok & Excelsior is a Nedbank automated teller machine located at the corner of Bok and Excelsior Street in Polokwane Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-atm-bok-excelsior-polokwane-central' AND description_enriched_at IS NULL;
