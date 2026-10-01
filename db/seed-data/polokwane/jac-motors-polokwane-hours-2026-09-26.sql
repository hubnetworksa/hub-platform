-- Trading hours for JAC Motors Polokwane (owner-supplied, 2026-09-26):
-- Mon-Fri 07:30-17:00, Sat 09:00-13:00, Sun closed.

UPDATE businesses
SET hours = 'Mon-Fri 07:30-17:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'jac-motors-polokwane-central' AND hours IS NULL;
