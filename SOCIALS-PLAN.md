# Socials plan: Facebook and Instagram for all three sites

Status as of 3 October 2026. Scope: PretoriaHub, PolokwaneHub and TheCapeTownHub. **[You]** = needs your Meta login or a decision. **[Me]** = I build it.

The aim: each site has a Facebook Page and an Instagram account that post every day without anyone writing posts by hand. Every post is built from data the sites already have (new businesses, events, news, fuel prices, guides) and links back to the site, which also brings visitors and gets pages found by Google faster.

## 1. Set up the accounts [You]

Meta only lets a real person create Pages, so this part is yours. It takes about 30 minutes for all three.

1. **Create a Meta Business portfolio** at business.facebook.com, named for the company that owns the three sites (for example "Hub Network SA"), with `hello@<domain>` as the contact email. All three Pages and Instagram accounts go in it, so one login manages all of them and other people can be added later without sharing passwords.
2. **Create one Facebook Page per site** (Business portfolio → Pages → Create a new Page). Use the name, category and text from section 2.
3. **Upload the images** from `social/<city>/`: `profile.png` as the profile picture, `facebook-cover.jpg` as the cover.
4. **Create one Instagram account per site** in the Instagram app, then switch it to a **Business** account (Settings → Account type and tools → Switch to professional account → Business). Use `profile.png` as the picture and the bio from section 2.
5. **Link each Instagram account to its Facebook Page** (Page settings → Linked accounts → Instagram). Automatic posting to Instagram only works through a linked Page.
6. **Turn on two-factor authentication** on your Facebook and Instagram logins. Hacked business Pages are common, and recovering one without 2FA can take weeks.
7. **Post `launch-post.jpg`** as the first post on both networks, with the launch caption from section 2.
8. **Send me the six links** (three Pages, three Instagram profiles). I add them to each site's footer and to the sites' structured data, which tells Google the accounts belong to the site.

## 2. Profile kit (ready to paste)

Images for each city are in `social/<city>/`. To regenerate them (for example after a logo change), run `node scripts/social/make-profile-kit.mjs`.

| File | Use | Size |
|---|---|---|
| `profile.png` | Profile picture on both networks (both crop it to a circle) | 1080 x 1080 |
| `facebook-cover.jpg` | Facebook Page cover | 1640 x 856 |
| `launch-post.jpg` | First post on both networks | 1080 x 1350 |

Handles: try the first one, then the fallbacks in order. Use the same handle on both networks if possible.

### PretoriaHub

