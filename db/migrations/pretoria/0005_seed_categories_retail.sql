-- OSM's real-world data skews heavily toward general retail (clothing,
-- groceries, electronics, jewellery) that the original service-focused
-- taxonomy didn't cover — added ahead of the bulk import so those
-- businesses have somewhere correct to go instead of being dropped.

INSERT INTO categories (slug, name) VALUES
  ('fashion-clothing', 'Fashion & Clothing'),
  ('supermarkets-groceries', 'Supermarkets & Groceries'),
  ('jewellers', 'Jewellers'),
  ('electronics-appliances', 'Electronics & Appliances'),
  ('shoe-stores', 'Shoe Stores'),
  ('books-stationery', 'Books & Stationery'),
  ('mobile-phones', 'Mobile Phones & Accessories'),
  ('toy-stores', 'Toy Stores'),
  ('liquor-stores', 'Liquor Stores'),
  ('convenience-stores', 'Convenience Stores'),
  ('pet-stores', 'Pet Stores & Supplies'),
  ('general-retail', 'General Retail');
