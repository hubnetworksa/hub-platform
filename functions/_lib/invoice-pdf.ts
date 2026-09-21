// Builds the actual invoice PDF, branded per site. Pure JS (pdf-lib), so it
// runs in the Cloudflare Workers runtime with no filesystem, no canvas and no
// Node APIs — the same constraint every other function in this repo has.
import { PDFDocument, StandardFonts, rgb, type PDFFont, type PDFPage, type RGB } from 'pdf-lib';

export interface InvoiceLine {
  description: string;
  detail: string;
  amountCents: number;
}

export interface InvoiceInput {
  siteName: string;
  domain: string;
  contactEmail: string;
  accentRgb: string; // "R, G, B" 0-255, e.g. site.theme.accentRgb
  navyRgb: string;
  /** Optional — only shown once the owner has supplied real company details. */
  registeredAddress?: string | null;
  vatNumber?: string | null;
  registrationNumber?: string | null;

  invoiceNumber: string;
  issuedAt: Date;

  billToName: string;
  billToDetail?: string | null; // business address, when known
  billToEmail?: string | null;

  /** What was actually charged for each line — VAT-inclusive, since that's how PayFast
   *  charged it and how the plan prices are shown on the site. */
  lines: InvoiceLine[];
  /** When set (only once the site has a VAT number), the total is treated as VAT-inclusive
   *  and broken into an ex-VAT subtotal + VAT line for display — the amount charged never
   *  changes. Omit or 0 when the site isn't VAT-registered: the invoice just shows the total. */
  vatRatePercent?: number | null;

  paymentMethod: string; // e.g. "PayFast"
  paymentReference?: string | null;
  paidAt: Date;
}

const PAGE_W = 595.28;
const PAGE_H = 841.89;
const MARGIN = 48;

