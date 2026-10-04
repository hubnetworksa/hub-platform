#!/usr/bin/env python3
# Persistent fetch server for the content-upgrade research step. research.mjs
# spawns ONE of these and sends it NDJSON requests over stdin; it replies with
# NDJSON over stdout (one line per completed request, tagged by "id" so
# replies can arrive out of order while several run concurrently).
#
# Why: plain HTTP fetches (research.mjs's old `get()`) got rate-limited by
# Brave (HTTP 429 under concurrency) and blocked by Facebook (HTTP 400
# without a full browser fingerprint). Crawl4AI drives a real headless
# Chromium with its "magic" anti-bot handling (overrides navigator.webdriver,
# simulates a real user, handles cookie/consent walls) and its own per-domain
# rate limiting, so the same requests go through instead of being blocked.
#
# Request:  {"id": 1, "url": "https://...", "ua": "chrome" | "googlebot"}
# Response: {"id": 1, "ok": true, "status": 200, "finalUrl": "...", "html": "..."}
#        or {"id": 1, "ok": false, "error": "..."}
#
# research.mjs still does all the HTML parsing (extract/parseBrave/parseBing/
# extractFb) exactly as before; this process only replaces the transport.
import sys
import json
import asyncio
import threading

from crawl4ai import AsyncWebCrawler, BrowserConfig, CrawlerRunConfig, CacheMode

CHROME_UA = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
)
GBOT_UA = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
UA_MAP = {"chrome": CHROME_UA, "googlebot": GBOT_UA}

MAX_CONCURRENT = 6  # concurrent in-flight renders; one shared browser, many pages


def emit(obj):
    # ensure_ascii=True: JSON-escape non-ASCII instead of writing raw UTF-8 —
    # Windows' console defaults to a legacy codepage (cp1252) that can't
    # encode arbitrary page text (emoji, smart quotes, a stray BOM), which
    # crashed stdout.write on real pages. Node parses \uXXXX escapes back to
    # the exact same string either way.
    sys.stdout.write(json.dumps(obj, ensure_ascii=True) + "\n")
    sys.stdout.flush()


async def handle_one(crawler, req, sem):
    rid = req.get("id")
    url = req.get("url")
    ua = UA_MAP.get(req.get("ua") or "chrome", CHROME_UA)
    cfg = CrawlerRunConfig(
        cache_mode=CacheMode.BYPASS,
        magic=True,
        simulate_user=True,
        override_navigator=True,
        page_timeout=18000,
        wait_until="domcontentloaded",
        user_agent=ua,
        verbose=False,
    )
    async with sem:
        try:
            result = await crawler.arun(url=url, config=cfg)
            emit({
                "id": rid,
                "ok": bool(result.success),
                "status": getattr(result, "status_code", None),
                "finalUrl": result.url or url,
                "html": result.html or "",
                "error": None if result.success else (result.error_message or "fetch failed"),
            })
        except Exception as e:  # noqa: BLE001 - report every failure back to Node, never crash the server
            emit({"id": rid, "ok": False, "error": str(e)[:300]})


async def main():
    browser_cfg = BrowserConfig(headless=True, verbose=False, text_mode=False)
    sem = asyncio.Semaphore(MAX_CONCURRENT)
    loop = asyncio.get_event_loop()
    queue: asyncio.Queue = asyncio.Queue()

    def reader_thread():
        for line in sys.stdin:
            line = line.strip()
            if not line:
                continue
            try:
                req = json.loads(line)
            except Exception as e:  # noqa: BLE001
                emit({"id": None, "ok": False, "error": f"bad request json: {e}"})
                continue
            loop.call_soon_threadsafe(queue.put_nowait, req)
        loop.call_soon_threadsafe(queue.put_nowait, None)  # stdin closed -> shut down

    threading.Thread(target=reader_thread, daemon=True).start()

    async with AsyncWebCrawler(config=browser_cfg) as crawler:
        emit({"id": None, "ok": True, "ready": True})
        tasks = set()
        while True:
            req = await queue.get()
            if req is None:
                break
            t = asyncio.create_task(handle_one(crawler, req, sem))
            tasks.add(t)
            t.add_done_callback(tasks.discard)
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)


if __name__ == "__main__":
    asyncio.run(main())
