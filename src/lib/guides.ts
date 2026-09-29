// Buyer's guides — written separately for each city, not one shared text
// with the city name swapped in. Each city's array can (and does) differ in
// substance: which municipality issues approvals, what the local housing
// stock or geography actually changes about the job, and how thick the
// market is for that trade. Only a guide whose full text exists is listed
// here — the index and the [slug] route are both generated from this
// object, so adding a guide means adding a real entry, never a placeholder.
//
// imageUrl is left unset until a real generated image exists for that guide
// (see scripts/generate-guide-images.mjs) — every consumer must treat it as
// optional and render nothing rather than a broken <img>, same convention
// used for tourism attraction photos.

export interface GuideSection {
  /** Anchor id used by the in-page "In this guide" list. */
  id: string;
  /** Full numbered heading shown in the article. */
  heading: string;
  /** Shorter label shown in the "In this guide" list. */
  tocLabel: string;
  paragraphs: string[];
}

export interface Guide {
  slug: string;
  /** Index-card category label (e.g. "Home & Trade"). */
  categoryLabel: string;
  /** Slug of the directory category whose real listings appear under the article. */
  categorySlug: string;
  /** Last breadcrumb segment. */
  breadcrumbLabel: string;
  readTime: string;
  /** Human-readable, shown in the byline. */
  updatedLabel: string;
  /** ISO 8601 (year-month), used for Article structured data. */
  updatedIso: string;
  /** Already resolved for this city — not a template, real per-city text. */
  title: string;
  blurb: string;
  intro: string;
  sections: GuideSection[];
  /** Set once scripts/generate-guide-images.mjs has produced and uploaded
   *  a real image for this guide (to /media/guides/<slug>.jpg in every
   *  city's own R2 bucket). Unset = no image yet, render nothing. */
  imageUrl?: string;
  imageCredit?: string;
}

const UPDATED_LABEL = 'September 2026';
const UPDATED_ISO = '2026-09';

