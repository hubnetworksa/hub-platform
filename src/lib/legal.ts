// Shared legal copy for /privacy/ and /terms/. Structure, headings and base
// wording come from the design mockup's single "Legal" screen (four documents:
// Privacy & POPIA, Terms of use, Listing rules, Cookies). The clauses were
// audited against POPIA (Act 4 of 2013), ECTA (Act 25 of 2002, s43/s44), the
// CPA (Act 68 of 2008) and PAIA (Act 2 of 2000, s51) — see the headings for
// the sections each one answers. Strings are trusted, hand-written constants
// (some contain inline <a>/<strong> markup) rendered with set:html.
//
// Operator facts (trading name, legal form, VAT status) come from
// sites/<city>.json `legal`. The operator is a sole proprietor trading as
// "Hub Network SA" on all three sites, not VAT registered, with no company
// registration number and no published address — so nothing here renders an
// address line. Every field may be null; the wording falls back to a truthful
// generic sentence so the live site never shows a placeholder. operatorFacts()
// is shared with the About and Contact pages so all of them name the same
// operator and the same contact email.

import type { Site } from '../site';

export type LegalDocKey = 'privacy' | 'terms' | 'listing' | 'cookies';

export interface LegalSection {
  heading: string;
  /** One or more paragraphs (trusted HTML). */
  paragraphs: string[];
}

export interface LegalDoc {
  key: LegalDocKey;
  /** Tab label + page title. */
  label: string;
  /** Route the doc lives on. */
  route: '/privacy/' | '/terms/';
  /** URL fragment that selects this doc (empty for a route's primary doc). */
  hash: string;
  sections: LegalSection[];
}

/** Bump when the wording below changes. */
export const LEGAL_UPDATED = '1 October 2026';

/** How long we keep each kind of record — one place, so the Privacy notice,
 *  the Terms and the admin tooling can't drift apart. Figures either match
 *  what the code does today (sessions, rate limits, pending submissions,
 *  events, news) or are the operator's stated policy for data the code keeps
 *  until it is deleted by hand (messages, reports, claim documents, stats). */
export const RETENTION = {
  sessionDays: 30, // functions/_lib/auth.ts SESSION_DAYS
  rateLimitHours: 24, // functions/_lib/messages.ts housekeeping
  pendingSubmissionDays: 7, // process-owner-reminders: reminder after 3 days, deleted 4 days later
  pastEventDays: 14, // scripts/tidy-expired.mjs EVENT_GRACE_DAYS
  newsDays: 90, // scripts/tidy-expired.mjs NEWS_KEEP_DAYS
  listingAfterRemovalMonths: 12,
  messagesMonths: 24, // enquiries and contact-form messages
  reportsMonths: 24, // reports and removal requests
  statsMonths: 24, // business_stats rows (hashed visitor id + event)
  closedAccountDays: 30,
  paymentYears: 5, // Tax Administration Act 28 of 2011, s29
} as const;

/** Verified 1 October 2026 at https://inforegulator.org.za/contact-us/ (the
 *  Regulator moved from Braamfontein to Woodmead in mid-2025). */
export const INFORMATION_REGULATOR = {
  name: 'Information Regulator (South Africa)',
  physicalAddress: 'Woodmead North Office Park, 54 Maxwell Drive, Woodmead, Johannesburg, 2191',
  postalAddress: 'P.O. Box 31533, Braamfontein, Johannesburg, 2017',
  popiaComplaintsEmail: 'POPIAComplaints@inforegulator.org.za',
  paiaComplaintsEmail: 'PAIAComplaints@inforegulator.org.za',
  enquiriesEmail: 'enquiries@inforegulator.org.za',
  phone: '010 023 5200',
  tollFree: '0800 017 160',
  website: 'https://inforegulator.org.za/',
} as const;

export type LegalSite = Pick<Site, 'siteName' | 'contactEmail' | 'domain' | 'cityLabel'> & Partial<Pick<Site, 'legal'>>;

export interface OperatorFacts {
  /** The trading name ("Hub Network SA"), or "the operator of <siteName>" when unknown. */
  name: string;
  hasLegalName: boolean;
  /** Full plain-text description, e.g. "Hub Network SA, a sole proprietor
   *  trading as PretoriaHub" or "the operator of PretoriaHub, a sole
   *  proprietor" — never empty, never a placeholder. */
  description: string;
  /** Same as `description` with the trading name in <strong>. */
  descriptionHtml: string;
  legalForm: 'private company' | 'sole proprietor' | null;
  /** The natural person's full name, when the owner has chosen to publish it. */
  operatorName: string | null;
  registrationNumber: string | null;
  /** The one address for every request, notice and complaint. */
  email: string;
  vatRegistered: boolean;
  paiaManualUrl: string | null;
}

