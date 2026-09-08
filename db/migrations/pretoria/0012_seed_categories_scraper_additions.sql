-- Categories added to accommodate the scraper CSV import
-- (scripts/import-scraper-csv.mjs) — Centurion's business mix skews heavily
-- toward B2B/industrial/professional-services firms that the original
-- consumer-storefront-focused taxonomy had no home for. Broad buckets by
-- design, matching the existing taxonomy's granularity (see 0005/0008
-- comments) rather than one category per niche supplier type.

INSERT INTO categories (slug, name) VALUES
  ('business-consulting', 'Business & Management Consulting'),
  ('marketing-advertising', 'Marketing & Advertising'),
  ('engineering-surveying', 'Engineering & Surveying Services'),
  ('logistics-courier-transport', 'Logistics, Courier & Transport'),
  ('solar-renewable-energy', 'Solar & Renewable Energy'),
  ('industrial-suppliers-manufacturing', 'Industrial Suppliers & Manufacturing'),
  ('commercial-property-office-space', 'Commercial Property & Office Space'),
  ('recruitment-hr-services', 'Recruitment & HR Services'),
  ('financial-investment-services', 'Financial & Investment Services');