const capetown: Guide[] = [
  {
    slug: 'how-to-choose-a-plumber',
    categoryLabel: 'Home & Trade',
    categorySlug: 'plumbers',
    breadcrumbLabel: 'Plumbers',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a plumber in Cape Town',
    blurb: 'PIRB registration, itemised quotes, insurance claims and warranties — the checks worth doing before you phone anyone.',
    intro:
      'A burst geyser at 21:00 is the worst time to start comparing quotes. These are the checks worth doing now, while nothing is leaking — and the questions that separate a registered plumber from a man with a bakkie.',
    sections: [
      {
        id: 'pirb-registration',
        heading: '1. Check the PIRB registration',
        tocLabel: '1. Check the PIRB registration',
        paragraphs: [
          'Any plumber working on a geyser or issuing a Certificate of Compliance must be registered with the Plumbing Industry Registration Board. Ask for the registration number and check it before work starts — an unregistered CoC will not satisfy your insurer.',
        ],
      },
      {
        id: 'written-quote',
        heading: '2. Get the quote in writing, itemised',
        tocLabel: '2. Get the quote in writing',
        paragraphs: [
          'A quote should separate call-out, labour rate, parts and VAT. Vague single-figure quotes are where disputes start. For geyser replacement, confirm whether the drip tray, vacuum breakers and overflow pipe are included — they usually are not.',
        ],
      },
      {
        id: 'insurance',
        heading: '3. Confirm who claims from insurance',
        tocLabel: '3. Confirm who claims',
        paragraphs: [
          'Most household policies cover geyser failure but require you to use an approved supplier. Phone your insurer before authorising work — paying cash and claiming later is usually refused.',
        ],
      },
      {
        id: 'warranty',
        heading: '4. Ask what happens if it fails again',
        tocLabel: '4. Ask about the warranty',
        paragraphs: [
          "A reasonable workmanship warranty is six months on labour, with the manufacturer's warranty on the unit itself. Get both in writing on the invoice, not verbally on the day.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-an-electrician',
    categoryLabel: 'Home & Trade',
    categorySlug: 'electricians',
    breadcrumbLabel: 'Electricians',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose an electrician in Cape Town',
    blurb: "Wireman's licence, the Certificate of Compliance, and the rewiring conversation older Cape Town homes end up having.",
    intro:
      "Plenty of Cape Town's housing stock — City Bowl, the southern suburbs, Bo-Kaap — is older than its wiring should be. That changes what to ask before someone opens a distribution board.",
    sections: [
      {
        id: 'licence-and-coc',
        heading: "1. Ask for the Wireman's Licence, not just a business card",
        tocLabel: "1. Wireman's Licence",
        paragraphs: [
          "Only a electrician with a valid Wireman's Licence can legally issue a Certificate of Compliance (CoC). You need a CoC to sell a property, and insurers can decline a fire or shock claim if the last work done wasn't compliant. Ask to see the licence, not just take a verbal assurance.",
        ],
      },
      {
        id: 'older-wiring',
        heading: '2. Budget for what an older board might reveal',
        tocLabel: '2. Older wiring, older boards',
        paragraphs: [
          'A callout for one faulty plug in an older Cape Town home sometimes surfaces a distribution board that needs upgrading before a CoC can honestly be issued. Ask upfront what happens if the board itself is below current standard — a fixed callout quote that balloons once the panel is open is the most common complaint in this trade.',
        ],
      },
      {
        id: 'water-ingress',
        heading: '3. Outdoor and damp-area points need the right rating',
        tocLabel: '3. Outdoor points',
        paragraphs: [
          "Coastal damp and Cape winter rain are hard on outdoor plug points, pool pumps and garden lighting that weren't rated or installed for wet areas. If you're adding an outdoor point, ask specifically for weatherproof (IP-rated) fittings rather than an indoor point run outside.",
        ],
      },
      {
        id: 'quote-and-warranty',
        heading: '4. Get a written quote and a workmanship warranty',
        tocLabel: '4. Quote and warranty',
        paragraphs: [
          'A proper quote separates call-out, labour and parts, and states whether the CoC itself is included in the price — it should be, for any compliance-triggering job. Ask for a workmanship warranty in writing, not a verbal "call me if it plays up."',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-builder',
    categoryLabel: 'Home & Trade',
    categorySlug: 'building-construction',
    breadcrumbLabel: 'Building & Construction',
    readTime: '7 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a builder or renovator in Cape Town',
    blurb: 'NHBRC enrolment, heritage-overlay approvals, and why a Cape Town renovation quote should include the council process, not just the build.',
    intro:
      "A renovation in a Cape Town heritage-overlay suburb runs on council time as much as builder time. Knowing that upfront changes how you read a quote and a timeline.",
    sections: [
      {
        id: 'nhbrc',
        heading: '1. Confirm NHBRC enrolment for new-build work',
        tocLabel: '1. NHBRC enrolment',
        paragraphs: [
          'Any new dwelling built in South Africa legally has to be enrolled with the National Home Builders Registration Council before work starts, which also covers structural defects for years afterwards. A major renovation or extension is a greyer area — ask directly whether the builder enrols this specific job, and get the enrolment number.',
        ],
      },
      {
        id: 'heritage-approval',
        heading: '2. Ask who is handling council plan approval',
        tocLabel: '2. Council plan approval',
        paragraphs: [
          "Properties in Cape Town's heritage-overlay areas (Bo-Kaap, the City Bowl, parts of Constantia and Sea Point among them) go through a slower, stricter City of Cape Town plan-approval process than a standard suburb. A realistic builder will say so upfront and separate the approval timeline from the build timeline in the quote — a fixed \"start date\" before plans are even submitted is a warning sign.",
        ],
      },
      {
        id: 'staged-payments',
        heading: '3. Pay in stages, tied to completed work',
        tocLabel: '3. Staged payments',
        paragraphs: [
          "A deposit to secure the date is normal; a request for most of the contract value before work starts is not. Agree payment milestones tied to visible progress (foundations, roof, plaster, snag-free handover) in the written contract.",
        ],
      },
      {
        id: 'water-wise',
        heading: '4. Ask about greywater and water-wise fittings',
        tocLabel: '4. Water-wise fittings',
        paragraphs: [
          "Many Cape Town renovations now bundle in a greywater line or rainwater tank while walls are already open — cheaper to add now than retrofit later. Ask whether it's been priced in or left out, so it isn't a surprise add-on mid-project.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-mechanic',
    categoryLabel: 'Motoring',
    categorySlug: 'automotive-repairs',
    breadcrumbLabel: 'Automotive & Repairs',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a mechanic in Cape Town',
    blurb: 'RMI accreditation, salt-air corrosion, and the quote-before-work conversation that avoids a surprise bill.',
    intro:
      "Cape Town's coastal air and pothole-heavy older roads wear a car differently to an inland city. Knowing what that actually means for your car changes what's worth asking before you drop the keys off.",
    sections: [
      {
        id: 'rmi-accreditation',
        heading: '1. Look for RMI accreditation',
        tocLabel: '1. RMI accreditation',
        paragraphs: [
          'Workshops accredited through the Retail Motor Industry Organisation (RMI) commit to a code of conduct and a dispute-resolution process if something goes wrong. It is not the only marker of a good mechanic, but it is a real, checkable one — ask for the membership rather than assuming from signage.',
        ],
      },
      {
        id: 'salt-corrosion',
        heading: '2. Ask about corrosion, not just the fault',
        tocLabel: '2. Salt-air corrosion',
        paragraphs: [
          "Salt air along the Cape Town coastline accelerates rust on brake lines, exhausts and underbody components faster than an inland city sees. If a car has spent years near the coast, ask the mechanic to actually check the undercarriage while it's on the lift, not only the fault you booked in for.",
        ],
      },
      {
        id: 'quote-before-work',
        heading: '3. Get a written estimate before any work starts',
        tocLabel: '3. Written estimate first',
        paragraphs: [
          'A reputable workshop diagnoses first and quotes before doing further work, especially anything beyond the original complaint. "We found more while we were in there" without a call first is how a R1,500 job becomes a R6,000 one — agree upfront that they call before exceeding the quote.',
        ],
      },
      {
        id: 'parts-disclosure',
        heading: '4. Ask whether parts are OEM or aftermarket',
        tocLabel: '4. OEM vs aftermarket parts',
        paragraphs: [
          "Aftermarket parts are often a reasonable, cheaper choice, but you should be told which is being fitted and given the option, particularly for brakes and suspension. Get this on the invoice, not just agreed verbally.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-security-company',
    categoryLabel: 'Home & Trade',
    categorySlug: 'security-services',
    breadcrumbLabel: 'Security Services',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a security company in Cape Town',
    blurb: 'PSIRA registration and the response-time question that matters more than the brochure.',
    intro:
      "An armed-response contract is only as good as the response time to your specific street, not the average across the company's coverage map. That's the question worth asking before you sign, not after.",
    sections: [
      {
        id: 'psira',
        heading: '1. Confirm PSIRA registration',
        tocLabel: '1. PSIRA registration',
        paragraphs: [
          'Every security service provider in South Africa — armed response, alarm installation and monitoring included — must be registered with the Private Security Industry Regulatory Authority. Ask for the PSIRA registration number and, for the individuals who will actually respond, their own registration too.',
        ],
      },
      {
        id: 'response-time',
        heading: '2. Ask for the response time to your exact address',
        tocLabel: '2. Response time to your address',
        paragraphs: [
          "Response-time promises are usually quoted as an average or a best case for the nearest base. Coverage and drive time vary a lot across Cape Town's suburbs — ask what the realistic response time is to your specific street, not the marketing figure.",
        ],
      },
      {
        id: 'contract-terms',
        heading: '3. Read the contract term and cancellation clause',
        tocLabel: '3. Contract term',
        paragraphs: [
          'Many armed-response contracts lock you in for 12 to 24 months with penalties for early cancellation. Confirm the term, the monthly fee escalation clause, and what happens if you move house or sell the property before it ends.',
        ],
      },
      {
        id: 'installation-vs-monitoring',
        heading: '4. Separate the installation cost from the monthly fee',
        tocLabel: '4. Installation vs monitoring fees',
        paragraphs: [
          'Get the once-off installation/equipment cost and the ongoing monthly monitoring fee quoted as two clear line items, plus what a battery replacement or a false-alarm call-out costs later. A low "from" monthly price sometimes hides a high equipment cost, or the reverse.',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-locksmith',
    categoryLabel: 'Home & Trade',
    categorySlug: 'locksmiths',
    breadcrumbLabel: 'Locksmiths',
    readTime: '5 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a locksmith in Cape Town',
    blurb: 'Locked out at midnight is exactly when call-out overpricing happens — the two questions that stop it.',
    intro:
      "The classic locksmith scam is a low quoted call-out fee that becomes a much larger cash-only bill once someone is standing outside your own front door. Two questions, asked on the phone before anyone drives out, close that gap.",
    sections: [
      {
        id: 'quote-on-the-phone',
        heading: '1. Get the full price on the phone, not on arrival',
        tocLabel: '1. Price on the phone',
        paragraphs: [
          'Ask for the call-out fee and the likely total for your specific lock type before anyone leaves for your address, and get it confirmed again before any work starts once they arrive. A locksmith who refuses to give any figure over the phone, or who quotes a low call-out and a high "on-site assessment," is the pattern behind most complaints.',
        ],
      },
      {
        id: 'body-corporate',
        heading: '2. Check if your building needs body-corporate sign-off first',
        tocLabel: '2. Body-corporate sign-off',
        paragraphs: [
          "In sectional-title buildings, common across Cape Town's apartment stock, changing an external door lock sometimes needs body-corporate or managing-agent approval first, especially where the door is part of a shared security system. Check before you book, not after the lock is changed.",
        ],
      },
      {
        id: 'proof-of-ownership',
        heading: '3. Expect to be asked for proof you live there',
        tocLabel: '3. Proof of ownership',
        paragraphs: [
          "A reputable locksmith will ask for ID and some proof of address or ownership before opening a door for someone they don't know — that's a sign of a legitimate operator, not an inconvenience.",
        ],
      },
      {
        id: 'get-a-receipt',
        heading: '4. Get an itemised receipt, even for a cash job',
        tocLabel: '4. Get a receipt',
        paragraphs: [
          'Ask for a proper invoice listing the call-out, labour and any parts (new lock, cylinder, key cutting) separately. It is your evidence if the price disputes later, and most legitimate operators provide one without being asked twice.',
        ],
      },
    ],
  },
];

const pretoria: Guide[] = [
  {
    slug: 'how-to-choose-a-plumber',
    categoryLabel: 'Home & Trade',
    categorySlug: 'plumbers',
    breadcrumbLabel: 'Plumbers',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a plumber in Pretoria',
    blurb: 'PIRB registration, itemised quotes, insurance claims and warranties — the checks worth doing before you phone anyone.',
    intro:
      'A burst geyser at 21:00 is the worst time to start comparing quotes. These are the checks worth doing now, while nothing is leaking — and the questions that separate a registered plumber from a man with a bakkie.',
    sections: [
      {
        id: 'pirb-registration',
        heading: '1. Check the PIRB registration',
        tocLabel: '1. Check the PIRB registration',
        paragraphs: [
          'Any plumber working on a geyser or issuing a Certificate of Compliance must be registered with the Plumbing Industry Registration Board. Ask for the registration number and check it before work starts — an unregistered CoC will not satisfy your insurer.',
        ],
      },
      {
        id: 'written-quote',
        heading: '2. Get the quote in writing, itemised',
        tocLabel: '2. Get the quote in writing',
        paragraphs: [
          'A quote should separate call-out, labour rate, parts and VAT. Vague single-figure quotes are where disputes start. For geyser replacement, confirm whether the drip tray, vacuum breakers and overflow pipe are included — they usually are not.',
        ],
      },
      {
        id: 'insurance',
        heading: '3. Confirm who claims from insurance',
        tocLabel: '3. Confirm who claims',
        paragraphs: [
          'Most household policies cover geyser failure but require you to use an approved supplier. Phone your insurer before authorising work — paying cash and claiming later is usually refused.',
        ],
      },
      {
        id: 'warranty',
        heading: '4. Ask what happens if it fails again',
        tocLabel: '4. Ask about the warranty',
        paragraphs: [
          "A reasonable workmanship warranty is six months on labour, with the manufacturer's warranty on the unit itself. Get both in writing on the invoice, not verbally on the day.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-an-electrician',
    categoryLabel: 'Home & Trade',
    categorySlug: 'electricians',
    breadcrumbLabel: 'Electricians',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose an electrician in Pretoria',
    blurb: "Wireman's licence, the Certificate of Compliance, and why backup-power wiring needs a registered electrician, not a handyman.",
    intro:
      "Between older Pretoria suburbs with ageing distribution boards and how many households have added inverters or solar since load-shedding became routine, this is a city where the wiring behind the wall matters more than usual.",
    sections: [
      {
        id: 'licence-and-coc',
        heading: "1. Ask for the Wireman's Licence, not just a business card",
        tocLabel: "1. Wireman's Licence",
        paragraphs: [
          "Only an electrician with a valid Wireman's Licence can legally issue a Certificate of Compliance (CoC). You need a CoC to sell a property, and insurers can decline a fire or shock claim if the last work done wasn't compliant. Ask to see the licence, not just take a verbal assurance.",
        ],
      },
      {
        id: 'backup-power',
        heading: '2. A backup-power installation needs a registered electrician',
        tocLabel: '2. Inverter and solar wiring',
        paragraphs: [
          "Wiring an inverter, solar system or automatic changeover switch into your home's circuit is exactly the kind of job that needs a properly registered electrician and its own Certificate of Compliance — a poorly wired changeover switch is a genuine fire and backfeed risk. Get this from someone qualified for it, not a general handyman who \"does inverters too.\"",
        ],
      },
      {
        id: 'older-boards',
        heading: '3. Budget for what an older board might reveal',
        tocLabel: '3. Older distribution boards',
        paragraphs: [
          "Established Pretoria suburbs like Waterkloof, Brooklyn and Sunnyside often have distribution boards decades old. A callout for one faulty circuit sometimes surfaces a board that needs upgrading before a CoC can honestly be issued — ask upfront what happens if that's the case, rather than being surprised once the panel is open.",
        ],
      },
      {
        id: 'quote-and-warranty',
        heading: '4. Get a written quote and a workmanship warranty',
        tocLabel: '4. Quote and warranty',
        paragraphs: [
          'A proper quote separates call-out, labour and parts, and states whether the CoC itself is included in the price. Ask for a workmanship warranty in writing, not a verbal "call me if it plays up."',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-builder',
    categoryLabel: 'Home & Trade',
    categorySlug: 'building-construction',
    breadcrumbLabel: 'Building & Construction',
    readTime: '7 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a builder or renovator in Pretoria',
    blurb: 'NHBRC enrolment, body-corporate approval for complex living, and why sectional-title renovations need two sign-offs, not one.',
    intro:
      'A large share of Pretoria renovation work happens inside sectional-title complexes and estates, which means council approval is only half the process. Knowing that upfront changes how you read a quote and a timeline.',
    sections: [
      {
        id: 'nhbrc',
        heading: '1. Confirm NHBRC enrolment for new-build work',
        tocLabel: '1. NHBRC enrolment',
        paragraphs: [
          'Any new dwelling built in South Africa legally has to be enrolled with the National Home Builders Registration Council before work starts, which also covers structural defects for years afterwards. A major renovation or extension is a greyer area — ask directly whether the builder enrols this specific job, and get the enrolment number.',
        ],
      },
      {
        id: 'body-corporate',
        heading: '2. Get body-corporate approval before council plans, not after',
        tocLabel: '2. Body-corporate approval',
        paragraphs: [
          "If you live in a sectional-title complex or estate — common across Pretoria — most renovation work visible from outside your own unit needs body-corporate or managing-agent sign-off, separate from and usually before the City of Tshwane's own plan approval. A builder who only mentions the municipal process is leaving out a real step that can stall the start date.",
        ],
      },
      {
        id: 'staged-payments',
        heading: '3. Pay in stages, tied to completed work',
        tocLabel: '3. Staged payments',
        paragraphs: [
          'A deposit to secure the date is normal; a request for most of the contract value before work starts is not. Agree payment milestones tied to visible progress (foundations, roof, plaster, snag-free handover) in the written contract.',
        ],
      },
      {
        id: 'load-shedding-schedule',
        heading: '4. Ask how load-shedding affects the build schedule',
        tocLabel: '4. Load-shedding and the schedule',
        paragraphs: [
          "Power tools, plaster mixers and some deliveries slow down during outages. A realistic builder factors this into the timeline quoted upfront rather than treating every outage as an unplanned excuse for delay later.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-mechanic',
    categoryLabel: 'Motoring',
    categorySlug: 'automotive-repairs',
    breadcrumbLabel: 'Automotive & Repairs',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a mechanic in Pretoria',
    blurb: 'RMI accreditation, load-shedding-proof booking, and the heat-and-highway wear pattern worth asking about.',
    intro:
      "Long highway commutes on the N1 and N4, Gauteng heat, and load-shedding affecting workshop diagnostic time all shape what's worth asking a Pretoria workshop before you book in.",
    sections: [
      {
        id: 'rmi-accreditation',
        heading: '1. Look for RMI accreditation',
        tocLabel: '1. RMI accreditation',
        paragraphs: [
          'Workshops accredited through the Retail Motor Industry Organisation (RMI) commit to a code of conduct and a dispute-resolution process if something goes wrong. It is not the only marker of a good mechanic, but it is a real, checkable one — ask for the membership rather than assuming from signage.',
        ],
      },
      {
        id: 'load-shedding-booking',
        heading: '2. Ask how load-shedding affects diagnostic booking',
        tocLabel: '2. Load-shedding and diagnostics',
        paragraphs: [
          "Modern diagnostic equipment needs power, and a workshop mid-outage may not be able to run your booked diagnosis on time. Ask whether they have backup power or simply build outage schedules into your booking slot — either is fine, but you want to know before you arrive and wait.",
        ],
      },
      {
        id: 'highway-wear',
        heading: '3. Mention your commute pattern, not just the fault',
        tocLabel: '3. Highway wear and tear',
        paragraphs: [
          "Long daily stretches on the N1 or N4 wear tyres, cooling systems and suspension bushes differently to mostly short city trips. Telling the mechanic your actual commute helps them check the parts that actually take the strain, not just the symptom you booked in for.",
        ],
      },
      {
        id: 'quote-before-work',
        heading: '4. Get a written estimate before any further work starts',
        tocLabel: '4. Written estimate first',
        paragraphs: [
          'A reputable workshop diagnoses first and quotes before doing further work, especially anything beyond the original complaint. Agree upfront that they call before exceeding the quote, rather than presenting a bigger bill at collection.',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-security-company',
    categoryLabel: 'Home & Trade',
    categorySlug: 'security-services',
    breadcrumbLabel: 'Security Services',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a security company in Pretoria',
    blurb: 'PSIRA registration and the backup-power question that matters as much as the response time.',
    intro:
      'A Pretoria alarm system is only as reliable as its behaviour during an outage. That, alongside the usual response-time question, is what to ask before signing.',
    sections: [
      {
        id: 'psira',
        heading: '1. Confirm PSIRA registration',
        tocLabel: '1. PSIRA registration',
        paragraphs: [
          'Every security service provider in South Africa — armed response, alarm installation and monitoring included — must be registered with the Private Security Industry Regulatory Authority. Ask for the PSIRA registration number and, for the individuals who will actually respond, their own registration too.',
        ],
      },
      {
        id: 'backup-battery',
        heading: '2. Ask what happens to the alarm during an outage',
        tocLabel: '2. Backup battery life',
        paragraphs: [
          'A gate motor, electric fence and alarm panel all draw on backup batteries during load-shedding. Ask how many hours of backup the system actually has once installed, and what the monitoring centre sees (or doesn\'t) if your router also loses power — a system that "just has a battery" without a clear answer here is worth pushing on.',
        ],
      },
      {
        id: 'response-time',
        heading: '3. Ask for the response time to your exact address',
        tocLabel: '3. Response time to your address',
        paragraphs: [
          "Response-time promises are usually quoted as an average or a best case for the nearest base. Coverage and drive time vary across Pretoria's suburbs and outlying areas — ask what the realistic response time is to your specific street, not the marketing figure.",
        ],
      },
      {
        id: 'contract-terms',
        heading: '4. Read the contract term and cancellation clause',
        tocLabel: '4. Contract term',
        paragraphs: [
          'Many armed-response contracts lock you in for 12 to 24 months with penalties for early cancellation. Confirm the term, the monthly fee escalation clause, and what happens if you move house before it ends.',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-locksmith',
    categoryLabel: 'Home & Trade',
    categorySlug: 'locksmiths',
    breadcrumbLabel: 'Locksmiths',
    readTime: '5 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a locksmith in Pretoria',
    blurb: 'Locked out at midnight is exactly when call-out overpricing happens — the two questions that stop it.',
    intro:
      'The classic locksmith scam is a low quoted call-out fee that becomes a much larger cash-only bill once someone is standing outside your own front door. Two questions, asked on the phone before anyone drives out, close that gap.',
    sections: [
      {
        id: 'quote-on-the-phone',
        heading: '1. Get the full price on the phone, not on arrival',
        tocLabel: '1. Price on the phone',
        paragraphs: [
          'Ask for the call-out fee and the likely total for your specific lock type before anyone leaves for your address, and get it confirmed again before any work starts once they arrive. A locksmith who refuses to give any figure over the phone, or who quotes a low call-out and a high "on-site assessment," is the pattern behind most complaints.',
        ],
      },
      {
        id: 'gate-and-access-control',
        heading: '2. Check whether it is actually a gate-motor or access-control job',
        tocLabel: '2. Gate motors and access control',
        paragraphs: [
          "In Pretoria's many gated complexes and estates, a large share of \"lockout\" calls turn out to be a gate motor, remote or access-control keypad, not a physical door lock. Say what you're actually locked out of on the phone — it changes who you should call and how the job is priced.",
        ],
      },
      {
        id: 'proof-of-ownership',
        heading: '3. Expect to be asked for proof you live there',
        tocLabel: '3. Proof of ownership',
        paragraphs: [
          "A reputable locksmith will ask for ID and some proof of address or ownership before opening a door for someone they don't know — that's a sign of a legitimate operator, not an inconvenience.",
        ],
      },
      {
        id: 'get-a-receipt',
        heading: '4. Get an itemised receipt, even for a cash job',
        tocLabel: '4. Get a receipt',
        paragraphs: [
          'Ask for a proper invoice listing the call-out, labour and any parts (new lock, cylinder, key cutting) separately. It is your evidence if the price is disputed later, and most legitimate operators provide one without being asked twice.',
        ],
      },
    ],
  },
];

const polokwane: Guide[] = [
  {
    slug: 'how-to-choose-a-plumber',
    categoryLabel: 'Home & Trade',
    categorySlug: 'plumbers',
    breadcrumbLabel: 'Plumbers',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a plumber in Polokwane',
    blurb: 'PIRB registration, itemised quotes, insurance claims and warranties — the checks worth doing before you phone anyone.',
    intro:
      'A burst geyser at 21:00 is the worst time to start comparing quotes. These are the checks worth doing now, while nothing is leaking — and the questions that separate a registered plumber from a man with a bakkie.',
    sections: [
      {
        id: 'pirb-registration',
        heading: '1. Check the PIRB registration',
        tocLabel: '1. Check the PIRB registration',
        paragraphs: [
          'Any plumber working on a geyser or issuing a Certificate of Compliance must be registered with the Plumbing Industry Registration Board. Ask for the registration number and check it before work starts — an unregistered CoC will not satisfy your insurer.',
        ],
      },
      {
        id: 'written-quote',
        heading: '2. Get the quote in writing, itemised',
        tocLabel: '2. Get the quote in writing',
        paragraphs: [
          'A quote should separate call-out, labour rate, parts and VAT. Vague single-figure quotes are where disputes start. For geyser replacement, confirm whether the drip tray, vacuum breakers and overflow pipe are included — they usually are not.',
        ],
      },
      {
        id: 'insurance',
        heading: '3. Confirm who claims from insurance',
        tocLabel: '3. Confirm who claims',
        paragraphs: [
          'Most household policies cover geyser failure but require you to use an approved supplier. Phone your insurer before authorising work — paying cash and claiming later is usually refused.',
        ],
      },
      {
        id: 'fewer-registered-options',
        heading: '4. Book ahead — the registered pool is smaller here',
        tocLabel: '4. Book ahead',
        paragraphs: [
          "Polokwane has fewer PIRB-registered plumbers than the big metros, and some cover a wide area including surrounding smallholdings. A reputable one is often booked out days ahead for non-emergency work, so get on the list early rather than defaulting to whoever answers first when something has already burst.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-an-electrician',
    categoryLabel: 'Home & Trade',
    categorySlug: 'electricians',
    breadcrumbLabel: 'Electricians',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose an electrician in Polokwane',
    blurb: "Wireman's licence, the Certificate of Compliance, and what to check on smallholdings and older DIY wiring outside town.",
    intro:
      "Polokwane has fewer registered electricians to choose from than a major metro, and a fair number of properties on its edges are smallholdings with older or owner-done wiring. Both change what's worth asking before someone opens a distribution board.",
    sections: [
      {
        id: 'licence-and-coc',
        heading: "1. Ask for the Wireman's Licence, not just a business card",
        tocLabel: "1. Wireman's Licence",
        paragraphs: [
          "Only an electrician with a valid Wireman's Licence can legally issue a Certificate of Compliance (CoC). You need a CoC to sell a property, and insurers can decline a fire or shock claim if the last work done wasn't compliant. Ask to see the licence, not just take a verbal assurance.",
        ],
      },
      {
        id: 'smallholding-wiring',
        heading: '2. Flag if the property has older or owner-done wiring',
        tocLabel: '2. Smallholding and older wiring',
        paragraphs: [
          "On properties on the edge of town or on smallholdings, it's not unusual for some wiring to have been added over the years by different people, not always to code. Mention this upfront so the electrician arrives ready to actually trace and check it, rather than assuming a standard town-house layout.",
        ],
      },
      {
        id: 'book-ahead',
        heading: '3. Confirm availability and travel distance upfront',
        tocLabel: '3. Availability and travel',
        paragraphs: [
          'With fewer registered electricians covering a wider area, a call-out fee sometimes includes real travel distance, not just admin. Ask what the call-out actually covers and how far out they will travel before you book, especially for a property outside the CBD.',
        ],
      },
      {
        id: 'quote-and-warranty',
        heading: '4. Get a written quote and a workmanship warranty',
        tocLabel: '4. Quote and warranty',
        paragraphs: [
          'A proper quote separates call-out, travel, labour and parts, and states whether the CoC itself is included in the price. Ask for a workmanship warranty in writing, not a verbal "call me if it plays up."',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-builder',
    categoryLabel: 'Home & Trade',
    categorySlug: 'building-construction',
    breadcrumbLabel: 'Building & Construction',
    readTime: '7 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a builder or renovator in Polokwane',
    blurb: 'NHBRC enrolment, why local references matter more than an online portfolio here, and getting the municipal approval timeline in writing.',
    intro:
      "Polokwane's building trade has fewer NHBRC-registered builders actively working locally than a major metro, so verifying who you're hiring matters even more than the quote itself.",
    sections: [
      {
        id: 'nhbrc',
        heading: '1. Confirm NHBRC enrolment for new-build work',
        tocLabel: '1. NHBRC enrolment',
        paragraphs: [
          'Any new dwelling built in South Africa legally has to be enrolled with the National Home Builders Registration Council before work starts, which also covers structural defects for years afterwards. A major renovation or extension is a greyer area — ask directly whether the builder enrols this specific job, and get the enrolment number.',
        ],
      },
      {
        id: 'local-references',
        heading: '2. Ask for local references you can actually visit',
        tocLabel: '2. Local references',
        paragraphs: [
          "With a smaller pool of active, registered builders in Polokwane, word of mouth and a finished job you can drive past and look at are worth more here than an online portfolio of projects elsewhere. Ask for two or three recent local jobs and actually follow up.",
        ],
      },
      {
        id: 'municipal-approval',
        heading: '3. Get the plan-approval timeline in writing',
        tocLabel: '3. Municipal plan approval',
        paragraphs: [
          "Council plan approval through the Polokwane municipality is a separate step from the build itself and has its own timeline. Ask the builder to state, in writing, roughly how long approval is expected to take and when they plan to actually submit — a start date quoted before plans are submitted is optimistic at best.",
        ],
      },
      {
        id: 'staged-payments',
        heading: '4. Pay in stages, tied to completed work',
        tocLabel: '4. Staged payments',
        paragraphs: [
          'A deposit to secure the date is normal; a request for most of the contract value before work starts is not. Agree payment milestones tied to visible progress (foundations, roof, plaster, snag-free handover) in the written contract.',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-mechanic',
    categoryLabel: 'Motoring',
    categorySlug: 'automotive-repairs',
    breadcrumbLabel: 'Automotive & Repairs',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a mechanic in Polokwane',
    blurb: 'RMI accreditation and the long-distance wear pattern worth mentioning before your next N1 trip.',
    intro:
      "Polokwane sits on a long-distance travel route — the N1 towards the Zimbabwe and Botswana borders, plus a lot of farm and gravel-adjacent roads — which wears a car differently to mostly-city driving.",
    sections: [
      {
        id: 'rmi-accreditation',
        heading: '1. Look for RMI accreditation',
        tocLabel: '1. RMI accreditation',
        paragraphs: [
          'Workshops accredited through the Retail Motor Industry Organisation (RMI) commit to a code of conduct and a dispute-resolution process if something goes wrong. It is not the only marker of a good mechanic, but it is a real, checkable one, and worth asking for directly given fewer accredited workshops operate in and around Polokwane than in the major metros.',
        ],
      },
      {
        id: 'long-distance-wear',
        heading: '2. Mention your actual driving, not just the fault',
        tocLabel: '2. Long-distance and gravel-road wear',
        paragraphs: [
          "Regular long-distance highway trips and gravel or farm-road driving wear tyres, suspension components and cooling systems differently to short city trips. Tell the mechanic your actual driving pattern so they check the parts that take the real strain, especially before a long trip.",
        ],
      },
      {
        id: 'quote-before-work',
        heading: '3. Get a written estimate before any further work starts',
        tocLabel: '3. Written estimate first',
        paragraphs: [
          'A reputable workshop diagnoses first and quotes before doing further work, especially anything beyond the original complaint. Agree upfront that they call before exceeding the quote, rather than presenting a bigger bill at collection.',
        ],
      },
      {
        id: 'parts-availability',
        heading: '4. Ask about parts availability and turnaround',
        tocLabel: '4. Parts availability',
        paragraphs: [
          "Some parts take longer to source outside the major metros. Ask upfront how long the specific part is expected to take to arrive, so a two-day job doesn't quietly become a two-week one without warning.",
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-security-company',
    categoryLabel: 'Home & Trade',
    categorySlug: 'security-services',
    breadcrumbLabel: 'Security Services',
    readTime: '6 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a security company in Polokwane',
    blurb: 'PSIRA registration and the response-time question that matters most on the edge of town.',
    intro:
      "Armed-response coverage in and around Polokwane can thin out on the edges of town and on surrounding smallholdings. That is the question worth asking before you sign, more than the brochure.",
    sections: [
      {
        id: 'psira',
        heading: '1. Confirm PSIRA registration',
        tocLabel: '1. PSIRA registration',
        paragraphs: [
          'Every security service provider in South Africa — armed response, alarm installation and monitoring included — must be registered with the Private Security Industry Regulatory Authority. Ask for the PSIRA registration number and, for the individuals who will actually respond, their own registration too.',
        ],
      },
      {
        id: 'response-time-edge-of-town',
        heading: '2. Ask for the response time to your exact address',
        tocLabel: '2. Response time to your address',
        paragraphs: [
          "Response-time promises are usually quoted as an average or a best case for the nearest base. Coverage can thin out noticeably towards the edge of Polokwane and on surrounding smallholdings — ask what the realistic response time is to your specific address, not the marketing figure for the CBD.",
        ],
      },
      {
        id: 'fencing-and-perimeter',
        heading: '3. Ask what perimeter cover suits a larger property',
        tocLabel: '3. Perimeter cover for larger properties',
        paragraphs: [
          "Smallholdings and larger erven around Polokwane often need electric fencing or beam cover along a much longer perimeter than a standard town plot. Confirm the quote is actually priced for your property's perimeter length, not a generic suburban package.",
        ],
      },
      {
        id: 'contract-terms',
        heading: '4. Read the contract term and cancellation clause',
        tocLabel: '4. Contract term',
        paragraphs: [
          'Many armed-response contracts lock you in for 12 to 24 months with penalties for early cancellation. Confirm the term, the monthly fee escalation clause, and what happens if you move house before it ends.',
        ],
      },
    ],
  },
  {
    slug: 'how-to-choose-a-locksmith',
    categoryLabel: 'Home & Trade',
    categorySlug: 'locksmiths',
    breadcrumbLabel: 'Locksmiths',
    readTime: '5 min',
    updatedLabel: UPDATED_LABEL,
    updatedIso: UPDATED_ISO,
    title: 'How to choose a locksmith in Polokwane',
    blurb: 'A genuine after-hours call-out here can mean real travel time — the two questions that tell that apart from overpricing.',
    intro:
      "With fewer 24-hour locksmiths operating outside the CBD, a real after-hours emergency in Polokwane can involve genuine travel time and a fair higher fee. That is a different thing from the classic call-out scam — these questions tell the two apart.",
    sections: [
      {
        id: 'quote-on-the-phone',
        heading: '1. Get the full price on the phone, not on arrival',
        tocLabel: '1. Price on the phone',
        paragraphs: [
          'Ask for the call-out fee, whether it includes travel from where they are based, and the likely total for your specific lock type, before anyone leaves for your address. A locksmith who refuses to give any figure over the phone, or who quotes a low call-out and a high "on-site assessment," is the pattern behind most complaints — a genuine travel surcharge for a late-night, out-of-town call-out is not the same thing, as long as it's quoted upfront.',
        ],
      },
      {
        id: 'confirm-availability',
        heading: '2. Confirm they actually cover your area after hours',
        tocLabel: '2. After-hours coverage',
        paragraphs: [
          'Not every locksmith listed as "24-hour" covers areas outside the Polokwane CBD after dark. Confirm your specific address is covered before you wait for someone who was never coming.',
        ],
      },
      {
        id: 'proof-of-ownership',
        heading: '3. Expect to be asked for proof you live there',
        tocLabel: '3. Proof of ownership',
        paragraphs: [
          "A reputable locksmith will ask for ID and some proof of address or ownership before opening a door for someone they don't know — that's a sign of a legitimate operator, not an inconvenience.",
        ],
      },
      {
        id: 'get-a-receipt',
        heading: '4. Get an itemised receipt, even for a cash job',
        tocLabel: '4. Get a receipt',
        paragraphs: [
          'Ask for a proper invoice listing the call-out, any travel charge, labour and parts (new lock, cylinder, key cutting) separately. It is your evidence if the price is disputed later, and most legitimate operators provide one without being asked twice.',
        ],
      },
    ],
  },
];

export const GUIDES: Record<string, Guide[]> = { capetown, pretoria, polokwane };

export const guidesFor = (siteSlug: string): Guide[] => GUIDES[siteSlug] ?? [];

export const guideBySlug = (siteSlug: string, slug: string): Guide | undefined =>
  guidesFor(siteSlug).find((g) => g.slug === slug);
