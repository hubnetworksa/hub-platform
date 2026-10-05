# Pretoria chunk 115 — needs research (5 of 50)

45 of this chunk's 50 listings were researched and published automatically. These 5 couldn't be verified. Fill in whatever you find under a business's "Your research" section — see `research-needed/README.md` for the format and workflow.

---

## 1. Cartridge Hyper Magalieskruin
Magalieskruin Shopping Centre, 390 Braam Pretorius St, Magalieskruin
Current: "South African retail chain, established in 2003, specializing in original and generic inkjet and laser printer cartridges... this store is located at Magalieskruin Shopping Centre."
Reason: only chain-level facts available (established 2003, generic/compatible cartridges for major brands); the store's own page returned only a cookie-consent banner, no branch-specific detail (hours, staff, in-store services).

Your research:

What it does / sells / specialises in:
Original-brand and compatible inkjet and laser printer cartridges, toner, drum units and printheads for major manufacturers (HP, including Officejet, Photosmart and DesignJet lines, plus LaserJet toner) and other printer consumables.

Who it serves:
Households, offices and businesses needing printer cartridges, toner and printing consumables, via in-store shopping, collection or delivery.

Anything notable:
Confirmed branch address and contact: Magalieskruin Shopping Centre, 390 Braam Pretorius Street, tel 012 567 3084. Confirmed hours: weekdays 08:00-17:30, Saturday 09:00-14:00 (added to the listing's `hours` field, which was previously empty). Independently classified as a toner-cartridge supplier.

Recommendation: PUBLISH

Status: applied — description written and `node scripts/content-upgrade/to-sql.mjs pretoria 115` passed.


## 2. MSC Business College - Pretoria
Unit 201, 1059 Francis Baard St, Hatfield
Current: "part of a group founded in 1991 in East London... 18 campuses nationwide, and its Pretoria campus offers accredited diplomas and certificates in small classes."
Reason: only group-level facts confirmed (founded 1991, East London, 18 campuses); directories found gave an address (Shop 3, Bothongo Plaza East, Pretoria Central) that doesn't match this listing's Hatfield/Francis Baard Street address, so nothing campus-specific could be confirmed.

Your research:

What it does / sells / specialises in:
Further education and training programmes in Human Resources Management, Marketing Management, Information Technology, Business & Office Administration, Financial Accounting & Bookkeeping and Project Management, delivered as certificates, diplomas, skills programmes, learnerships, recognition of prior learning and short learning programmes.

Who it serves:
Students and working individuals seeking vocational, business and career-focused qualifications and skills training, and corporate organisations needing staff training initiatives.

Anything notable:
Confirmed campus address: Unit 201, 1059 Francis Baard Street, Hatfield, Pretoria 0002, tel 012 322 2800 (this resolves the earlier address mismatch — the Hatfield site is this campus's current location). Founded 1991; registered with the Department of Higher Education and Training as a private FET college (registration 2008/FE07/112), with programmes quality-assured by SETAs and professional bodies. No individuals named.

Recommendation: PUBLISH

Status: applied — description written and `node scripts/content-upgrade/to-sql.mjs pretoria 115` passed.


## 3. RCL Foods- Sugar & Milling Division
6 President Burger St, Pretoria West
Current: "houses the administrative offices of RCL Foods' Sugar & Milling division... RCL Foods operates sugar mills, refineries and animal feed factories, though its actual sugar milling operations are based in Mpumalanga and KwaZulu-Natal."
Reason: website returned only group-wide scam warnings and other regional depot addresses (Westville, Hammersdale); nothing about this specific office's own staff, function or history.

Your research:

What it does / sells / specialises in:
Associated with RCL Foods' milling and food-manufacturing operations; produces/mills flour, with Supreme Flour being one of the group's established flour brands. The facility includes milling areas, cleaning facilities and processing equipment.

Who it serves:
Food manufacturers, commercial customers and the broader food market supplied through RCL Foods' flour and food-product operations.

Anything notable:
Supreme Flour production at this President Burger Street site dates back to 1948, and it became one of the largest single-site flour mills in South Africa. Confirmed address: 6 President Burger Street, Pretoria West, Pretoria 0001, classified as a manufacturer, flour mill and food-products supplier.

Recommendation: PUBLISH

Status: applied — description written and `node scripts/content-upgrade/to-sql.mjs pretoria 115` passed.


## 4. Astron Energy Waterkloof Glen
374 Roslyn Ave, Waterkloof Glen
Current: "fuel station on Roslyn Avenue... part of the Astron Energy network -- the brand that has been rebranding South Africa's former Caltex service stations since 2021."
Reason: only the national Astron Energy brand homepage was found (the Caltex-to-Astron rebrand story, UCount Rewards, FleetCard); nothing about this station's own forecourt brands, convenience offering or staff.

Your research:

What it does / sells / specialises in:
A fuel station supplying petrol and diesel under the Astron Energy brand; also classified as a petroleum-products supplier, diesel-fuel supplier and oil-change service.

Who it serves:
Motorists, commuters and residents in Waterkloof Glen and surrounding eastern Pretoria suburbs.

Anything notable:
Confirmed address: 374 Roslyn Avenue, Waterkloof Glen, Pretoria 0181, tel 012 993 5739, operating 24 hours a day, seven days a week. Independent fuel-station listings corroborate the same address and identify it as "Astron Energy Waterkloof Glen Motors."

Recommendation: PUBLISH

Status: applied — description written and `node scripts/content-upgrade/to-sql.mjs pretoria 115` passed.


## 5. Chromex Mining Company (Pty) Ltd
267 West Ave, Die Hoewes, Centurion
Current: "registered business based in Die Hoewes, Centurion, listed in industrial supplier and manufacturing directories; no further public details on its operations were found."
Reason: no usable information found anywhere; search results were unrelated university login pages, and the listing only appears in supplier directories with no description of its own operations.

Your research:

What it does / sells / specialises in:
A chrome-ore mining company associated with the Mecklenburg Chrome Mine (Limpopo) and the Stellite Chrome Mine (North West), producing metallurgical chrome ore including lumpy ore, fines and concentrates (per government mining records and more recent operating-mine data).

Who it serves:
The chrome-mining and metallurgical raw-material sector, supplying chrome ore for industrial/metallurgical applications.

Anything notable:
267 West Avenue, Die Hoewes, Centurion 0157 is the local business listing/office location only, not confirmed as the company's head office or registered address — older government records show a Centurion postal address while a separate current commercial company profile shows a Saxonwold address.

Recommendation: PUBLISH (per orchestrating-session judgment) — BUT NOT APPLIED THIS ROUND: this chunk's batch file (`content-upgrade/pretoria/chunk-115.json`) and research file (`content-upgrade/research/pretoria/chunk-115.json`) carry no `website`, no `existing_sources`, and no usable `pages`/`search` URL for this listing at all (the research file's only search hits are unrelated University of Limpopo login pages). The pipeline's source-citing rule requires every cited source to already be one of those URLs, and the process rule for this task forbids fetching a new one. None of the facts above have anywhere to be cited from, so this item is left `deferred` in `content-upgrade/out/pretoria/chunk-115.json` with that explanation. If you can supply a specific URL (ideally the company's own site, a CIPC/mining-register page, or a directory listing) that documents these Mecklenburg/Stellite facts and the 267 West Avenue listing, it can be published in a follow-up pass citing that source.

Status: still deferred — see note above.

