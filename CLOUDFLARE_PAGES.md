# Deploy to Cloudflare Pages

This guide explains how to host the Al-Saegh website on Cloudflare Pages (free tier available).

## Option 1: Deploy via Git (Recommended)

### Step 1: Push your code to GitHub

1. Create a new repository on [GitHub](https://github.com/new)
2. Initialize git in your project folder (if not already):
   ```bash
   cd alsaegh_fullsite
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin main
   ```

### Step 2: Connect to Cloudflare Pages

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/) → **Workers & Pages**
2. Click **Create** → **Pages** → **Connect to Git**
3. Authorize GitHub and select your repository
4. Configure the build:
   - **Project name**: `alsaegh-center` (or your choice)
   - **Production branch**: `main`
   - **Build command**: Leave **empty** (static site, no build)
   - **Build output directory**: `/`
5. Click **Save and Deploy**

### Step 3: Set the correct output directory

Since this is a static site, Cloudflare needs to serve the root files. If deployment fails:

- Set **Build output directory** to: `./` or leave as root
- Or add a `wrangler.toml` in the project root (see Option 2)

Your site will be live at: `https://your-project.pages.dev`

---

## Option 2: Direct Upload (No Git required)

### Step 1: Install Wrangler CLI

```bash
npm install -g wrangler
```

Or use without installing:

```bash
npx wrangler
```

### Step 2: Log in to Cloudflare

```bash
wrangler login
```

This opens a browser to authenticate.

### Step 3: Create a Pages project

```bash
cd alsaegh_fullsite
wrangler pages project create alsaegh-center
```

### Step 4: Deploy your site

```bash
wrangler pages deploy . --project-name=alsaegh-center
```

**Important**: Deploy the folder that contains `index.html`, `admin.html`, and the `assets` folder. If you're inside `alsaegh_fullsite`, the `.` is correct.

Your site will be live at: `https://alsaegh-center.pages.dev`

---

## Option 3: Deploy via Cloudflare Dashboard (Drag & Drop)

1. Go to [Cloudflare Pages](https://pages.cloudflare.com/)
2. Click **Create a project** → **Direct Upload**
3. Create project name: `alsaegh-center`
4. **Upload** your project folder:
   - Zip the contents of `alsaegh_fullsite` (include `index.html`, `admin.html`, `assets/`, etc. at the root of the zip)
   - Or use Wrangler as in Option 2

---

## Files to Include

Ensure these are in your deployment:

```
alsaegh_fullsite/
├── index.html
├── admin.html
├── dialysis.html
├── sarru.html
├── research.html
├── assets/
│   ├── css/
│   │   └── style.css
│   └── js/
│       ├── script.js
│       ├── admin.js
│       ├── admin-login.js
│       └── content-config.js
```

---

## Custom Domain

1. In Cloudflare Pages → your project → **Custom domains**
2. Click **Set up a custom domain**
3. Enter your domain (e.g. `alsaegh-center.com`)
4. Follow the DNS instructions (add CNAME or A record)
5. SSL is automatic with Cloudflare

---

## Important Notes for Cloudflare Pages

### localStorage
- Admin content, news, publications, and statistics are stored in **localStorage**
- localStorage is **per-browser, per-origin** — it does not sync across devices or users
- For production with shared data, you would need a backend/database

### Admin Panel
- The admin panel works client-side only
- Changes are saved to the visitor's browser
- Each visitor sees their own version until you add a real backend

### Performance
- Cloudflare Pages uses a global CDN
- Static assets are cached automatically
- Free tier includes unlimited bandwidth

---

## Quick Deploy Script

Create `deploy-cloudflare.ps1` (PowerShell) or `deploy-cloudflare.sh` (Bash):

**PowerShell:**
```powershell
# deploy-cloudflare.ps1
npx wrangler pages deploy . --project-name=alsaegh-center
```

**Bash:**
```bash
#!/bin/bash
# deploy-cloudflare.sh
npx wrangler pages deploy . --project-name=alsaegh-center
```

Run from the `alsaegh_fullsite` directory.
