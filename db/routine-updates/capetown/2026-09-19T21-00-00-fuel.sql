-- Regulated pump prices effective 2 September 2026 (coastal). Diesel 50ppm = 0.005% sulphur, Diesel 500ppm = 0.05% sulphur.
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'coastal', 'Petrol 95', 2605, 134, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'coastal', 'Petrol 93', 2597, 134, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'coastal', 'Diesel 50ppm', 2879, 315, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-09', 'coastal', 'Diesel 500ppm', 2824, 294, 'https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/',
  '["https://businesstech.co.za/news/energy/872498/here-is-the-official-petrol-price-for-september-7/", "https://www.timeout.com/durban/news/petrol-prices-are-going-up-again-heres-what-durban-drivers-need-to-know-083126"]');
