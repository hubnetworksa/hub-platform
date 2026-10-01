#!/usr/bin/env bash
# Pre-launch check, start to finish, for all three cities:
#   typecheck the Functions → build each city into .build-<city> → check-links
#   → serve it locally → smoke-test it in a browser → remove .build-*.
#
#   bash scripts/launch-check.sh                      # all cities
#   CITIES="polokwane" bash scripts/launch-check.sh   # one city
#   SMOKE_ARGS="--email you@x --password ..." bash scripts/launch-check.sh
#
# Runs on Git Bash on Windows as well as Linux/macOS. Needs Playwright with
# Chromium (`npm i` then `npx playwright install chromium`) for the smoke
# test; without it that step is reported and skipped, nothing else is.
#
# The live-API test (scripts/launch-test.mjs) needs a deployed site, so it is
# not run here — the exact command is printed at the end instead.

set -uo pipefail
cd "$(dirname "$0")/.."

# Node is not on PATH on the Windows dev box; nvm's install is.
NVM_NODE="/c/Users/EthanLindeque/AppData/Local/Author Software/nvm/installs/v24.14.0"
if ! command -v node >/dev/null 2>&1 && [ -d "$NVM_NODE" ]; then
  export PATH="$NVM_NODE:$PATH"
fi
if ! command -v node >/dev/null 2>&1; then
  echo "node is not on PATH (and $NVM_NODE was not found)." >&2
  exit 2
fi
echo "node $(node -v), npm $(npm -v)"

# `${CITIES-...}` (no colon): an explicitly empty CITIES="" means "build
# nothing, just typecheck", only an unset variable gets the default.
CITIES=${CITIES-"capetown pretoria polokwane"}
PORT=${PORT:-4321}
SMOKE_ARGS=${SMOKE_ARGS:-}
FAILED=0
SERVER_PID=""

cleanup() {
  if [ -n "$SERVER_PID" ]; then kill "$SERVER_PID" 2>/dev/null || true; fi
  if [ "${KEEP_BUILDS:-}" != "1" ]; then rm -rf .build-*; fi
}
trap cleanup EXIT

step() { echo; echo "== $*"; }

step "Typecheck functions/"
if ! npm run typecheck:functions; then
  echo "FAIL typecheck"; FAILED=1
fi

for city in $CITIES; do
  out=".build-$city"
  step "Build $city → $out"
  rm -rf "$out"
  if ! SITE="$city" npm run build -- --outDir "$out"; then
    echo "FAIL build $city"; FAILED=1; continue
  fi

  step "Link check $city"
  if ! node scripts/check-links.mjs "$out" "$city"; then
    echo "FAIL links $city"; FAILED=1
  fi

  step "Smoke test $city (http://localhost:$PORT)"
  node scripts/serve-dir.mjs "$out" --port "$PORT" &
  SERVER_PID=$!
  for _ in $(seq 1 40); do
    if curl -sf -o /dev/null "http://localhost:$PORT/"; then break; fi
    sleep 0.25
  done
  node scripts/smoke-test.mjs "http://localhost:$PORT" $SMOKE_ARGS
  smoke=$?
  kill "$SERVER_PID" 2>/dev/null || true
  wait "$SERVER_PID" 2>/dev/null || true
  SERVER_PID=""
  if [ "$smoke" -eq 2 ]; then
    echo "SKIP smoke $city (Playwright/Chromium not installed — npm i && npx playwright install chromium)"
  elif [ "$smoke" -ne 0 ]; then
    echo "FAIL smoke $city"; FAILED=1
  fi
done

step "Next: the live-API test needs a deployed site"
cat <<'EOF'
Run it against the preview (demo admin) or production (an admin session cookie):

  node scripts/launch-test.mjs --base https://ethan-kp7p.polokwanehub-49u.pages.dev \
    --admin-email admin@admin.com --admin-password admin --json launch-polokwane.json

  node scripts/launch-test.mjs --base https://polokwanehub.com --allow-production \
    --admin-session <session cookie of a logged-in admin> --json launch-polokwane.json

Take row counts before and after (read-only):

  node scripts/db-rowcounts.mjs --site polokwane --json before.json
  node scripts/db-rowcounts.mjs --site polokwane --json after.json
  node scripts/compare-rowcounts.mjs before.json after.json --allow-decrease sessions,rate_limits,messages,pending_submissions,event_submissions
EOF

echo
if [ "$FAILED" -ne 0 ]; then
  echo "LAUNCH CHECK: FAIL"
  exit 1
fi
echo "LAUNCH CHECK: PASS"
