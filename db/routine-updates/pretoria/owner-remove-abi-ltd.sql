-- Owner removal: Abi Ltd Pretoria is not a public business (wholesale bottling plant). Hidden via closed_at. Idempotent.
UPDATE businesses SET closed_at = datetime('now') WHERE slug = 'abi-ltd-pretoria-andeon' AND closed_at IS NULL;
UPDATE businesses SET closed_at = datetime('now') WHERE slug = 'ccbsa-floors-booysens' AND closed_at IS NULL;
UPDATE businesses SET closed_at = datetime('now') WHERE slug = 'inkwenkwezi-future-solutions-pty-ltd-woodhill-golf-estate' AND closed_at IS NULL;
UPDATE businesses SET closed_at = datetime('now') WHERE slug = 'descandant-security-eloffsdal' AND closed_at IS NULL;
UPDATE businesses SET closed_at = datetime('now') WHERE slug = 'pizza-hut-hazeldean' AND closed_at IS NULL;
