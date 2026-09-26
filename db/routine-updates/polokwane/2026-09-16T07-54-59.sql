-- One-time recategorization: move existing bank branches from the generic
-- financial-investment-services category into the dedicated banks-atms
-- category. Owner-directed correction, 2026-09-16 -- these are all banks,
-- misfiled at import time; banks-atms already existed but was unused.
-- Categories are a many-to-many join via business_categories, not a
-- column on businesses -- update the join row, leave is_primary as-is.
UPDATE business_categories
SET category_id = (SELECT id FROM categories WHERE slug = 'banks-atms')
WHERE category_id = (SELECT id FROM categories WHERE slug = 'financial-investment-services')
  AND business_id IN (
    SELECT id FROM businesses WHERE slug IN (
      'absa-mall-of-the-north-bendor',
      'absa-bank-metlife-plaza-lebowakgomo',
      'absa-bank-savannah-mall-fauna-park',
      'absa-bank-turfloop-plaza-mankweng',
      'capitec-mall-lebo-lebowakgomo',
      'capitec-bank-paledi-mall-mankweng',
      'fnb-mall-lebo-lebowakgomo',
      'fnb-mankweng-turfloop-plaza-mankweng',
      'fnb-polokwane-cbd-polokwane-central',
      'nedbank-landdros-mare-polokwane-central',
      'nedbank-seshego-circle-seshego',
      'standard-bank-seshego-circle-seshego'
    )
  );
