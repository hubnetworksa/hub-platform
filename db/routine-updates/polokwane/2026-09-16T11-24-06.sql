UPDATE businesses
SET description = 'JB Accountants is an accounting firm operating from Ismini Office Park in Welgelegen, describing itself on its Facebook page as a progressive practice focused on giving business owners more time to run their business by handling their financial administration.',
    description_enriched_at = datetime('now')
WHERE slug = 'jb-accountants-welgelegen' AND description_enriched_at IS NULL;
