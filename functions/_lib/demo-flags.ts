// Build-time switches for demo-only behaviour. The committed values are the
// safe (production) ones. Only .github/workflows/deploy-ethan-preview.yml
// overwrites this file (right before deploying the dev preview) to turn the
// demo admin login on, so a production deploy can never accept it.
export const DEMO_ADMIN_ENABLED = false;