/** The one description of the operator every page uses (About, Contact,
 *  Privacy, Terms). Reads sites/<city>.json `legal`; every field may be null. */
export function operatorFacts(site: LegalSite): OperatorFacts {
  const legal = site.legal;
  const legalName = legal?.legalName?.trim() || null;
  const form = legal?.legalForm ?? null;
  const operatorName = legal?.operatorName?.trim() || null;
  const registrationNumber = legal?.registrationNumber?.trim() || null;

  const describe = (strong: (s: string) => string): string => {
    if (legalName) {
      const who = strong(legalName) + (form === 'sole proprietor' && operatorName ? ` (sole proprietor: ${operatorName})` : '');
      const what =
        form === 'sole proprietor'
          ? `a sole proprietor trading as ${site.siteName}`
          : form === 'private company'
            ? `a private company registered in South Africa${registrationNumber ? ` (registration number ${registrationNumber})` : ''}`
            : `the business behind ${site.siteName}`;
      return `${who}, ${what}`;
    }
    const who = strong(`the operator of ${site.siteName}`);
    return form === 'sole proprietor' ? `${who}, a sole proprietor` : form === 'private company' ? `${who}, a private company registered in South Africa` : who;
  };

  return {
    name: legalName ?? `the operator of ${site.siteName}`,
    hasLegalName: legalName !== null,
    description: describe((s) => s),
    descriptionHtml: describe((s) => `<strong>${s}</strong>`),
    legalForm: form,
    operatorName,
    registrationNumber,
    email: site.contactEmail,
    vatRegistered: legal?.vatRegistered === true,
    paiaManualUrl: legal?.paiaManualUrl?.trim() || null,
  };
}

const ext = (href: string, label: string) =>
  `<a href="${href}" target="_blank" rel="noopener noreferrer">${label}</a>`;