- **Page name:** PretoriaHub
- **Handle:** `pretoriahub` (fallbacks: `pretoriahub.co.za`, `pretoria.hub`, `pretoriahubsa`)
- **Facebook category:** Local business directory (or "Website" if that isn't offered)
- **Website:** `https://pretoriahub.com/?utm_source=facebook&utm_medium=social&utm_campaign=profile` (use `utm_source=instagram` on Instagram)
- **Instagram bio (127 characters):** `Pretoria & Tshwane's free local business directory 📍 Shops, services, events and news by suburb. Own a business? List it free 👇`
- **Facebook intro (100 characters):** `Pretoria & Tshwane's free local business directory. Find shops, services, events and news by suburb.`
- **Facebook "About":** `PretoriaHub lists thousands of businesses across Pretoria, Centurion and Tshwane, sorted by suburb and category, with opening hours, contact details and directions. We also post local events, news and the monthly fuel price. Business owners can claim or add their listing for free at pretoriahub.com.`

### PolokwaneHub

- **Page name:** PolokwaneHub
- **Handle:** `polokwanehub` (fallbacks: `polokwanehub.co.za`, `polokwane.hub`, `polokwanehubsa`)
- **Facebook category:** Local business directory
- **Website:** `https://polokwanehub.com/?utm_source=facebook&utm_medium=social&utm_campaign=profile`
- **Instagram bio (131 characters):** `Polokwane's free local business directory 📍 Shops, services, events and news from Bendor to Seshego. Own a business? List it free 👇`
- **Facebook intro (96 characters):** `Polokwane's free local business directory. Find shops, services, events and news in your suburb.`
- **Facebook "About":** `PolokwaneHub lists businesses across Polokwane and surrounding areas, sorted by suburb and category, with opening hours, contact details and directions. We also post local events, news and the monthly fuel price. Business owners can claim or add their listing for free at polokwanehub.com.`

### TheCapeTownHub

- **Page name:** TheCapeTownHub
- **Handle:** `thecapetownhub` (fallbacks: `capetownhub`, `the.capetownhub`, `thecapetownhubsa`)
- **Facebook category:** Local business directory
- **Website:** `https://thecapetownhub.com/?utm_source=facebook&utm_medium=social&utm_campaign=profile`
- **Instagram bio (136 characters):** `Cape Town's free local business directory 📍 Shops, services, events and news from the CBD to the suburbs. Own a business? List it free 👇`
- **Facebook intro (96 characters):** `Cape Town's free local business directory. Find shops, services, events and news in your suburb.`
- **Facebook "About":** `TheCapeTownHub lists businesses across Cape Town, sorted by suburb and category, with opening hours, contact details and directions. We also post local events, news and the monthly fuel price. Business owners can claim or add their listing for free at thecapetownhub.com.`

Note: Cape Town currently uses the same pin logo as Pretoria (blue, Pretoria skyline). A Cape Town version of the logo, with Table Mountain in the pin, would make the profile picture recognisably Cape Town. Polokwane already has its own.

### Launch caption (all three; swap the city and domain)

> 👋 Welcome to PretoriaHub, Pretoria's free local business directory.
>
> Find shops, services and restaurants in your suburb, with opening hours, phone numbers and directions. Plus what's on this weekend, local news and the monthly fuel price.
>
> 🏪 Own a business? Check that your listing is right, or add it for free.
>
> 👉 pretoriahub.com (Instagram: link in bio)
>
> #Pretoria #Centurion #Tshwane #SupportLocal #PretoriaBusiness

## 3. What gets posted

Every post is generated from the sites' own data, so there's always something to say, and every one links to a page on the site. Posting time: 18:00 South African time on weekdays and 09:00 on weekends, the busiest times for local Facebook audiences. The weekly report (section 6) shows which times work best, and the schedule can be adjusted from there.

| Day | Post | Source | Links to |
|---|---|---|---|
| Monday | **New on the Hub:** 3–5 businesses added last week (carousel on Instagram) | Business discovery routine | Each business page |
| Tuesday | **Suburb spotlight:** one suburb, its shopping centres and the categories it has | Suburb and centre pages | `/suburb/<slug>/` |
| Wednesday | **Fuel price** on the first Wednesday of the month; otherwise a **shopping-centre spotlight** with its tenant list | Fuel routine, centres | `/news/…` or `/shopping-center/<slug>/` |
| Thursday | **What's on this weekend:** 3–5 events | Events routine | `/events/` and each event |
| Friday | **Category spotlight:** for example "Plumbers in Centurion" with how many are listed | Category x suburb pages | `/category/<cat>/<suburb>/` |
| Saturday | **Guide or tourism:** one guide or attraction | Guides and tourism pages | `/guides/…`, `/tourism/…` |
| Sunday | **The week in local news:** 3 headlines | News routine | `/news/…` |

Breaking local news (load-shedding, water cuts, road closures) can also go out the same day as an extra post, but only from the news routine's verified items.

**Rules for every post:**
- Only verified data that's already on the site. Never invent opening hours, prices or claims.
- No "best", "top" or "#1" claims about businesses. Use "listed on PretoriaHub" wording.
- Images are our own generated cards (see 4.3) or the AI event images we already make. Never copy a business's or an event organiser's photos or posters; they're copyrighted.
- Never post a business that has asked to be removed (the `suppressed` list), or one flagged closed.
- No personal names or phone numbers of individuals, only businesses' public contact details.
- At most 3 hashtags on Facebook and 5–8 on Instagram, chosen from a fixed per-city list.

**Paid add-on (later):** a "Social spotlight" post for Featured businesses, as an extra perk of the paid plan or a once-off product. It slots into the Friday post and is labelled as a paid partnership (Meta requires the "Paid partnership" label for paid posts).

## 4. The routine: how posting runs automatically [Me]

It follows the same principles as the other routines (`ROUTINES-PLAN.md`): scripts do the mechanical work, and nothing reaches the public without passing a check.

### 4.1 Overview

```
Daily, 05:00 SAST (GitHub Actions)
  scripts/social/plan.mjs --city C    -> picks today's post from the site's data
                                         (rotation in section 3, skips anything posted before)
  scripts/social/card.mjs             -> draws the post image(s) with sharp, like the profile kit
  scripts/social/caption.mjs          -> fills the caption template, adds the link with UTM tags
  writes social/queue/<city>/<date>.json + images, commits them to main

Daily, at the post time (GitHub Actions)
  scripts/social/publish.mjs --city C -> posts the queued item to the Facebook Page and
                                         Instagram via Meta's Graph API, records the post IDs
                                         in status/<city>/social-log.jsonl
```

There is no AI agent in the normal flow. Captions come from templates filled with real data, which is cheaper, never makes things up, and is consistent. The only AI use is optional: the Sunday news round-up can reuse the summaries the news routine has already written.

### 4.2 Review before posting

The queue file is committed about 13 hours before it posts, so there's time to look at it.
- **Week 1–2:** "approval mode". Nothing posts until the item is approved: either `"approved": true` in the queue file, or an "Approve" button in the admin console (a small Socials tab listing tomorrow's posts with a preview).
- **From week 3:** "auto mode". Everything posts unless it's marked `"skip": true`. One switch per city in `sites/<city>.json`.

### 4.3 Post images

Generated with `sharp`, like `make-profile-kit.mjs`, in each site's colours: 1080 x 1350 (4:5) for the feed and 1080 x 1920 for stories. Templates:
- **Business card:** name, category, suburb, "Open today 08:00–17:00" (only when the hours are known), the site's pin logo.
- **List card:** "New this week", "On this weekend" or "Plumbers in Centurion", with up to 5 lines.
- **Fuel card:** this month's prices and change per grade.
- **Event card:** uses the AI event image the events routine already generates.

The images are published to the site's own media storage (Cloudflare R2, `/media/social/...`), because Instagram's API fetches the image from a public URL.

### 4.4 Meta API access [You, about 20 minutes, once]

1. At developers.facebook.com, create an app of type **Business** linked to the Business portfolio.
2. Add the products **Facebook Login for Business** and **Instagram**.
3. Generate a long-lived **Page access token** for each Page with these permissions: `pages_manage_posts`, `pages_read_engagement`, `instagram_basic`, `instagram_content_publish`, `business_management`. Because the app only posts to your own Pages, no app review should be needed. I'll walk you through the token step when you get there.
4. Add these as GitHub repository secrets (never in a file in the repo, which is public):
   - `META_PAGE_ID_PRETORIA`, `META_PAGE_TOKEN_PRETORIA`, `META_IG_USER_ID_PRETORIA`
   - and the same three for `POLOKWANE` and `CAPETOWN`.

Costs: the Meta API is free. Instagram limits API posting per account per day, far above one post a day.

### 4.5 Safety

- **Health check:** `publish.mjs` fails loudly (a red GitHub Action, like the other routines) on an expired token or a rejected post, and never retries more than once, so nothing gets posted twice.
- **Duplicates:** a post is never repeated within 90 days, and a business never more than once in 30 days. The log is the record.
- **Kill switch:** `"socialPosting": false` in `sites/<city>.json` stops all posting for that city on the next run.

## 5. What stays manual [You]

- **Replying to comments and messages.** Aim to check both apps once a day. Replying within a day helps the Page's reach, and owners asking about their listing are potential paying customers.
- **Sharing posts into local Facebook groups.** This is where most early followers come from (community, suburb and "support local" groups). Follow each group's rules; many allow business posts only on set days.
- **Inviting followers:** on Facebook, invite your own friends who live in each city to like the Page. That's the quickest way to the first 100 followers.

## 6. Measuring

- **Traffic:** every link carries `utm_source=facebook|instagram&utm_medium=social&utm_campaign=<post type>`, so Google Analytics shows visits per network and per post type.
- **Weekly report:** add a "Socials" section to the weekly Search Console report (`status/seo/report.md`): followers, reach and clicks per network from the Meta API, plus the top 3 posts of the week.
- **After 6 weeks:** drop or replace the weakest post type and move post times to the best-performing hour.

## 7. Build order

| Step | Who | What | Time |
|---|---|---|---|
| 1 | You | Accounts, profile kit, launch post (section 1) | 30 min |
| 2 | Me | Footer links and `sameAs` structured data once you send the six links | Same day |
| 3 | You | Meta app and tokens as GitHub secrets (4.4) | 20 min |
| 4 | Me | `plan`, `card`, `caption`, `publish` scripts and the two workflows, in approval mode | 1–2 sessions |
| 5 | Me | Admin "Socials" tab with preview and approve/skip | 1 session |
| 6 | Both | Two weeks in approval mode, then switch to auto mode | 2 weeks |
| 7 | Me | Socials section in the weekly report | After 2 weeks of data |
