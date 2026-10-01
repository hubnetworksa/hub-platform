-- Same invoicing pattern as `payments` (see 0043_invoices.sql) applied to
-- event_payments: a completed "Feature this event" payment gets a real
-- numbered PDF invoice, stored in R2 and emailed to the owner — see
-- functions/_lib/invoicing.ts's issueEventInvoice.
ALTER TABLE event_payments ADD COLUMN invoice_number TEXT;
ALTER TABLE event_payments ADD COLUMN invoice_pdf_key TEXT;
ALTER TABLE event_payments ADD COLUMN invoiced_at TEXT;
CREATE UNIQUE INDEX idx_event_payments_invoice_number ON event_payments(invoice_number);
