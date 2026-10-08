import type { Site } from './site';
import { formatPhoneZA } from '../../src/lib/phone';
import { plainLine } from '../../src/lib/rich-text';

// Table-based layout with inline styles throughout, on purpose — the usual
// constraints for HTML email (many clients strip <style> blocks or ignore
// external/embedded CSS entirely), not an oversight.

export interface OwnerConfirmEmailData {
  businessName: string;
  address: string | null;
  phone: string | null;
  website: string | null;
  description: string;
  confirmUrl: string;
}

export function ownerConfirmEmailHtml(site: Site, data: OwnerConfirmEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;

  const rows = ([
    ['Business', data.businessName],
    ['Address', data.address],
    ['Phone', formatPhoneZA(data.phone)],
    ['Website', data.website],
  ] as const)
    .filter(([, v]) => v)
    .map(
      ([k, v]) => `<tr>
        <td style="padding:10px 16px;border-bottom:1px solid ${t.border};color:${t.textMuted};font-size:13px;font-weight:600;width:110px;vertical-align:top;">${k}</td>
        <td style="padding:10px 16px;border-bottom:1px solid ${t.border};color:${t.text};font-size:14px;">${escapeHtml(v as string)}</td>
      </tr>`
    )
    .join('');

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;color:${t.navy};">Confirm your listing</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                Someone submitted <strong style="color:${t.text};">${escapeHtml(data.businessName)}</strong> to ${escapeHtml(site.siteName)}. Before it goes live, please check the details below are correct.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px;">
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid ${t.border};border-radius:8px;border-collapse:separate;">
                ${rows}
              </table>
              <p style="margin:16px 0 0;color:${t.text};font-size:14px;line-height:1.6;">${escapeHtml(plainLine(data.description))}</p>
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 32px;">
              <a href="${data.confirmUrl}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">Review &amp; confirm listing →</a>
              <p style="margin:16px 0 0;color:${t.textMuted};font-size:12px;">If you didn't request this, you can safely ignore this email — nothing publishes without your confirmation.</p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

export interface ListingLiveEmailData {
  businessName: string;
  listingUrl: string;
}

export function listingLiveEmailHtml(site: Site, data: ListingLiveEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;color:${t.navy};">You're live on ${escapeHtml(site.siteName)}! 🎉</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                Thanks for confirming — <strong style="color:${t.text};">${escapeHtml(data.businessName)}</strong> is now published and visible to everyone browsing ${escapeHtml(site.siteName)}.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px 28px;">
              <a href="${data.listingUrl}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">View your listing →</a>
              <p style="margin:16px 0 0;color:${t.textMuted};font-size:12px;">Need to change something? Just reply to this email.</p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

export interface VerifyEmailData {
  confirmUrl: string;
}

export function verifyEmailHtml(site: Site, data: VerifyEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;color:${t.navy};">Confirm your email</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                Thanks for creating a ${escapeHtml(site.siteName)} account. Please confirm this is your email address to finish setting it up. The link works once and expires in 24 hours.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px 28px;">
              <a href="${escapeHtml(data.confirmUrl)}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">Confirm my email →</a>
              <p style="margin:16px 0 0;color:${t.textMuted};font-size:12px;line-height:1.5;">Button not working? Paste this link into your browser:<br><span style="word-break:break-all;">${escapeHtml(data.confirmUrl)}</span></p>
              <p style="margin:12px 0 0;color:${t.textMuted};font-size:12px;">If you didn't create an account, you can safely ignore this email.</p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

export interface OwnerReminderEmailData {
  businessName: string;
  confirmUrl: string;
}

export function ownerReminderEmailHtml(site: Site, data: OwnerReminderEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;color:${t.navy};">Still waiting on your confirmation</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                A few days ago, <strong style="color:${t.text};">${escapeHtml(data.businessName)}</strong> was submitted to ${escapeHtml(site.siteName)} — it's still waiting on your confirmation before it can go live.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px 28px;">
              <a href="${data.confirmUrl}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">Review &amp; confirm listing →</a>
              <p style="margin:16px 0 0;color:${t.textMuted};font-size:12px;">If we don't hear back in a few more days, it won't be published.</p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}


export interface RelaunchEmailData {
  /** Per-user opt-out link (functions/api/unsubscribe.ts?t=<token>). */
  unsubscribeUrl: string;
  /** https://<domain>/my-businesses/ */
  dashboardUrl: string;
  /** https://<domain>/ */
  siteUrl: string;
}

// The one-off relaunch announcement (functions/api/admin/send-announcement.ts).
// Written from CHANGES-ETHAN-BRANCH.md — only features that actually shipped.
// Same shell as listingLiveEmailHtml; <ul> rather than nested tables for the
// bullets because every major client (Gmail, Outlook desktop and web, Apple
// Mail) renders a plain list with inline margins correctly.
export function relaunchEmailHtml(site: Site, data: RelaunchEmailData): string {
  const t = site.theme;
  const base = `https://${site.domain}`;
  const bannerUrl = `${base}${site.bannerImage}`;
  const logoUrl = `${base}/logo-icon.png`;
  const name = escapeHtml(site.siteName);
  const city = escapeHtml(site.cityLabel);

  const link = (path: string, label: string) =>
    `<a href="${base}${path}" style="color:${t.accent};font-weight:700;text-decoration:none;">${label}</a>`;
  const li = (html: string) => `<li style="margin:0 0 8px;">${html}</li>`;
  const h2 = (text: string) =>
    `<h2 style="margin:24px 0 10px;font-size:15px;line-height:1.3;color:${t.navy};text-transform:uppercase;letter-spacing:0.04em;">${text}</h2>`;
  const ul = (items: string[]) =>
    `<ul style="margin:0;padding:0 0 0 20px;color:${t.text};font-size:14px;line-height:1.55;">${items.join('')}</ul>`;

  const owners = ul([
    li(`${link('/my-businesses/', 'Your owner dashboard')}: edit your listing, trading hours and contact details yourself.`),
    li(`Paid plans add photos, an enquiry form that sends customer messages straight to your inbox, and stats on views and clicks.`),
    li(`Not managing your listing yet? ${link('/my-businesses/claim/', 'Claim it')} and we'll verify it with you.`),
    li(`Plans are Basic (free), Verified and Featured, plus exclusive sponsor spots on category, suburb and shopping-centre pages. Monthly or yearly billing. ${link('/pricing/', 'See plans and pricing')}.`),
  ]);

  const everyone = ul([
    li(`${link('/events/', `Events in ${city}`)}, with a form to add your own.`),
    li(`${link('/news/', 'Local news and this month’s fuel prices')}.`),
    li(`${link('/tourism/', 'Things to do')} in and around ${city}.`),
    li(`An ${link('/suburb/map/', 'interactive suburb map')} to browse by area.`),
    li(`Search with an <strong style="color:${t.text};">Open now</strong> filter so you only see businesses trading right now.`),
    li(`Install ${name} as an app: open the site in your phone’s browser and choose <em>Install</em> or <em>Add to Home screen</em>.`),
  ]);

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${name}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="${name} logo" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 8px;font-size:22px;line-height:1.25;color:${t.navy};">${name} has a new look</h1>
              <p style="margin:0;color:${t.textMuted};font-size:14px;line-height:1.55;">
                We’ve rebuilt ${name} from the ground up. The new site is faster, works properly on phones, and can be installed on your phone as an app. Here’s what’s changed.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px;">
              ${h2('For business owners')}
              ${owners}
              ${h2('For everyone')}
              ${everyone}
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 24px;">
              <a href="${data.dashboardUrl}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">Open your dashboard</a>
              <p style="margin:14px 0 0;font-size:14px;"><a href="${data.siteUrl}" style="color:${t.accent};font-weight:700;text-decoration:none;">See the new site</a></p>
            </td>
          </tr>
          <tr>
            <td style="padding:16px 32px 28px;border-top:1px solid ${t.border};">
              <p style="margin:0;color:${t.textMuted};font-size:12px;line-height:1.55;">
                You’re receiving this because you have an account on ${name}. We’ll only email you about your account and occasional service updates.
                <a href="${data.unsubscribeUrl}" style="color:${t.textMuted};text-decoration:underline;">Unsubscribe from updates</a>
                &middot; POPIA: see our <a href="${base}/privacy/" style="color:${t.textMuted};text-decoration:underline;">privacy policy</a>.
              </p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${name} &middot; ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

/** Plain-text twin of relaunchEmailHtml — sent as the `text` part, and what
 *  clients that refuse HTML show. Keep the two in step. */
export function relaunchEmailText(site: Site, data: RelaunchEmailData): string {
  const base = `https://${site.domain}`;
  const name = site.siteName;
  const city = site.cityLabel;
  return [
    `${name} has a new look`,
    ``,
    `We've rebuilt ${name} from the ground up. The new site is faster, works properly on phones, and can be installed on your phone as an app. Here's what's changed.`,
    ``,
    `FOR BUSINESS OWNERS`,
    ``,
    `- Your owner dashboard: edit your listing, trading hours and contact details yourself. ${base}/my-businesses/`,
    `- Paid plans add photos, an enquiry form that sends customer messages straight to your inbox, and stats on views and clicks.`,
    `- Not managing your listing yet? Claim it and we'll verify it with you. ${base}/my-businesses/claim/`,
    `- Plans are Basic (free), Verified and Featured, plus exclusive sponsor spots on category, suburb and shopping-centre pages. Monthly or yearly billing. ${base}/pricing/`,
    ``,
    `FOR EVERYONE`,
    ``,
    `- Events in ${city}, with a form to add your own. ${base}/events/`,
    `- Local news and this month's fuel prices. ${base}/news/`,
    `- Things to do in and around ${city}. ${base}/tourism/`,
    `- An interactive suburb map to browse by area. ${base}/suburb/map/`,
    `- Search with an "Open now" filter so you only see businesses trading right now.`,
    `- Install ${name} as an app: open the site in your phone's browser and choose "Install" or "Add to Home screen".`,
    ``,
    `Open your dashboard: ${data.dashboardUrl}`,
    `See the new site: ${data.siteUrl}`,
    ``,
    `--`,
    `You're receiving this because you have an account on ${name}. We'll only email you about your account and occasional service updates.`,
    `Unsubscribe from updates: ${data.unsubscribeUrl}`,
    `POPIA: see ${base}/privacy/`,
    ``,
    `${name} · ${site.contactEmail}`,
  ].join('\n');
}


export interface EnquiryEmailData {
  businessName: string;
  /** https://<domain>/business/<slug>/ */
  businessUrl: string;
  senderName: string;
  /** What the sender typed under "how to reach you": an email or a phone number. */
  contact: string;
  message: string;
  /** True when `contact` is an email address, so the owner can reply directly. */
  replyable: boolean;
}

// Sent to a business owner when someone uses the enquiry form on their listing
// (functions/api/enquiry.ts). Same shell as listingLiveEmailHtml. The sender
// controls name, contact and message, so every one of them is escaped.
export function enquiryEmailHtml(site: Site, data: EnquiryEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;
  const name = escapeHtml(site.siteName);
  const business = escapeHtml(data.businessName);
  const sender = escapeHtml(data.senderName);
  const contact = escapeHtml(data.contact);
  const message = escapeHtml(data.message).replace(/\r?\n/g, '<br>');

  const mailto = `mailto:${encodeURIComponent(data.contact).replace(/%40/g, '@')}?subject=${encodeURIComponent(`Re: your enquiry to ${data.businessName}`)}`;
  const contactCell = data.replyable
    ? `<a href="${escapeHtml(mailto)}" style="color:${t.accent};text-decoration:none;font-weight:600;">${contact}</a>`
    : `<span style="font-weight:600;">${contact}</span><br><span style="color:${t.textMuted};font-size:12px;">Call or message them</span>`;

  const row = (label: string, value: string, last = false) => `<tr>
                  <td style="padding:10px 16px;${last ? '' : `border-bottom:1px solid ${t.border};`}color:${t.textMuted};font-size:13px;font-weight:600;width:90px;vertical-align:top;">${label}</td>
                  <td style="padding:10px 16px;${last ? '' : `border-bottom:1px solid ${t.border};`}color:${t.text};font-size:14px;line-height:1.5;">${value}</td>
                </tr>`;

  const listingLink = `<a href="${escapeHtml(data.businessUrl)}" style="color:${t.accent};font-weight:700;text-decoration:none;">View your listing</a>`;
  const cta = data.replyable
    ? `<a href="${escapeHtml(mailto)}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">Reply to ${sender} →</a>
              <p style="margin:14px 0 0;font-size:14px;">${listingLink}</p>`
    : `<p style="margin:0;font-size:14px;">${listingLink}</p>`;

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${name}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;line-height:1.3;color:${t.navy};">New enquiry for ${business}</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                Someone contacted you through your ${name} listing.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px;">
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid ${t.border};border-radius:8px;border-collapse:separate;">
                ${row('From', sender)}
                ${row('Contact', contactCell, true)}
              </table>
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="margin-top:16px;">
                <tr>
                  <td style="background:${t.bgSubtle};border-left:3px solid ${t.accent};border-radius:4px;padding:14px 18px;color:${t.text};font-size:14px;line-height:1.6;">${message}</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 24px;">
              ${cta}
            </td>
          </tr>
          <tr>
            <td style="padding:16px 32px 28px;border-top:1px solid ${t.border};">
              <p style="margin:0;color:${t.textMuted};font-size:12px;line-height:1.55;">You're receiving this because you manage ${business} on ${name}.</p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${name} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

/** Plain-text twin of enquiryEmailHtml. Keep the two in step. */
export function enquiryEmailText(site: Site, data: EnquiryEmailData): string {
  return [
    `New enquiry for ${data.businessName}`,
    ``,
    `Someone contacted you through your ${site.siteName} listing.`,
    ``,
    `From: ${data.senderName}`,
    `Contact: ${data.contact}${data.replyable ? ' (reply to this email to answer them)' : ' (call or message them)'}`,
    ``,
    data.message,
    ``,
    `View your listing: ${data.businessUrl}`,
    ``,
    `--`,
    `You're receiving this because you manage ${data.businessName} on ${site.siteName}.`,
    `${site.siteName} · ${site.contactEmail}`,
  ].join('\n');
}

export interface ReportResolvedEmailData {
  businessName: string;
  reason: string;
  listingUrl: string;
  claimUrl: string | null;
}

export function reportResolvedEmailHtml(site: Site, data: ReportResolvedEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;
  const claim = data.claimUrl
    ? `<tr>
            <td style="padding:0 32px 28px;">
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid ${t.border};border-radius:10px;">
                <tr>
                  <td style="padding:16px 18px;">
                    <p style="margin:0 0 4px;font-size:15px;font-weight:700;color:${t.navy};">Is this your business?</p>
                    <p style="margin:0 0 12px;color:${t.textMuted};font-size:13px;line-height:1.5;">Claim it for free to keep its details up to date.</p>
                    <a href="${escapeHtml(data.claimUrl)}" style="display:inline-block;background:${t.navy};color:#ffffff;text-decoration:none;font-weight:700;font-size:14px;padding:10px 18px;border-radius:8px;">Claim this listing →</a>
                  </td>
                </tr>
              </table>
            </td>
          </tr>`
    : '';

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;color:${t.navy};">Your report has been fixed ✅</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                Thanks for helping keep ${escapeHtml(site.siteName)} accurate. The problem you reported about <strong style="color:${t.text};">${escapeHtml(data.businessName)}</strong> has been fixed.
              </p>
              <p style="margin:0 0 6px;color:${t.textMuted};font-size:12px;text-transform:uppercase;letter-spacing:.06em;font-weight:700;">You reported</p>
              <p style="margin:0 0 24px;padding:10px 14px;border-left:3px solid ${t.accent};background:${t.bgSubtle};color:${t.text};font-size:14px;line-height:1.5;border-radius:0 8px 8px 0;">${escapeHtml(data.reason).replace(/\n/g, '<br>')}</p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px 24px;">
              <a href="${escapeHtml(data.listingUrl)}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">View the updated listing →</a>
            </td>
          </tr>
          ${claim}
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}

// ---- Sales rep emails (functions/_lib/reps.ts) ----

function repShell(site: Site, heading: string, bodyHtml: string, ctaUrl: string, ctaLabel: string): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;
  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 12px;font-size:20px;color:${t.navy};">${heading}</h1>
              ${bodyHtml}
            </td>
          </tr>
          <tr>
            <td style="padding:8px 32px 28px;">
              <a href="${ctaUrl}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">${ctaLabel}</a>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

function repP(site: Site, html: string): string {
  return `<p style="margin:0 0 14px;color:${site.theme.textMuted};font-size:14px;line-height:1.55;">${html}</p>`;
}

export interface RepWelcomeEmailData {
  code: string;
  shareUrl: string;
  dashboardUrl: string;
}

export function repWelcomeEmailHtml(site: Site, data: RepWelcomeEmailData): string {
  const t = site.theme;
  const body =
    repP(site, 'Share your code with local businesses. When one buys a listing plan or sponsorship using it, you earn one month’s price of what they bought.') +
    `<p style="margin:0 0 6px;color:${t.textMuted};font-size:12px;text-transform:uppercase;letter-spacing:0.04em;">Your code</p>` +
    `<p style="margin:0 0 14px;font-size:30px;font-weight:800;letter-spacing:0.12em;color:${t.navy};">${escapeHtml(data.code)}</p>` +
    repP(site, `Your share link: <a href="${escapeHtml(data.shareUrl)}" style="color:${t.accent};font-weight:700;">${escapeHtml(data.shareUrl)}</a>`) +
    repP(site, 'You earn on the first payment only, not renewals. Commission is paid monthly by EFT once you have added your bank details on your dashboard.');
  return repShell(site, `You’re now a ${escapeHtml(site.siteName)} sales rep`, body, data.dashboardUrl, 'Open your dashboard →');
}

export function repWelcomeEmailText(site: Site, data: RepWelcomeEmailData): string {
  return `You're now a ${site.siteName} sales rep.\n\nShare your code with local businesses. When one buys a listing plan or sponsorship using it, you earn one month's price of what they bought.\n\nYour code: ${data.code}\nYour share link: ${data.shareUrl}\n\nYou earn on the first payment only, not renewals. Commission is paid monthly by EFT once you have added your bank details on your dashboard.\n\nDashboard: ${data.dashboardUrl}\n\nThe ${site.siteName} team`;
}

export interface RepSaleEmailData {
  clientName: string;
  productLabel: string;
  commissionRand: string;
  dashboardUrl: string;
}

export function repSaleEmailHtml(site: Site, data: RepSaleEmailData): string {
  const strong = (s: string) => `<strong style="color:${site.theme.text};">${escapeHtml(s)}</strong>`;
  const body =
    repP(site, `${strong(data.clientName)} just bought ${strong(data.productLabel)} using your code.`) +
    repP(site, `You earned ${strong('R' + data.commissionRand)}. It will be included in your next monthly payout.`);
  return repShell(site, 'You made a sale', body, data.dashboardUrl, 'View your earnings →');
}

export function repSaleEmailText(site: Site, data: RepSaleEmailData): string {
  return `You made a sale.\n\n${data.clientName} just bought ${data.productLabel} using your code.\n\nYou earned R${data.commissionRand}. It will be included in your next monthly payout.\n\nDashboard: ${data.dashboardUrl}\n\nThe ${site.siteName} team`;
}

export interface RepBankChangedEmailData {
  dashboardUrl: string;
  contactEmail: string;
}

export function repBankChangedEmailHtml(site: Site, data: RepBankChangedEmailData): string {
  const body =
    repP(site, 'The banking details on your sales rep account were just updated.') +
    repP(site, `<strong style="color:${site.theme.text};">If this wasn’t you, reply to this email immediately</strong> (${escapeHtml(data.contactEmail)}) so we can secure your account before any payout is made.`);
  return repShell(site, 'Your banking details were updated', body, data.dashboardUrl, 'Open your dashboard →');
}

export function repBankChangedEmailText(site: Site, data: RepBankChangedEmailData): string {
  return `Your banking details were updated.\n\nThe banking details on your sales rep account were just updated.\n\nIf this wasn't you, reply to this email immediately (${data.contactEmail}) so we can secure your account before any payout is made.\n\nDashboard: ${data.dashboardUrl}\n\nThe ${site.siteName} team`;
}

export interface RepPayoutEmailData {
  period: string;
  totalRand: string;
  reference: string | null;
  dashboardUrl: string;
}

export function repPayoutEmailHtml(site: Site, data: RepPayoutEmailData): string {
  const body =
    repP(site, `We’ve paid <strong style="color:${site.theme.text};">R${escapeHtml(data.totalRand)}</strong> to your bank account for ${escapeHtml(data.period)}.`) +
    (data.reference ? repP(site, `Payment reference: ${escapeHtml(data.reference)}`) : '');
  return repShell(site, `Your ${escapeHtml(data.period)} commission has been paid`, body, data.dashboardUrl, 'View your earnings →');
}

export function repPayoutEmailText(site: Site, data: RepPayoutEmailData): string {
  return `Your ${data.period} commission has been paid.\n\nWe've paid R${data.totalRand} to your bank account for ${data.period}.${data.reference ? `\nPayment reference: ${data.reference}` : ''}\n\nDashboard: ${data.dashboardUrl}\n\nThe ${site.siteName} team`;
}
