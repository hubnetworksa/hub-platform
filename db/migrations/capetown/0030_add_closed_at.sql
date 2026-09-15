-- Keeps the businesses schema identical across sites even though only
-- Polokwane's build currently populates this (ported from its pre-migration
-- repo's hourly closed-business check) — see polokwane/0031_add_closed_at.sql.
ALTER TABLE businesses ADD COLUMN closed_at TEXT;
