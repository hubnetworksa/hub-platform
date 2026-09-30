UPDATE businesses
SET description = 'Barno Plastics manufactures PVC, Polyprop and leather promotional products and branded stationery, and operates as a Level 2 B-BBEE company, in Ndabeni.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/491416/barno-plastics-pty-ltd", "https://barno.co.za/contact-us/", "https://barno.co.za/"]'
WHERE slug = 'barno-plastics-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'C-Pack Corrugated manufactures custom-made corrugated cartons as well as standard-size stock cartons, in Epping Industria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/box-manufacturers/c-pack-corrugated", "https://c-pack.com/contact/", "https://opening-hours.co.za/04493176/C-Pack_Corrugated"]'
WHERE slug = 'c-pack-corrugated-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mancelle''s Locksmiths offers locksmithing services including key cutting, supply and fitting of locks, motor vehicle and motorcycle key coding, and alarm remotes for cars and gates, inside Viking Place Convenience Centre, Thornton.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://247locksmithscapetown.co.za/directory/mancelle-s-locksmiths-pty-ltd-7490/", "https://www.brabys.com/za/western-cape/cape-town/thornton/locksmiths/mancelles-locksmiths", "https://www.bikefinder.co.za/locksmith/mlpage.htm"]'
WHERE slug = 'mancelles-locksmiths-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TSIBA Business School is a CHE-accredited, DHET-registered private business school founded in 2004, offering a Higher Certificate in Business Administration, a Bachelor of Business Administration degree and a Postgraduate Diploma in Business Administration, with fees based on household income, in Ndabeni.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tsiba.ac.za/contact-us/", "https://www.waze.com/live-map/directions/za/wc/cape-town/tsiba-business-school", "https://mg.co.za/partner-content/2024-01-26-tsiba-business-school-celebrates-its-20th-anniversary/"]'
WHERE slug = 'tsiba-business-school-ndabeni' AND description_enriched_at IS NULL;
