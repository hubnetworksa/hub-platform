INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'waterfall-walk-midrand', 'Waterfall Walk',
  (SELECT id FROM suburbs WHERE slug = 'midrand'),
  'Corner Allandale Road & Bekker Road, Vorna Valley, Midrand', NULL, NULL,
  '["https://www.timeout.com/johannesburg/news/a-sneak-peek-at-what-awaits-you-at-the-new-waterfall-walk-shopping-centre-041725", "https://www.crown.co.za/construction-world/property/29628-waterfall-walk-midrand"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'san-ridge-square-midrand', 'San Ridge Square',
  (SELECT id FROM suburbs WHERE slug = 'midrand'),
  'Corner Lever Road & New Road, Carlswald, Midrand', NULL, NULL,
  '["https://www.timeout.com/johannesburg/news/san-ridge-square-in-midrand-welcomes-two-new-restaurants-071025", "https://clicks.co.za/store/Sanridge-Square/259"]',
  'mall'
);
