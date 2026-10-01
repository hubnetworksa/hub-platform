-- Regulated pump prices effective 2 September 2026 (inland). Diesel 50ppm = 0.005% sulphur, Diesel 500ppm = 0.05% sulphur.
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'inland', 'Petrol 95', 2692, 134, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'inland', 'Petrol 93', 2676, 134, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'inland', 'Diesel 50ppm', 3005, 315, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'inland', 'Diesel 500ppm', 2911, 294, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