export function legalDocs(site: LegalSite): LegalDoc[] {
  const op = operatorFacts(site);
  const mail = `<strong>${site.contactEmail}</strong> (or use the <a href="/contact/">contact form</a>)`;
  const popiaMail = `<strong>${site.contactEmail}</strong> with “POPIA request” in the subject line`;
  const year = new Date().getFullYear();
  const R = RETENTION;
  const IR = INFORMATION_REGULATOR;

  // "PretoriaHub (pretoriahub.com) is operated by Hub Network SA, a sole
  // proprietor trading as PretoriaHub." — or, if the trading name were ever
  // unset, "…by the operator of PretoriaHub, a sole proprietor."
  const operatorSentence = `${site.siteName} (${site.domain}) is operated by ${op.descriptionHtml}.`;
  const vatSentence = op.vatRegistered
    ? 'We are registered for VAT and the prices shown include VAT at the current rate.'
    : 'We are <strong>not registered for VAT</strong>. No VAT is added to or included in any price shown on this site: the price you see is the full amount you pay.';
  // PAIA s1 defines a "private body" to include a natural person carrying on a
  // trade or business, so s51 applies to a sole proprietor; the 2021 exemption
  // for small private bodies ended on 31 December 2021.
  const paiaSentence =
    'The Promotion of Access to Information Act 2 of 2000 (PAIA) treats anyone carrying on a business — a sole proprietor included — as a “private body”, and section 51 requires every private body to keep a manual explaining what records it holds and how to ask for them. ' +
    (op.paiaManualUrl
      ? `Our PAIA manual is published at ${ext(op.paiaManualUrl, op.paiaManualUrl)}.`
      : `Our PAIA manual is available on request: email <strong>${site.contactEmail}</strong> with “PAIA manual” in the subject line and we will send you a copy free of charge.`);
  const regulatorParagraph =
    `If you are not satisfied with our response, you have the right to complain to the <strong>${IR.name}</strong>: ` +
    `${IR.physicalAddress}; postal address ${IR.postalAddress}; ` +
    `POPIA complaints ${ext(`mailto:${IR.popiaComplaintsEmail}`, IR.popiaComplaintsEmail)}; ` +
    `PAIA complaints ${ext(`mailto:${IR.paiaComplaintsEmail}`, IR.paiaComplaintsEmail)}; ` +
    `general enquiries ${ext(`mailto:${IR.enquiriesEmail}`, IR.enquiriesEmail)}; ` +
    `telephone ${IR.phone} or toll-free ${IR.tollFree}; ${ext(IR.website, 'inforegulator.org.za')}. ` +
    'The Regulator publishes the complaint form on its website.';

  return [
    {
      key: 'privacy',
      label: 'Privacy & POPIA',
      route: '/privacy/',
      hash: '',
      sections: [
        {
          heading: 'Who is responsible for your information',
          paragraphs: [
            `${operatorSentence} Email: <strong>${site.contactEmail}</strong>.`,
            `Under the Protection of Personal Information Act 4 of 2013 (POPIA) we are the “responsible party” for the personal information described in this notice. This notice is the information section 18 of POPIA says we must give you, written in plain language. The same notice applies to all three hub sites — TheCapeTownHub, PretoriaHub and PolokwaneHub — which ${op.name} runs together.`,
            `Requests and questions about personal information are handled by the operator personally: email ${popiaMail}.`,
          ],
        },
        {
          heading: 'What we collect, why, and on what legal basis',
          paragraphs: [
            'POPIA (section 11) lets us process personal information only where we have a lawful basis. For everything below, that basis is one of: <strong>your consent</strong>, which you can withdraw at any time; <strong>a contract with you</strong> (for example your account or a paid plan); <strong>a legal obligation</strong> (for example keeping tax records); or <strong>a legitimate interest</strong> of ours or of the public that does not override your rights (for example keeping the site secure, or publishing a directory of businesses).',
            '<strong>Accounts.</strong> When you register we collect your email address and a password (stored only as a one-way hash), or — if you sign in with Google — your Google account email and a Google account identifier. We use these to run your account, show you your listings and events, and send you the account and billing emails described below. Basis: contract.',
            '<strong>Listings and claims.</strong> When you submit or claim a business we collect your name, the business name, phone number, email address, physical address, trading hours, description, photos and website or social links, and — for a claim — your role at the business and a contact phone number or email we use to verify you. Business contact details are published on the listing; that is the purpose of the directory. Your own name and the verification details are not published. Basis: contract and legitimate interest.',
            '<strong>Claim documents.</strong> If you upload documents to prove you may act for a business (for example a letterhead or a municipal account), we store them privately so a person can review the claim. They are never published. Basis: legitimate interest in verifying who controls a listing, and your consent in uploading them.',
            '<strong>Enquiries and contact messages.</strong> An enquiry sent through a business page, or a message sent through our contact form, is stored together with the name and email address or phone number you give, and emailed to the business (for an enquiry) or to us (for a contact message). Basis: your consent in sending it, and performance of the service you asked for.',
            '<strong>Reviews, event submissions, reports and removal requests.</strong> We store what you submit (your display name and review text, event details and the contact details on an event, or the reason and email address on a report or removal request) so we can moderate it, publish what is meant to be public, and show what was decided. Reviews and events are published under the name you choose; reports and removal requests are not published. Basis: consent, and our legitimate interest in keeping the directory accurate.',
            '<strong>Payments.</strong> Paid plans, sponsorship spots and featured events are paid through PayFast. PayFast collects your card or bank details on its own secure pages; <strong>card numbers never reach our systems</strong>. We receive from PayFast only a confirmation of the payment, its amount, a PayFast reference and the subscription token we need to cancel a recurring plan, and we keep an invoice naming the business and the account email. Basis: contract and legal obligation (tax records).',
            '<strong>Technical and usage data.</strong> Our hosting provider keeps standard server logs (IP address, browser, pages requested) for security. When you send a form or view a business page we store a one-way hash of your IP address — not the address itself — so we can stop abuse (a few messages per hour per visitor) and count profile views, phone and website clicks and search appearances for the business owner’s own dashboard; the hash cannot be turned back into your IP address. Cookies and analytics are described in the Cookies tab. Basis: legitimate interest in running a secure, working website.',
          ],
        },
        {
          heading: 'Where listing data comes from',
          paragraphs: [
            'Business listing data (name, location, trading contact details, hours) comes from business owners’ own submissions and from research against publicly available sources — business websites, social media pages, other directories and map services such as Google Maps — never from private or personal accounts. Where POPIA requires it, this notice is how we tell a business owner that information about their business was collected from those public sources. If a listing is yours and you want it corrected or removed, use the “Claim”, “Report this listing” or “Request data removal” links on the listing page, or email us.',
            'If you submit a business listing or a correction, we store the contact details you provide solely to publish or verify that listing.',
          ],
        },
        {
          heading: 'Who we share it with',
          paragraphs: [
            'We do not sell personal information, and we do not share email lists with anyone. We use the following service providers (“operators” under sections 20 and 21 of POPIA), each bound by its own terms to process data only on our instructions and to protect it: <strong>Cloudflare</strong> (website hosting, database, file storage, content delivery and security logs); <strong>Resend</strong> (sending our emails); <strong>PayFast</strong> (payment processing — PayFast is also a responsible party in its own right for the payment data it collects, under its own privacy policy); <strong>Google</strong> (Google Analytics, Google AdSense advertising, and optional “Sign in with Google”); and <strong>GitHub</strong> (the build pipeline that turns the directory data into web pages). The homepage weather card uses the MET Norway weather service, to which no personal data is sent.',
            'Business owners receive the enquiries sent to their listing, including the sender’s name and contact details. We will disclose personal information where the law requires it (for example a lawful request from a court or regulator).',
          ],
        },
        {
          heading: 'Transfers outside South Africa',
          paragraphs: [
            'Our servers, database, file storage, email and analytics providers store and process data in data centres outside South Africa (mainly in the United States and the European Union). Section 72 of POPIA allows this where the recipient is bound by contractual terms that give the information substantially similar protection to POPIA, where the transfer is necessary to perform a contract with you, or where you consent. Each provider above is bound by a written data-processing agreement or terms to that effect, and using the site to create an account, list a business or send a message necessarily involves this transfer. If you do not want your information processed outside South Africa, please do not use those features; you can still browse the directory.',
          ],
        },
        {
          heading: 'How long we keep it',
          paragraphs: [
            'Section 14 of POPIA says we may keep personal information only as long as we need it for the purpose we collected it, or as long as the law requires. Our retention periods are:',
            `<strong>Account data:</strong> for as long as your account exists. Ask us to close it and we delete it within ${R.closedAccountDays} days, except what we must keep as a tax record (see payments). <strong>Login sessions:</strong> ${R.sessionDays} days, or until you log out.`,
            `<strong>Listing data:</strong> while the listing is live and for ${R.listingAfterRemovalMonths} months after it is removed, so we can restore a listing removed by mistake and show what was published if there is a dispute. <strong>Submissions never confirmed by the owner:</strong> deleted about ${R.pendingSubmissionDays} days after our approval if the owner does not respond to our confirmation email and reminder.`,
            '<strong>Claim documents:</strong> kept while the listing is live, as the record of who was allowed to control it, and deleted together with the listing. Once a claim has been decided you can ask us to delete the documents sooner and we will.',
            `<strong>Enquiries and contact messages:</strong> ${R.messagesMonths} months, then deleted. <strong>Reviews:</strong> while the listing is live, or until you ask us to remove your review. <strong>Reports and removal requests:</strong> ${R.reportsMonths} months, as the record of what was reported and what we did about it. <strong>Events:</strong> removed ${R.pastEventDays} days after the event ends (an event with a payment or ownership claim attached is kept as part of that record). <strong>News articles:</strong> ${R.newsDays} days.`,
            `<strong>Payment and invoice records:</strong> ${R.paymentYears} years from the end of the tax year, as section 29 of the Tax Administration Act 28 of 2011 requires. <strong>Rate-limit hashes:</strong> deleted after ${R.rateLimitHours} hours. <strong>Dashboard statistics (hashed visitor id and event):</strong> ${R.statsMonths} months. <strong>Server logs:</strong> kept by Cloudflare under its own short retention periods.`,
            'When a period ends we delete or anonymise the record. We may keep information longer where we need it to deal with a complaint, a legal claim or a request from a regulator.',
          ],
        },
        {
          heading: 'How we protect it, and what happens if something goes wrong',
          paragraphs: [
            'Section 19 of POPIA requires reasonable security measures. Ours include: HTTPS for every page and API call; passwords stored only as salted one-way hashes; login sessions in HttpOnly, Secure cookies that expire; one-time email links (password reset, claim verification, unsubscribe) stored only as hashes so a copy of the database cannot replay them; card details handled entirely by PayFast; claim documents stored in private storage that is only reachable through a review link; rate limits on every public form; and access to the admin tools limited to the operator. Our providers (Cloudflare, Resend, PayFast, Google) maintain their own independently audited security programmes.',
            'If we have reasonable grounds to believe personal information has been accessed or acquired by an unauthorised person, we will notify the Information Regulator and the affected people as soon as reasonably possible after discovering it, as section 22 of POPIA requires, and tell you what happened and what you can do.',
          ],
        },
        {
          heading: 'Your rights under POPIA',
          paragraphs: [
            `You have the right to: <strong>ask whether we hold personal information about you, and get a copy</strong> (section 23 — we confirm free of charge and may charge the prescribed fee for copies); <strong>have it corrected or deleted</strong> if it is inaccurate, out of date, excessive or no longer needed (section 24); <strong>object</strong> to processing based on our legitimate interests, on reasonable grounds (section 11(3)); <strong>object to direct marketing</strong> at any time (section 11(3)(b)); and <strong>withdraw consent</strong> where consent is our basis for processing (section 11(2)) — withdrawal does not affect what was lawfully done before it.`,
            `To exercise any of these, email ${popiaMail}, or use the <a href="/contact/">contact form</a> with “POPIA request” as the topic. Every business page also has a “Request data removal” link that sends us a removal request with your reason — we review each one by hand and confirm by email once it is actioned, usually within a few days. We may ask you to confirm your identity (for example by replying from the email address on the account or listing) before we act. We respond within 30 days.`,
            regulatorParagraph,
          ],
        },
        {
          heading: 'Emails we send, and how to stop them',
          paragraphs: [
            '<strong>Service emails</strong> are the emails your account or request needs and are not marketing: confirming a listing, claim or event; a password reset; an enquiry forwarded to your business; a payment confirmation and invoice; a renewal, cancellation or expiry notice; a reply to something you reported; or a notice that we have changed these terms. You receive these for as long as you have an account or an open request.',
            `<strong>Service announcements.</strong> Occasionally (a few times a year at most) we email account holders about ${site.siteName} itself — for example when we launch a new feature. Section 69 of POPIA lets us send these to our own customers about our own similar services, and you can stop them at any time: every announcement carries an “Unsubscribe from updates” link that takes effect immediately, or you can email us. Opting out never affects the service emails about your own account or billing.`,
            'We do not send marketing by SMS or telephone, we do not send marketing to visitors who only sent an enquiry or a report, and we never pass your details to anyone else for their marketing.',
          ],
        },
        {
          heading: 'Children',
          paragraphs: [
            'The site is not directed at children. You must be at least 18 to create an account, list a business or event, or buy a plan. We do not knowingly collect personal information from anyone under 18; if you believe we have, email us and we will delete it.',
          ],
        },
        {
          heading: 'Automated decisions',
          paragraphs: [
            'We do not make decisions about you by automated means that have legal or similarly significant effects (section 71 of POPIA). Rate limits and spam filters act automatically on form submissions, but a person reviews every listing, claim, review, event, report and removal request before anything is published, declined or removed.',
          ],
        },
        {
          heading: 'PAIA manual',
          paragraphs: [paiaSentence],
        },
        {
          heading: 'Changes to this notice',
          paragraphs: [
            'If we change this notice in a way that matters we will update the date at the top and, for account holders, say so by email. The current version always lives at this web address.',
          ],
        },
        {
          heading: 'Contact',
          paragraphs: [`Questions about this notice or your data: ${mail}. POPIA and PAIA requests: the same address, with “POPIA request” or “PAIA manual” in the subject line.`],
        },
      ],
    },
    {
      key: 'terms',
      label: 'Terms of use',
      route: '/terms/',
      hash: '',
      sections: [
        {
          heading: 'Who you are dealing with',
          paragraphs: [
            `${operatorSentence} Email: <strong>${site.contactEmail}</strong>; website: <strong>https://${site.domain}/</strong>. ${op.legalForm === 'sole proprietor' ? 'As a sole proprietorship there is no company registration number. ' : ''}${vatSentence}`,
            'These terms, together with the Listing rules, the Privacy & POPIA notice and the Cookies notice, are the whole agreement between you and us for using the site and buying anything on it. They are written to be read in plain language, as the Consumer Protection Act 68 of 2008 (CPA) requires. The information in this section and in the sections on paying, billing and refunds is the information section 43 of the Electronic Communications and Transactions Act 25 of 2002 (ECTA) requires an online supplier to give you. We are not a member of any self-regulatory or accreditation body and do not subscribe to an industry code of conduct. Email is our channel for notices: anything you need to send us in writing can be sent to the email address above.',
            'You can save or print this page at any time for your records; the date at the top shows the version that applies.',
          ],
        },
        {
          heading: 'Using the directory',
          paragraphs: [
            'The directory is free to search. You may not scrape, bulk-copy or resell the listing data, use it to send unsolicited marketing, or use the site in a way that breaks the law or interferes with other people’s use of it.',
          ],
        },
        {
          heading: 'Your account',
          paragraphs: [
            'You must be 18 or older to create an account. Keep your password private and tell us straight away if you think someone else has used your account; you are responsible for what is done with it until you do. You may close your account at any time by emailing us.',
          ],
        },
        {
          heading: 'Accuracy',
          paragraphs: [
            'We review every listing by hand, but details change. We do not warrant that any listing is current, and we are not a party to any transaction between you and a listed business.',
            `${site.siteName} aims for accurate listings but cannot guarantee every detail (hours, contact information, etc.) is current — always confirm directly with a business before relying on it for anything time-sensitive. Report inaccuracies via the “Report this listing” link on any business page.`,
          ],
        },
        {
          heading: 'Content you submit',
          paragraphs: [
            'When you submit a listing, photos, an event, a review, a reply to a review or any other content, you confirm that it is yours to submit, that it is accurate and lawful, and you give us a non-exclusive licence to publish it on the site and in our emails and search results for as long as it is live. Reviews must describe your own genuine experience; owners may reply to a review but may not review their own business or a competitor. We may edit for length or format, decline or remove any content at our discretion, and we will remove content that we are told is unlawful or that breaks the Listing rules.',
          ],
        },
        {
          heading: 'Paid plans and sponsorship: what you get, what it costs',
          paragraphs: [
            'Every business can be listed free. The paid Verified and Featured plans, the sponsorship spots (category, suburb, homepage banner, shopping-centre, guide and attraction sponsorships) and the once-off featured-event fee are described, with their current prices in South African rand, on the <a href="/pricing/">Plans & pricing</a> page. What each plan includes is listed there and in your dashboard before you pay.',
            `The price shown is the full price. ${vatSentence} There are no delivery, set-up or other charges. We may change prices with notice on the pricing page; a change never affects a period you have already paid for, and a renewal is charged at the price fixed when you took the plan unless we have told you otherwise before the renewal.`,
          ],
        },
        {
          heading: 'Paying, and when your plan goes live',
          paragraphs: [
            '<strong>Payment method and security.</strong> Payments are made by card or instant EFT through PayFast, a South African payment provider, on PayFast’s own secure, encrypted pages. Your card number is entered on PayFast’s page and never passes through or is stored on our systems. PayFast then confirms the payment to us by a signed notification that we verify before anything is activated.',
            '<strong>Before you pay</strong> you see a summary of the business, the plan or spot, the billing period and the exact amount, and you can go back and change any of it or abandon the order; nothing is charged until you confirm on PayFast’s page.',
            '<strong>When it goes live.</strong> A plan or sponsorship spot switches on automatically as soon as PayFast confirms the payment — usually within a minute of paying — and the change shows on the public website within about 15 to 25 minutes, when the site next rebuilds. A featured event goes live when we approve the event, which we aim to do within 24 hours. If a payment is confirmed but nothing has switched on within an hour, email us and we will fix it or refund you.',
            '<strong>Your records.</strong> We email a numbered PDF invoice for every payment, and every invoice can be downloaded again from the Billing section of your dashboard for as long as you have an account.',
          ],
        },
        {
          heading: 'Billing, renewal and cancellation',
          paragraphs: [
            '<strong>Monthly plans</strong> run month to month: you pay in advance for a month, and PayFast charges the same amount again each month until you cancel. <strong>Yearly plans</strong> are a fixed term of 12 months paid in advance, and PayFast charges the same amount again at the end of each year unless you cancel before the renewal date. <strong>Featured events</strong> are a once-off payment with no renewal.',
            '<strong>Cancelling.</strong> You can cancel any plan or sponsorship spot at any time from the Billing section of your dashboard, with no notice period and no cancellation fee. Cancelling stops the next charge; the plan keeps running until the end of the period you have already paid for and then ends. We send a notice when a plan is cancelled and when it expires.',
            '<strong>If you are a consumer under the CPA</strong> (an individual, or a business whose asset value or annual turnover is under the R2 million threshold), section 14 of the CPA gives you extra rights on a yearly plan, which we honour: we will notify you by email between 40 and 80 business days before each yearly expiry date, saying when it expires and whether anything changes if it renews; you may cancel a yearly plan at any time on 20 business days’ written notice (email is fine), including after an automatic renewal, in which case we refund the unused months less a reasonable cancellation charge of no more than one month’s fee; and nothing in these terms binds you to a yearly plan for longer than 24 months without your express agreement.',
            '<strong>Failed payments.</strong> If a renewal payment fails, PayFast retries it for a few days. If it still fails, the plan ends at the end of the paid period (plus a short grace period) and the listing drops to the free plan; nothing is owed for the unpaid period.',
          ],
        },
        {
          heading: 'Cooling-off and refunds',
          paragraphs: [
            '<strong>Seven-day cooling-off (ECTA section 44).</strong> You may cancel any new plan, sponsorship spot or featured-event purchase within 7 days of paying for it, for any reason and without penalty, by emailing us from the account’s email address. We refund the full amount within 30 days to the payment method you used, even though the plan went live immediately. The cooling-off right applies to the first payment for a plan, not to each monthly or yearly renewal.',
            '<strong>Other refunds.</strong> After the cooling-off period, a monthly plan is not refunded for the remainder of a month you have cancelled in; a yearly plan is refunded as set out above for consumers, and otherwise runs to the end of the paid year. If <em>we</em> remove a listing or sponsorship (for example because the business has closed, or we withdraw a product), we refund the unused part of what you paid, pro-rated by whole months. We do not refund a plan on a listing we remove because the owner broke the Listing rules or the law. If something we sold does not work as described, tell us: your rights under sections 55 and 56 of the CPA to a service of good quality, and a repair, replacement or refund if it is not, are not affected by anything here.',
            'Refunds are made through PayFast to the original card or account. If we fail to give you any of the information this page is meant to give you, section 43(3) of ECTA lets you cancel the purchase within 14 days of receiving it.',
          ],
        },
        {
          heading: 'Paid placements',
          paragraphs: [
            'Featured and sponsored placements are always labelled. Paying does not change how we rank organic results, and refunds are handled per the billing terms above.',
          ],
        },
        {
          heading: 'Our liability',
          paragraphs: [
            '<strong>Please read this section carefully: it limits what you can claim from us.</strong> The directory is provided as a free information service and we take reasonable care over it, but we do not promise that it is complete, accurate or always available, and we are not responsible for the goods, services or conduct of any listed business, advertiser or user. <strong>To the extent the law allows, our total liability to you for anything arising from the site or a plan, whether in contract, delict or otherwise, is limited to the fees you paid us in the three months before the claim arose, and we are not liable for indirect or consequential loss such as lost profits.</strong>',
            'Nothing in these terms excludes or limits our liability for death or injury caused by our gross negligence, for fraud, or for anything that the Consumer Protection Act or any other law does not allow us to exclude or limit; and nothing requires you to assume liability for our gross negligence. Where the CPA applies to you, these terms are to be read subject to it.',
          ],
        },
        {
          heading: 'Data sources',
          paragraphs: [
            'Listings come from business owners’ own submissions, from research against publicly available web sources (business websites, social media pages, other directories, and map services including Google Maps).',
          ],
        },
        {
          heading: 'Copyright',
          paragraphs: [
            `All original photography, graphics, the ${site.siteName} logo, and site design are © ${year} ${op.name}. They may not be copied, downloaded, reproduced, or reused on another site or in another publication without prior written permission. This does not apply to business listing data itself — see “Data sources” above for where that comes from.`,
          ],
        },
        {
          heading: 'Disputes and the law that applies',
          paragraphs: [
            `South African law applies to these terms and to anything you buy on the site. If something goes wrong, email ${mail} first — a person reads every message and we aim to resolve complaints within 10 business days. If we cannot sort it out, you may refer a consumer complaint to the Consumer Goods and Services Ombud (${ext('https://www.cgso.org.za/', 'cgso.org.za')}) or the National Consumer Commission (${ext('https://www.thencc.org.za/', 'thencc.org.za')}), a data-protection complaint to the Information Regulator (details in the Privacy & POPIA notice), or approach the courts of South Africa, including the small claims court for claims within its limit.`,
          ],
        },
        {
          heading: 'Changes to these terms',
          paragraphs: [
            'We may update these terms. We will update the date at the top and, for changes that affect a paid plan, email account holders at least 20 business days before the change applies to their plan. Continuing to use the site after that date means the new terms apply; if you do not agree, cancel your plan before then and the old terms apply until it ends.',
          ],
        },
        {
          heading: 'Contact',
          paragraphs: [mail],
        },
      ],
    },
    {
      key: 'listing',
      label: 'Listing rules',
      route: '/terms/',
      hash: '#listing-rules',
      sections: [
        {
          heading: 'Who may list',
          paragraphs: [
            'Any lawful business trading in the city or its surrounds. One listing per physical location.',
          ],
        },
        {
          heading: 'Submitting a listing',
          paragraphs: [
            'By submitting a business listing, you confirm you’re authorised to provide that business’s information and that it’s accurate. We may edit, decline, or remove listings at our discretion.',
          ],
        },
        {
          heading: 'What we reject',
          paragraphs: [
            'Businesses without a verifiable address or phone number, listings that duplicate an existing entry, adult services, and anything advertising an illegal product or service.',
          ],
        },
        {
          heading: 'Claiming',
          paragraphs: [
            'To claim an existing listing you must verify ownership by phone call to the number already on file, or by email from a domain matching the business website. We may also ask for a document that shows you act for the business; see the Privacy & POPIA notice for how claim documents are stored and for how long.',
          ],
        },
        {
          heading: 'Reviews',
          paragraphs: [
            'Reviews must be about your own genuine experience with the business, in your own words, with no personal attacks, no private information about anyone and no links. Owners and their staff may not review their own business or a competitor. Every review is checked by a person before it goes live; owners can reply publicly or flag a review for us to look at again.',
          ],
        },
        {
          heading: 'Removal',
          paragraphs: [
            'We remove listings on request from the owner, when a business closes, or when a listing breaks these rules. Any unused part of a paid plan is refunded pro-rata by whole months when we remove a listing — but not when it was removed for breaking these rules or the law. See “Cooling-off and refunds” in the Terms of use.',
          ],
        },
      ],
    },
    {
      key: 'cookies',
      label: 'Cookies',
      route: '/privacy/',
      hash: '#cookies',
      sections: [
        {
          heading: 'Essential cookies',
          paragraphs: [
            `When you sign in we set one cookie, <strong>session</strong>, that keeps you logged in for up to ${R.sessionDays} days (or until you log out). It is HttpOnly and Secure, contains only a random id, and is strictly necessary for the account features to work. During “Sign in with Google” a short-lived <strong>oauth_state</strong> cookie (10 minutes) protects the sign-in against forgery. Browsing the directory without signing in sets no cookies of our own.`,
          ],
        },
        {
          heading: 'Analytics',
          paragraphs: [
            `We use Google Analytics (GA4) to count page views and search terms in aggregate so we can see which parts of ${site.cityLabel} and which categories people use. Google sets its own cookies for this (<strong>_ga</strong> and <strong>_ga_…</strong>, up to 2 years) and processes the data on our behalf outside South Africa. Analytics only runs on the live ${site.domain} address, never on preview or admin pages. You can opt out with Google’s ${ext('https://tools.google.com/dlpage/gaoptout', 'browser add-on')} or by blocking cookies for this site.`,
          ],
        },
        {
          heading: 'Advertising',
          paragraphs: [
            'This site shows advertising through Google AdSense on some pages, including the pages of businesses on the free listing (never on a page where a paid plan or sponsorship is shown). Google and its partners may use cookies to serve and measure ads, including personalised ads based on your visits to this and other sites. You can view or opt out of personalised advertising at Google’s <a href="https://adssettings.google.com/" target="_blank" rel="noopener noreferrer">Ads Settings</a>, opt out of third-party vendors’ cookies at <a href="https://optout.aboutads.info/" target="_blank" rel="noopener noreferrer">aboutads.info</a>, and read more at Google’s <a href="https://policies.google.com/technologies/ads" target="_blank" rel="noopener noreferrer">How Google uses information from sites that use its services</a>.',
          ],
        },
        {
          heading: 'Hosting and security',
          paragraphs: [
            'The site is served by Cloudflare, which may set a small number of security cookies (for example <strong>__cf_bm</strong>, up to 30 minutes) to tell real visitors from bots. They contain no personal information we can read.',
          ],
        },
        {
          heading: 'Managing cookies',
          paragraphs: [
            'You can delete or block cookies in your browser settings at any time. Blocking the session cookie means you cannot stay signed in; blocking the Google cookies does not affect anything else on the site. We do not use any other tracking: the only cookies we set ourselves are the essential ones above.',
          ],
        },
      ],
    },
  ];
}
