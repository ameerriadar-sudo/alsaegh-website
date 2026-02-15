# Hosting Setup Guide for Al-Saegh Center Website

This guide provides multiple options for hosting the website, from simple local development to production deployment.

## Quick Start (Local Development)

### Option 1: Using Node.js (Recommended)

1. **Install Node.js** (if not already installed)
   - Download from: https://nodejs.org/
   - Verify installation: `node --version`

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the server**
   ```bash
   npm start
   ```
   Or for development with no caching:
   ```bash
   npm run dev
   ```

4. **Access the website**
   - Open your browser to: http://localhost:8080

### Option 2: Using Python (No Node.js Required)

1. **Python 3 is required** (usually pre-installed on most systems)

2. **Start the server**
   ```bash
   # Windows
   python -m http.server 8080
   
   # Mac/Linux
   python3 -m http.server 8080
   ```

3. **Access the website**
   - Open your browser to: http://localhost:8080

### Option 3: Using Express Server (More Features)

1. **Install Express**
   ```bash
   npm install express
   ```

2. **Start the server**
   ```bash
   node server.js
   ```

3. **Access the website**
   - Open your browser to: http://localhost:8080

## Production Hosting Options

### Option 1: Netlify (Easiest - Recommended)

1. **Create a Netlify account**
   - Go to: https://www.netlify.com/
   - Sign up for free

2. **Deploy**
   - Drag and drop the entire `alsaegh_fullsite` folder to Netlify
   - Or connect your Git repository
   - Netlify will automatically detect it's a static site

3. **Configure**
   - Set build command: (leave empty - no build needed)
   - Set publish directory: `/` (root)
   - Add custom domain (optional)

4. **Benefits**
   - Free SSL certificate
   - Custom domain support
   - CDN included
   - Automatic deployments from Git

### Option 2: Vercel

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Deploy**
   ```bash
   cd alsaegh_fullsite
   vercel
   ```

3. **Follow prompts**
   - Login/create account
   - Confirm settings
   - Deploy!

### Option 3: GitHub Pages

1. **Create a GitHub repository**
   - Push your code to GitHub

2. **Enable GitHub Pages**
   - Go to repository Settings > Pages
   - Select branch (usually `main` or `master`)
   - Select folder: `/ (root)`
   - Save

3. **Access your site**
   - URL: `https://yourusername.github.io/repository-name`

### Option 4: Traditional Web Hosting (cPanel)

1. **Upload files via FTP**
   - Use FileZilla or similar FTP client
   - Connect to your hosting server
   - Upload all files to `public_html` or `www` folder

2. **File structure on server**
   ```
   public_html/
   ├── index.html
   ├── admin.html
   ├── dialysis.html
   ├── research.html
   ├── sarru.html
   └── assets/
       ├── css/
       ├── js/
       └── images/
   ```

3. **Access your site**
   - Visit: `http://yourdomain.com`

### Option 5: AWS S3 + CloudFront

1. **Create S3 bucket**
   - Name it: `alsaegh-center-website`
   - Enable static website hosting
   - Set index document: `index.html`

2. **Upload files**
   - Use AWS Console or CLI
   - Upload all files to bucket

3. **Set permissions**
   - Make bucket public (for static hosting)
   - Or use CloudFront for better security

4. **Configure CloudFront** (optional but recommended)
   - Create distribution
   - Point to S3 bucket
   - Enable HTTPS

### Option 6: Cloudflare Pages

1. **Create a Cloudflare account**
   - Go to: https://pages.cloudflare.com/
   - Sign up for free

2. **Deploy via Git**
   - Connect your GitHub repository
   - Build command: (leave empty)
   - Build output directory: `/`
   - Deploy automatically on every push

3. **Or deploy via Direct Upload**
   ```bash
   npx wrangler pages deploy . --project-name=alsaegh-center
   ```

4. **Benefits**
   - Free SSL certificate
   - Global CDN
   - Unlimited bandwidth (free tier)
   - Custom domain support

   See **CLOUDFLARE_PAGES.md** for detailed instructions.

### Option 7: VPS/Cloud Server (Nginx)

1. **Set up server**
   - Ubuntu/Debian VPS
   - Install Nginx: `sudo apt install nginx`

2. **Configure Nginx**
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;
       root /var/www/alsaegh_fullsite;
       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }
   }
   ```

3. **Upload files**
   ```bash
   sudo cp -r alsaegh_fullsite/* /var/www/alsaegh_fullsite/
   sudo chown -R www-data:www-data /var/www/alsaegh_fullsite
   ```

4. **Enable SSL** (Let's Encrypt)
   ```bash
   sudo apt install certbot python3-certbot-nginx
   sudo certbot --nginx -d yourdomain.com
   ```

## Environment-Specific Configuration

### Development
- Use `npm run dev` for no-cache development
- Access via `localhost:8080`
- All features work locally

### Staging
- Deploy to Netlify/Vercel staging environment
- Test all features before production
- Verify API keys work correctly

### Production
- Use custom domain
- Enable HTTPS (automatic with most hosts)
- Configure API keys securely
- Update all placeholder content
- Set up monitoring/analytics

## Important Notes

### Before Going Live

1. **Update Placeholder Content**
   - Phone number: `+964 770 000 000`
   - Email: `info@alsaegh-center.com`
   - Social media URLs
   - Google Maps location

2. **Configure API Keys**
   - Google Gemini API key
   - Telegram bot token (if using)

3. **Security**
   - Change admin password
   - Consider backend for admin panel
   - Use environment variables for API keys

4. **SEO**
   - Add meta descriptions
   - Add Open Graph tags
   - Submit sitemap to search engines

5. **Performance**
   - Optimize images
   - Minify CSS/JS (optional)
   - Enable compression

## Troubleshooting

### Port Already in Use
```bash
# Find process using port 8080
# Windows
netstat -ano | findstr :8080

# Mac/Linux
lsof -i :8080

# Use different port
npm start -- -p 3000
```

### CORS Issues
- If accessing from different origin, ensure proper CORS headers
- For local development, use `http://localhost:8080`

### API Keys Not Working
- Verify API keys are correctly set
- Check browser console for errors
- Ensure API keys have proper permissions

## Support

For issues or questions:
- Check `ANALYSIS.md` for detailed project information
- Review browser console for JavaScript errors
- Verify all file paths are correct

---

**Last Updated**: Generated automatically
**Recommended Host**: Netlify (easiest) or Vercel (best performance)

