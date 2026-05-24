# 🤖 ATS Intelligence v3.0
### Full-Stack AI Recruitment Platform — Live on the Internet

> **Access from anywhere. Data saved in the cloud. AI built-in.**

---

## ✨ What You Get

| Feature | Detail |
|---------|--------|
| ☁️ **Cloud Database** | All candidates & interviews stored in Supabase PostgreSQL |
| 🔄 **Real-time Sync** | Open on phone + laptop simultaneously — both update live |
| 🤖 **Claude AI** | AI Matcher, Prep Generator, Skill Radar, AI Chat |
| 🔑 **Your API Key** | Add in Settings → no limits, your own quota |
| 🎨 **5 Themes** | Rust Dark, Midnight, Emerald, Violet, Rose Gold |
| 📱 **Mobile Ready** | Fully responsive — works on phone, tablet, desktop |
| 🔍 **Global Search** | ⌘K searches all candidates & interviews instantly |

---

## 🚀 COMPLETE SETUP GUIDE (30 minutes)

### STEP 1 — Create Your Supabase Database (5 min)

1. Go to **[supabase.com](https://supabase.com)** → **New Project**
2. Choose a project name (e.g. `ats-intelligence`) and a strong database password
3. Select the region closest to you → **Create Project**
4. Wait ~2 minutes for it to initialize
5. Go to **SQL Editor** (left sidebar) → **New Query**
6. Copy & paste the entire contents of `supabase-schema.sql` and click **Run**
7. You should see: `candidates table | 0 rows` and `interviews table | 0 rows`
8. Go to **Settings → API** and copy:
   - **Project URL**: `https://xxxxxxxxxxxx.supabase.co`
   - **anon public key**: `eyJhbGciOiJIUzI1NiIs...`

---

### STEP 2 — Push Code to GitHub (5 min)

```bash
# 1. Create a new repo on github.com (name it ats-intelligence)
# 2. Then in your terminal:

git init
git add .
git commit -m "ATS Intelligence v3.0 — initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/ats-intelligence.git
git push -u origin main
```

---

### STEP 3 — Deploy to Vercel (5 min)

1. Go to **[vercel.com](https://vercel.com)** → Sign in with GitHub
2. Click **"Add New Project"** → Import your `ats-intelligence` repo
3. Framework: **Next.js** (auto-detected)
4. Click **"Environment Variables"** and add these 3 keys:

```
NEXT_PUBLIC_SUPABASE_URL        = https://YOUR_PROJECT_ID.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY   = eyJhbGciOiJIUzI1NiIs...YOUR_ANON_KEY
NEXT_PUBLIC_DEFAULT_AI_KEY      = sk-ant-api03-...YOUR_ANTHROPIC_KEY (optional)
```

5. Click **Deploy** → Wait ~2 minutes
6. 🎉 **Your app is live!** You get a URL like:
   ```
   https://ats-intelligence-hemanth.vercel.app
   ```

---

### STEP 4 — Bookmark and Use Daily (1 min)

1. Open your Vercel URL on your phone and desktop
2. On mobile: **Share → Add to Home Screen** for an app-like icon
3. Go to **Settings → API Keys** in the app and add your Anthropic key

---

## 📁 Project Structure

```
ats-intelligence/
├── src/
│   ├── app/
│   │   ├── layout.tsx          ← Next.js root layout
│   │   └── page.tsx            ← Entry page (imports App)
│   └── components/
│       └── App.jsx             ← Complete ATS app (1500+ lines)
├── .env.local.example          ← Template for your env vars
├── .github/
│   └── workflows/
│       └── deploy.yml          ← Auto-deploy on git push
├── next.config.js
├── package.json
├── tsconfig.json
└── supabase-schema.sql         ← Run this in Supabase SQL editor
```

---

## 🗃️ How Your Data is Stored

```
Supabase PostgreSQL
├── candidates          ← All candidate records
│   ├── id, date, category
│   ├── candidate_name, vendor_name
│   ├── phone, email
│   ├── client, role, location, rate
│   ├── status, notes
│   └── created_at, updated_at (auto)
│
└── interviews          ← All interview records
    ├── id, candidate_id (linked)
    ├── candidate_name, client
    ├── date, time, timezone
    ├── mode, round, status
    ├── interviewer, notes
    └── created_at, updated_at (auto)
```

**Every save goes directly to Supabase** — no delay, no manual sync needed.
**Real-time subscriptions** mean if you add a candidate on your phone, your laptop updates instantly.

---

## 🔑 Getting Your Anthropic API Key

1. Go to **[console.anthropic.com](https://console.anthropic.com)**
2. Sign up / Log in
3. Click **"API Keys"** → **"Create Key"**
4. Copy the key (starts with `sk-ant-api03-`)
5. Open your live app → **Settings → 🔑 API Keys**
6. Paste the key → **Save** → **Test ⚡**

---

## 🔄 Updating Your App

Any time you want to update the app:

```bash
# Make your changes to App.jsx or any file
git add .
git commit -m "Update: describe your change"
git push
# Vercel auto-deploys in ~90 seconds ✓
```

---

## 📱 Use on Any Device

| Device | How |
|--------|-----|
| **Laptop** | Open the Vercel URL in browser |
| **iPhone** | Safari → Share → Add to Home Screen |
| **Android** | Chrome → Menu → Add to Home Screen |
| **Tablet** | Open URL, works fully responsive |
| **Office PC** | Open URL — data is already synced from home |

---

## 🆘 Troubleshooting

### "Cannot read Supabase" error
→ Check `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` in Vercel env vars
→ Re-run `supabase-schema.sql` in SQL Editor

### Data not showing after adding
→ Hard refresh (Ctrl+Shift+R / Cmd+Shift+R)
→ Check browser console for Supabase errors

### AI features not working
→ Go to Settings → API Keys → add your Anthropic key → Test it

### Build fails on Vercel
→ Check Node.js version is set to 20 in Vercel settings
→ Make sure all env vars are added (no typos)

---

## 💰 Cost

| Service | Free Tier | Paid |
|---------|-----------|------|
| **Vercel** | Unlimited personal projects | $20/mo pro |
| **Supabase** | 500MB DB, 2GB bandwidth/mo | $25/mo pro |
| **Anthropic** | Pay per use (~$0.003/1K tokens) | — |

**For personal daily use: completely FREE** on both Vercel and Supabase free tiers.

---

## 🛠️ Tech Stack

```
Frontend    →  React 18 + Next.js 14
Database    →  Supabase (PostgreSQL + Realtime)
AI Engine   →  Anthropic Claude Sonnet 4
Charts      →  Recharts
Doc Parser  →  Mammoth.js (DOCX → text)
Deploy      →  Vercel + GitHub Actions
Style       →  Custom CSS-in-JS (Glassmorphism)
```

---

*Built with ❤️ for Hemanth Kumar — ATS Intelligence v3.0*
