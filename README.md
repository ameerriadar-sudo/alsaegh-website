# Al-Saegh Specialty Center Website

A modern, multilingual website for Al-Saegh Specialty Center for Dialysis & Kidney Disease, located in Karbala, Iraq.

## 🚀 Quick Start

### Local Development

**Option 1: Using Node.js**
```bash
npm install
npm start
```
Then open http://localhost:8080 in your browser.

**Option 2: Using Python**
```bash
python -m http.server 8080
```
Then open http://localhost:8080 in your browser.

## 📁 Project Structure

```
alsaegh_fullsite/
├── index.html          # Homepage
├── admin.html          # Admin panel
├── dialysis.html       # Dialysis services page
├── research.html       # Research hub page
├── sarru.html          # Sarru medical services page
├── assets/
│   ├── css/
│   │   └── style.css   # Main stylesheet
│   ├── js/
│   │   ├── script.js   # Main functionality
│   │   └── admin.js    # Admin panel logic
│   └── images/         # Image assets
├── package.json        # Node.js dependencies
├── server.js           # Express server (optional)
├── ANALYSIS.md         # Detailed project analysis
└── HOSTING_SETUP.md    # Hosting deployment guide
```

## ✨ Features

- 🌍 **Multilingual**: English and Arabic support with RTL layout
- 📅 **Appointment Booking**: Queue-based booking system
- 🤖 **AI Assistant**: Google Gemini-powered chatbot
- 📊 **Statistics Dashboard**: Animated counters for key metrics
- 📰 **News & Publications**: Dynamic content management
- 🔐 **Admin Panel**: Content management system
- 📱 **Responsive Design**: Mobile-friendly interface
- 🎨 **Modern UI**: Dark theme with smooth animations

## 🛠️ Configuration

### Required Setup

1. **API Keys** (in `assets/js/script.js`):
   - Google Gemini API Key (line 273)
   - Telegram Bot Token (optional, line 216)

2. **Content Updates**:
   - Contact information (phone, email)
   - Social media URLs
   - Google Maps location
   - Admin password (in `assets/js/admin.js`)

## 📚 Documentation

- **[ANALYSIS.md](ANALYSIS.md)**: Complete project analysis
- **[HOSTING_SETUP.md](HOSTING_SETUP.md)**: Deployment guide

## 🌐 Deployment

### Recommended: Netlify
1. Drag and drop the folder to [Netlify](https://www.netlify.com/)
2. Your site is live!

### Other Options
- Vercel
- GitHub Pages
- Traditional web hosting
- AWS S3 + CloudFront

See [HOSTING_SETUP.md](HOSTING_SETUP.md) for detailed instructions.

## 🔒 Security Notes

⚠️ **Important**: 
- Admin password is currently client-side only
- API keys are in client-side code
- For production, implement backend authentication
- Use environment variables for sensitive data

## 📝 License

MIT License

## 📞 Contact

Al-Saegh Specialty Center  
Karbala, Iraq  
Phone: +964 770 000 000  
Email: info@alsaegh-center.com

---

**Status**: Development/Staging  
**Last Updated**: 2024

