INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  image_url, image_credit, image_source, organiser, organiser_note, doors, ages, parking, traders,
  description, source, verification_json
) VALUES (
  'limpopo-holiday-fair-2026-10-01', 'Limpopo Holiday Fair', 'Other', '2026-10-01', '3-day fair: 01 - 03 October',
  'Savannah Mall', 'Fauna Park', 'Cnr Grimm & Thabo Mbeki Street (R71), Fauna Park, Polokwane, 0699',
  NULL, NULL, 'No ticket needed',
  NULL, NULL, NULL,
  'Limpopo Tourism Agency', 'Annual provincial tourism showcase, held at Savannah Mall each year', NULL, NULL, NULL, NULL,
  'Exhibitors from across Limpopo province showcase the region''s travel destinations and tourism services at this annual fair inside Savannah Mall.',
  'agent',
  '["https://www.golimpopo.com/limpopo-holiday-fair/", "https://www.ledet.gov.za/pages/events.php", "https://www.cdm.org.za/wp-content/uploads/2022/11/Holiday-Fair-Newsletter-2-002.pdf"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  image_url, image_credit, image_source, organiser, organiser_note, doors, ages, parking, traders,
  description, source, verification_json
) VALUES (
  'polokwane-parkrun-2026-09-26', 'Polokwane parkrun', 'Sport', '2026-09-26', '08:00',
  'Tom Naude Park', 'Polokwane CBD', 'Cnr Landdros Mare St and Potgieter St (opposite Tom Naude Technical High School), Polokwane, 0700',
  'Free entry', 'https://www.parkrun.co.za/polokwane/', 'No ticket needed - free, timed with a parkrun barcode',
  NULL, NULL, NULL,
  'Polokwane parkrun volunteer team', 'Weekly free 5km timed event, running since 11 April 2015', NULL, 'All ages, walkers and volunteers welcome', NULL, NULL,
  'A free, weekly, volunteer-run 5km timed event on a mixed sand, gravel and grass course in a municipal park opposite Tom Naude Technical High School. Open to runners, joggers, walkers and volunteers of all standards.',
  'agent',
  '["https://www.parkrun.co.za/polokwane/", "https://blog.parkrun.com/za/2026/02/25/the-duo-of-polokwane-two-parkruns-one-growing-community/", "https://www.facebook.com/PolokwaneParkrun/"]'
);
