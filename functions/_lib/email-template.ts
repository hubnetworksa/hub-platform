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


function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}