const zar = (cents: number) => `R${(cents / 100).toLocaleString('en-ZA', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
const fmtDate = (d: Date) => d.toLocaleDateString('en-ZA', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'Africa/Johannesburg' });

function rgbFromCsv(csv: string): RGB {
  const [r, g, b] = csv.split(',').map((n) => Number(n.trim()) / 255);
  return rgb(r || 0, g || 0, b || 0);
}

export async function buildInvoicePdf(input: InvoiceInput): Promise<Uint8Array> {
  const doc = await PDFDocument.create();
  doc.setTitle(`Invoice ${input.invoiceNumber} — ${input.siteName}`);
  doc.setProducer(input.siteName);
  const page = doc.addPage([PAGE_W, PAGE_H]);
  const font = await doc.embedFont(StandardFonts.Helvetica);
  const bold = await doc.embedFont(StandardFonts.HelveticaBold);

  const accent = rgbFromCsv(input.accentRgb);
  const navy = rgbFromCsv(input.navyRgb);
  const grey = rgb(0.36, 0.4, 0.47);
  const lightGrey = rgb(0.88, 0.9, 0.93);
  const white = rgb(1, 1, 1);

  let y = PAGE_H;

  // ---- Header band ----
  const bandH = 92;
  page.drawRectangle({ x: 0, y: PAGE_H - bandH, width: PAGE_W, height: bandH, color: navy });
  page.drawText(input.siteName, { x: MARGIN, y: PAGE_H - 40, size: 20, font: bold, color: white });
  page.drawText(input.domain, { x: MARGIN, y: PAGE_H - 58, size: 10, font, color: rgb(0.75, 0.82, 0.92) });
  const title = 'TAX INVOICE';
  const titleW = bold.widthOfTextAtSize(title, 20);
  page.drawText(title, { x: PAGE_W - MARGIN - titleW, y: PAGE_H - 40, size: 20, font: bold, color: white });
  const numLabel = `#${input.invoiceNumber}`;
  const numW = font.widthOfTextAtSize(numLabel, 11);
  page.drawText(numLabel, { x: PAGE_W - MARGIN - numW, y: PAGE_H - 58, size: 11, font, color: accent });

  y = PAGE_H - bandH - 34;

  // ---- From / Bill To / Invoice details, three columns ----
  const colW = (PAGE_W - MARGIN * 2 - 32) / 3;
  const col = (i: number) => MARGIN + i * (colW + 16);

  const label = (text: string, x: number, yy: number) => page.drawText(text, { x, y: yy, size: 9, font: bold, color: grey });
  let lines: string[];

  label('FROM', col(0), y);
  lines = [
    input.siteName,
    ...(input.registeredAddress ? wrap(input.registeredAddress, colW, font, 10) : []),
    input.contactEmail,
    ...(input.registrationNumber ? [`Reg. ${input.registrationNumber}`] : []),
    ...(input.vatNumber ? [`VAT ${input.vatNumber}`] : []),
  ];
  drawLines(page, lines, col(0), y - 16, 12, font, 10, navy);

  label('BILL TO', col(1), y);
  lines = [input.billToName, ...(input.billToDetail ? wrap(input.billToDetail, colW, font, 10) : []), ...(input.billToEmail ? [input.billToEmail] : [])];
  drawLines(page, lines, col(1), y - 16, 12, font, 10, navy);

  label('INVOICE DETAILS', col(2), y);
  const details: [string, string][] = [
    ['Invoice date', fmtDate(input.issuedAt)],
    ['Payment date', fmtDate(input.paidAt)],
    ['Paid via', input.paymentMethod],
    ...(input.paymentReference ? ([['Reference', input.paymentReference]] as [string, string][]) : []),
  ];
  let dy = y - 16;
  for (const [k, v] of details) {
    page.drawText(k, { x: col(2), y: dy, size: 9, font, color: grey });
    page.drawText(v, { x: col(2) + 78, y: dy, size: 9, font: bold, color: navy });
    dy -= 13;
  }

  y = Math.min(y - 16 - 12 * Math.max(lines.length, details.length), y - 90) - 24;

  // ---- PAID stamp ----
  page.drawText('PAID', {
    x: PAGE_W - MARGIN - 62,
    y: y + 6,
    size: 13,
    font: bold,
    color: rgb(0.16, 0.5, 0.24),
  });
  page.drawRectangle({ x: PAGE_W - MARGIN - 72, y: y - 2, width: 74, height: 20, borderColor: rgb(0.16, 0.5, 0.24), borderWidth: 1.2, color: rgb(0.16, 0.5, 0.24), opacity: 0.08 });

  y -= 30;

  // ---- Line items table ----
  const tableTop = y;
  const cDesc = MARGIN;
  const cAmt = PAGE_W - MARGIN - 90;
  page.drawRectangle({ x: MARGIN, y: tableTop - 24, width: PAGE_W - MARGIN * 2, height: 24, color: rgb(0.95, 0.96, 0.98) });
  page.drawText('DESCRIPTION', { x: cDesc + 8, y: tableTop - 16, size: 9, font: bold, color: grey });
  page.drawText('AMOUNT', { x: cAmt, y: tableTop - 16, size: 9, font: bold, color: grey });
  y = tableTop - 24;

  let subtotal = 0;
  for (const line of input.lines) {
    subtotal += line.amountCents;
    const rowH = 34;
    page.drawText(line.description, { x: cDesc + 8, y: y - 15, size: 11, font: bold, color: navy });
    page.drawText(line.detail, { x: cDesc + 8, y: y - 28, size: 9, font, color: grey });
    const amtText = zar(line.amountCents);
    const amtW = font.widthOfTextAtSize(amtText, 11);
    page.drawText(amtText, { x: PAGE_W - MARGIN - 8 - amtW, y: y - 15, size: 11, font, color: navy });
    y -= rowH;
    page.drawLine({ start: { x: MARGIN, y }, end: { x: PAGE_W - MARGIN, y }, thickness: 0.75, color: lightGrey });
  }

  // ---- Totals ----
  // subtotal (the sum of the lines drawn above) IS the amount actually charged.
  // VAT, when applicable, is a back-calculated breakdown of that same total —
  // it never changes what the invoice says was paid.
  const total = subtotal;
  const vatRate = input.vatRatePercent ?? 0;
  const exVat = vatRate > 0 ? Math.round(total / (1 + vatRate / 100)) : total;
  const vatCents = total - exVat;

  y -= 10;
  const totalsX = PAGE_W - MARGIN - 190;
  const totalRow = (lbl: string, val: string, yy: number, strong = false) => {
    page.drawText(lbl, { x: totalsX, y: yy, size: strong ? 11 : 10, font: strong ? bold : font, color: strong ? navy : grey });
    const w = (strong ? bold : font).widthOfTextAtSize(val, strong ? 12 : 10);
    page.drawText(val, { x: PAGE_W - MARGIN - 8 - w, y: yy, size: strong ? 12 : 10, font: strong ? bold : font, color: navy });
  };
  if (vatRate > 0) {
    totalRow('Subtotal (excl. VAT)', zar(exVat), y);
    y -= 15;
    totalRow(`VAT (${vatRate}%)`, zar(vatCents), y);
    y -= 8;
  }
  page.drawLine({ start: { x: totalsX, y }, end: { x: PAGE_W - MARGIN, y }, thickness: 1, color: navy });
  y -= 18;
  totalRow('Total paid', zar(total), y, true);
  y -= 40;

  // ---- Footer ----
  const footerY = 60;
  page.drawLine({ start: { x: MARGIN, y: footerY + 22 }, end: { x: PAGE_W - MARGIN, y: footerY + 22 }, thickness: 0.75, color: lightGrey });
  page.drawText(`${input.siteName} — ${input.domain} — ${input.contactEmail}`, { x: MARGIN, y: footerY + 8, size: 8.5, font, color: grey });
  page.drawText('This is a computer-generated invoice; no signature is required.', { x: MARGIN, y: footerY - 5, size: 8.5, font, color: grey });
  page.drawText(`Invoice ${input.invoiceNumber}`, { x: MARGIN, y: footerY - 18, size: 8.5, font, color: grey });

  return doc.save();
}

function drawLines(page: PDFPage, lines: string[], x: number, startY: number, lineH: number, font: PDFFont, size: number, color: RGB) {
  let yy = startY;
  for (const l of lines) {
    page.drawText(l, { x, y: yy, size, font, color });
    yy -= lineH;
  }
}

/** Naive width-based wrap — good enough for a one- or two-line address on an invoice. */
function wrap(text: string, maxWidth: number, font: PDFFont, size: number): string[] {
  const words = text.split(/\s+/);
  const out: string[] = [];
  let cur = '';
  for (const w of words) {
    const next = cur ? `${cur} ${w}` : w;
    if (font.widthOfTextAtSize(next, size) > maxWidth && cur) {
      out.push(cur);
      cur = w;
    } else cur = next;
  }
  if (cur) out.push(cur);
  return out;
}
