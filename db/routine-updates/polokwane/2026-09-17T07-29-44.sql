-- Skipper Bar Limpopo Mall was miscategorised as Restaurants & Takeaways
-- (its name reads like a pub, but it's a fashion retailer -- its own
-- description says "casualwear and footwear outlet", part of the SA
-- Skipper Bar chain that sells adidas/Nike/Levi's/Converse). Owner-flagged.
UPDATE business_categories
SET category_id = (SELECT id FROM categories WHERE slug = 'fashion-clothing')
WHERE business_id = (SELECT id FROM businesses WHERE slug = 'skipper-bar-limpopo-mall-polokwane-central')
  AND category_id = (SELECT id FROM categories WHERE slug = 'restaurants-takeaways');
