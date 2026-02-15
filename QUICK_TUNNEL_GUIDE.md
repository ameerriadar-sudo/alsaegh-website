# Quick Tunnel Setup Guide

## 🚀 Fastest Method: Cloudflared (No Account Needed)

Run this command in a new terminal:
```bash
npx cloudflared tunnel --url http://localhost:3000
```

You'll see output like:
```
+--------------------------------------------------------------------------------------------+
|  Your quick Tunnel has been created! Visit it at (it may take some time to be reachable): |
|  https://xxxx-xxxx-xxxx.trycloudflare.com                                                 |
+--------------------------------------------------------------------------------------------+
```

**Copy that HTTPS URL** - that's your public link!

---

## Alternative: Localtunnel (No Account Needed)

Run this command:
```bash
npx localtunnel --port 3000
```

You'll get a URL like: `https://xxxx.loca.lt`

---

## Ngrok (Requires Free Account)

If you want to use ngrok:

1. **Sign up** (free): https://dashboard.ngrok.com/signup
2. **Get your token**: https://dashboard.ngrok.com/get-started/your-authtoken
3. **Authenticate**:
   ```bash
   ngrok config add-authtoken YOUR_TOKEN_HERE
   ```
4. **Start tunnel**:
   ```bash
   ngrok http 3000
   ```
5. **Copy the HTTPS URL** from the output

---

## Quick Start Script

I've created `start-tunnel.bat` - double-click it and choose your preferred service!

---

## Your Local Server

Make sure your Next.js server is running:
```bash
cd nextjs-site
npm run dev
```

It should be on: http://localhost:3000

