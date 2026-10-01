import type { Site } from './site';
import { sendEmail } from './send-email';
import { ownerConfirmEmailHtml } from './email-template';
import { formatPhoneZA } from '../../src/lib/phone';
import { plainLine } from '../../src/lib/rich-text';

export interface OwnerConfirmSubmission {
  name: string;
  address: string | null;
  phone: string | null;
  website: string | null;
  description: string;
}

/** The "please confirm your listing" email sent to the owner of a pending
 *  submission once the admin approves it (functions/api/confirm-listing.ts),
 *  and again on demand from admin (functions/api/admin/resend-owner-confirm.ts).
 *  Returns the subject and plain-text body too, so a caller can show them
 *  when sending fails. */
export async function sendOwnerConfirmEmail(
  env: { RESEND_API_KEY?: string },
  site: Site,
  to: string,
  row: OwnerConfirmSubmission,
  ownerToken: string
): Promise<{ sent: boolean; subject: string; text: string; confirmUrl: string }> {
  const confirmUrl = ownerConfirmUrl(site, ownerToken);
  const detailLines = [
    `Name: ${row.name}`,
    row.address && `Address: ${row.address}`,
    row.phone && `Phone: ${formatPhoneZA(row.phone)}`,
    row.website && `Website: ${row.website}`,
    `Description: ${plainLine(row.description)}`,
  ].filter(Boolean);
  const text = [
    `Hi,`,
    ``,
    `Someone listed "${row.name}" on ${site.siteName} — before it goes live, please confirm the details below are correct:`,
    ``,
    ...detailLines,
    ``,
    `Confirm or dispute here: ${confirmUrl}`,
  ].join('\n');
  const subject = `Please confirm your ${site.siteName} listing: ${row.name}`;

  const html = ownerConfirmEmailHtml(site, {
    businessName: row.name,
    address: row.address,
    phone: row.phone,
    website: row.website,
    description: row.description,
    confirmUrl,
  });

  const { sent } = await sendEmail(env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to,
    subject,
    text,
    html,
  });
  return { sent, subject, text, confirmUrl };
}

export function ownerConfirmUrl(site: Site, ownerToken: string): string {
  return `https://${site.domain}/owner-confirm-listing?token=${ownerToken}`;
}
