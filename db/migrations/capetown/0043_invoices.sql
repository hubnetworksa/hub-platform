-- Each completed PayFast payment gets a proper invoice (functions/_lib/invoicing.ts):
-- a numbered, branded PDF stored in R2 and emailed to the owner. These columns
-- record it against the payment row that earned it, so a re-run of the ITN
-- handler (PayFast retries a webhook) never issues the same invoice twice.
ALTER TABLE payments ADD COLUMN invoice_number TEXT;
ALTER TABLE payments ADD COLUMN invoice_pdf_key TEXT;
ALTER TABLE payments ADD COLUMN invoiced_at TEXT;
CREATE UNIQUE INDEX idx_payments_invoice_number ON payments(invoice_number);
