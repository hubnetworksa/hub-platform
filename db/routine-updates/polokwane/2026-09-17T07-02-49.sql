-- Add trading hours for Clicks Seshego Circle (owner-provided).
UPDATE businesses
SET hours = 'Monday 08:00 - 18:00
Tuesday 08:00 - 18:00
Wednesday 09:00 - 18:00
Thursday 08:00 - 18:00
Friday 08:00 - 18:00
Saturday 08:00 - 17:00
Sunday 09:00 - 14:00
Public Holidays 09:00 - 14:00
Call to confirm'
WHERE slug = 'clicks-seshego-circle-seshego';
