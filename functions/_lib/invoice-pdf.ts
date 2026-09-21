// Builds the actual invoice PDF, branded per site. Pure JS (pdf-lib), so it
// runs in the Cloudflare Workers runtime with no filesystem, no canvas and no
// Node APIs — the same constraint every other function in this repo has.
import { PDFDocument, StandardFonts, rgb, degrees, type PDFFont, type PDFImage, type PDFPage, type RGB } from 'pdf-lib';

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
  /** The site's small square/portrait logo mark (PNG bytes) — NOT the big
   *  photographic hero banner. A financial document reads as more
   *  professional with a clean logo mark than a full-bleed photo, and it
   *  keeps the file small. Optional: the invoice still looks complete
   *  without it (falls back to the wordmark alone). */
  logoPng?: Uint8Array | null;
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
const MARGIN = 50;

const zar = (cents: number) => `R${(cents / 100).toLocaleString('en-ZA', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
const fmtDate = (d: Date) => d.toLocaleDateString('en-ZA', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'Africa/Johannesburg' });

function rgbFromCsv(csv: string): RGB {
  const [r, g, b] = csv.split(',').map((n) => Number(n.trim()) / 255);
  return rgb(r || 0, g || 0, b || 0);
}

export async function buildInvoicePdf(input: InvoiceInput): Promise<Uint8Array> {
  const doc = await PDFDocument.create();
  doc.setTitle(`Invoice ${input.invoiceNumber} — ${input.siteName}`);
  doc.setAuthor(input.siteName);
  doc.setProducer(input.siteName);
  doc.setSubject(`Tax invoice ${input.invoiceNumber}`);
  const page = doc.addPage([PAGE_W, PAGE_H]);
  const font = await doc.embedFont(StandardFonts.Helvetica);
  const bold = await doc.embedFont(StandardFonts.HelveticaBold);

  const accent = rgbFromCsv(input.accentRgb);
  const navy = rgbFromCsv(input.navyRgb);
  const grey = rgb(0.36, 0.4, 0.47);
  const lightGrey = rgb(0.88, 0.9, 0.93);
  const paleBg = rgb(0.96, 0.97, 0.98);
  const white = rgb(1, 1, 1);
  const green = rgb(0.13, 0.46, 0.23);

  let logo: PDFImage | null = null;
  if (input.logoPng?.length) {
    try {
      logo = await doc.embedPng(input.logoPng);
    } catch {
      logo = null; // a corrupt/unexpected image must never break the invoice
    }
  }

  let y = PAGE_H;

  // ---- Header — white letterhead with a colour accent, not a solid photo
  // or a full-width dark block: the logo mark is designed for a light
  // background (it's used on the site's own white nav bar), and a large
  // block of solid colour reads more like a flyer than an official document.
  const bandH = 108;
  let wordmarkX = MARGIN;
  if (logo) {
    const logoH = 40;
    const logoW = logo.width * (logoH / logo.height);
    page.drawImage(logo, { x: MARGIN, y: PAGE_H - 32 - logoH, width: logoW, height: logoH });
    wordmarkX = MARGIN + logoW + 12;
  }
  page.drawText(input.siteName, { x: wordmarkX, y: PAGE_H - 44, size: 19, font: bold, color: navy });
  page.drawText(input.domain, { x: wordmarkX, y: PAGE_H - 60, size: 9.5, font, color: grey });

  const title = 'TAX INVOICE';
  const titleSize = 20;
  const titleW = bold.widthOfTextAtSize(title, titleSize);
  page.drawText(title, { x: PAGE_W - MARGIN - titleW, y: PAGE_H - 42, size: titleSize, font: bold, color: navy });
  const numLabel = `#${input.invoiceNumber}`;
  const numW = font.widthOfTextAtSize(numLabel, 10.5);
  page.drawText(numLabel, { x: PAGE_W - MARGIN - numW, y: PAGE_H - 60, size: 10.5, font, color: accent });

  // A confident accent-coloured rule under the letterhead — the one bold
  // brand touch, doing the job the old full-width colour block did with
  // far less visual weight.
  page.drawRectangle({ x: 0, y: PAGE_H - bandH, width: PAGE_W, height: 3, color: accent });

  y = PAGE_H - bandH - 30;

  // ---- From / Bill To / Invoice details, three columns ----
  const colW = (PAGE_W - MARGIN * 2 - 32) / 3;
  const col = (i: number) => MARGIN + i * (colW + 16);

  const label = (text: string, x: number, yy: number) => {
    page.drawText(text, { x, y: yy, size: 8.5, font: bold, color: accent });
    page.drawLine({ start: { x, y: yy - 6 }, end: { x: x + colW, y: yy - 6 }, thickness: 0.75, color: lightGrey });
  };
  let lines: string[];

  label('FROM', col(0), y);
  lines = [
    input.siteName,
    ...(input.registeredAddress ? wrap(input.registeredAddress, colW, font, 10) : []),
    input.contactEmail,
    ...(input.registrationNumber ? [`Reg. ${input.registrationNumber}`] : []),
    ...(input.vatNumber ? [`VAT ${input.vatNumber}`] : []),
  ];
  drawLines(page, lines, col(0), y - 22, 12.5, font, 10, navy);

  label('BILL TO', col(1), y);
  lines = [input.billToName, ...(input.billToDetail ? wrap(input.billToDetail, colW, font, 10) : []), ...(input.billToEmail ? [input.billToEmail] : [])];
  drawLines(page, lines, col(1), y - 22, 12.5, font, 10, navy);

  label('INVOICE DETAILS', col(2), y);
  const details: [string, string][] = [
    ['Invoice date', fmtDate(input.issuedAt)],
    ['Payment date', fmtDate(input.paidAt)],
    ['Paid via', input.paymentMethod],
    ...(input.paymentReference ? ([['Reference', input.paymentReference]] as [string, string][]) : []),
  ];
  let dy = y - 22;
  for (const [k, v] of details) {
    page.drawText(k, { x: col(2), y: dy, size: 9, font, color: grey });
    page.drawText(v, { x: col(2) + 80, y: dy, size: 9, font: bold, color: navy });
    dy -= 13.5;
  }

  y = Math.min(y - 22 - 12.5 * Math.max(lines.length, details.length), y - 96) - 26;

  // ---- PAID stamp — a light rotated badge, restrained rather than a heavy graphic ----
  const stampCx = PAGE_W - MARGIN - 46;
  const stampCy = y + 8;
  page.drawRectangle({
    x: stampCx - 44, y: stampCy - 13, width: 88, height: 26, rotate: degrees(-6),
    borderColor: green, borderWidth: 1.3, color: green, opacity: 0.07,
  });
  page.drawText('PAID IN FULL', {
    x: stampCx - 38, y: stampCy - 5, size: 11.5, font: bold, color: green, rotate: degrees(-6),
  });

  y -= 26;

  // ---- Line items table ----
  const tableTop = y;
  const cDesc = MARGIN;
  const cAmt = PAGE_W - MARGIN - 90;
  page.drawRectangle({ x: MARGIN, y: tableTop - 26, width: PAGE_W - MARGIN * 2, height: 26, color: navy });
  page.drawText('DESCRIPTION', { x: cDesc + 10, y: tableTop - 17, size: 9, font: bold, color: white });
  page.drawText('AMOUNT', { x: cAmt, y: tableTop - 17, size: 9, font: bold, color: white });
  y = tableTop - 26;

  let subtotal = 0;
  input.lines.forEach((line, i) => {
    subtotal += line.amountCents;
    const rowH = 36;
    if (i % 2 === 1) page.drawRectangle({ x: MARGIN, y: y - rowH, width: PAGE_W - MARGIN * 2, height: rowH, color: paleBg });
    page.drawText(line.description, { x: cDesc + 10, y: y - 16, size: 11, font: bold, color: navy });
    page.drawText(line.detail, { x: cDesc + 10, y: y - 29, size: 9, font, color: grey });
    const amtText = zar(line.amountCents);
    const amtW = font.widthOfTextAtSize(amtText, 11);
    page.drawText(amtText, { x: PAGE_W - MARGIN - 10 - amtW, y: y - 16, size: 11, font, color: navy });
    y -= rowH;
  });
  page.drawLine({ start: { x: MARGIN, y }, end: { x: PAGE_W - MARGIN, y }, thickness: 1, color: navy });

  // ---- Totals ----
  // subtotal (the sum of the lines drawn above) IS the amount actually charged.
  // VAT, when applicable, is a back-calculated breakdown of that same total —
  // it never changes what the invoice says was paid.
  const total = subtotal;
  const vatRate = input.vatRatePercent ?? 0;
  const exVat = vatRate > 0 ? Math.round(total / (1 + vatRate / 100)) : total;
  const vatCents = total - exVat;

  y -= 14;
  const totalsX = PAGE_W - MARGIN - 200;
  const totalRow = (lbl: string, val: string, yy: number, strong = false) => {
    page.drawText(lbl, { x: totalsX, y: yy, size: strong ? 11.5 : 10, font: strong ? bold : font, color: strong ? white : grey });
    const w = (strong ? bold : font).widthOfTextAtSize(val, strong ? 13 : 10);
    page.drawText(val, { x: PAGE_W - MARGIN - 12 - w, y: yy, size: strong ? 13 : 10, font: strong ? bold : font, color: strong ? white : navy });
  };
  if (vatRate > 0) {
    totalRow('Subtotal (excl. VAT)', zar(exVat), y);
    y -= 16;
    totalRow(`VAT (${vatRate}%)`, zar(vatCents), y);
    y -= 12;
  } else {
    y -= 6;
  }
  // A solid navy band behind "Total paid" — the one figure that should be unmissable at a glance.
  const bandTop = y + 8;
  page.drawRectangle({ x: totalsX - 12, y: bandTop - 26, width: PAGE_W - MARGIN - (totalsX - 12), height: 26, color: navy });
  totalRow('Total paid', zar(total), bandTop - 18, true);
  y = bandTop - 26 - 34;

  // ---- Payment confirmation line ----
  page.drawText(`Payment of ${zar(total)} received via ${input.paymentMethod}${input.paymentReference ? ` (ref. ${input.paymentReference})` : ''} on ${fmtDate(input.paidAt)}.`, {
    x: MARGIN, y, size: 9, font, color: grey,
  });

  // ---- Footer ----
  const footerY = 58;
  page.drawLine({ start: { x: MARGIN, y: footerY + 24 }, end: { x: PAGE_W - MARGIN, y: footerY + 24 }, thickness: 0.75, color: lightGrey });
  page.drawText(input.siteName, { x: MARGIN, y: footerY + 9, size: 9, font: bold, color: navy });
  page.drawText(`${input.domain}  ·  ${input.contactEmail}`, { x: MARGIN, y: footerY - 3, size: 8.5, font, color: grey });
  page.drawText('This is a computer-generated tax invoice — no signature is required.', { x: MARGIN, y: footerY - 15, size: 8, font, color: grey });
  const invLabel = `Invoice ${input.invoiceNumber}`;
  const invLabelW = font.widthOfTextAtSize(invLabel, 8.5);
  page.drawText(invLabel, { x: PAGE_W - MARGIN - invLabelW, y: footerY + 9, size: 8.5, font, color: grey });

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
