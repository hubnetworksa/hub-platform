-- thin-pages pretoria batch 03: checkpoint 1 (Silverton / Furniture & Homeware)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'double-click-furniture-silverton-silverton', 'Double Click Furniture Silverton',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  'Shop 5, Eastway Centre, 617 Pretoria Road, Silverton, Pretoria, 0184', '+27 10 023 4767', 'https://doubleclickfurniture.co.za', NULL,
  'Double Click Furniture Silverton is a furniture and homeware showroom trading from Shop 5 in the Eastway Centre on Pretoria Road, Silverton. It is one of several branches of the Double Click Furniture group, a South African retailer that manufactures its own beds and furniture rather than reselling imported stock, and the Silverton store carries the same factory-direct range of lounge suites, wooden furniture, bedroom sets and beds alongside general homeware.

Customers can shop in-store or arrange delivery for larger items, and the store accepts credit card payments as well as interest-free laybuy over three or six months, making bigger furniture purchases easier to budget for. The Silverton branch keeps extended weekday trading hours and shorter weekend hours, serving shoppers furnishing homes in Silverton and the surrounding eastern Pretoria suburbs who want affordably priced, locally manufactured furniture rather than imported big-box alternatives.',
  'Mon-Fri 09:00-17:30, Sat 09:00-15:00, Sun 09:00-13:00',
  NULL, NULL,
  '["https://doubleclickfurniture.co.za/contact/", "https://pretoria.co.za/place/double-click-furniture-silverton", "https://za.africabz.com/gauteng/double-click-furniture-silverton-535843"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'double-click-furniture-silverton-silverton'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
