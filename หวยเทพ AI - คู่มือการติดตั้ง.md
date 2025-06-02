# 🔮 หวยเทพ AI - คู่มือการติดตั้งและพัฒนา

## 📋 สารบัญ
- [วิธีการติดตั้งและรัน](#-วิธีการติดตั้งและรัน)
- [ข้อกำหนดของระบบ](#-ข้อกำหนดของระบบ)
- [การติดตั้งแบบง่าย](#-การติดตั้งแบบง่าย)
- [การติดตั้งแบบมืออาชีพ](#-การติดตั้งแบบมืออาชีพ)
- [การตั้งค่า API Keys](#-การตั้งค่า-api-keys)
- [แนวทางการพัฒนาแบบขั้นตอน](#-แนวทางการพัฒนาแบบขั้นตอน)
- [โครงสร้างโปรเจค](#-โครงสร้างโปรเจค)
- [การ Deploy](#-การ-deploy)
- [การแก้ไขปัญหา](#-การแก้ไขปัญหา)

---

## 🚀 วิธีการติดตั้งและรัน

### 📋 ข้อกำหนดของระบบ

#### ความต้องการขั้นต่ำ:
- ✅ เว็บเบราว์เซอร์ที่ทันสมัย (Chrome, Firefox, Safari, Edge)
- ✅ JavaScript เปิดใช้งาน
- ✅ อินเทอร์เน็ตสำหรับ AI API (ไม่บังคับ)

#### สำหรับการพัฒนา:
- 🔧 **Node.js** v16+ (แนะนำ v18+)
- 🔧 **npm** หรือ **yarn**
- 🔧 **Git**
- 🔧 **VS Code** หรือ Text Editor อื่นๆ

---

## ⚡ การติดตั้งแบบง่าย (สำหรับผู้ใช้ทั่วไป)

### วิธีที่ 1: ใช้งานทันที (Instant)
```bash
# ดาวน์โหลดไฟล์ index.html
# เปิดไฟล์ด้วยเว็บเบราว์เซอร์
# ใช้งานได้เลย!
```

### วิธีที่ 2: สร้างโฟลเดอร์ใหม่
```bash
# สร้างโฟลเดอร์โปรเจค
mkdir หวยเทพ-ai
cd หวยเทพ-ai

# สร้างไฟล์ index.html และคัดลอกโค้ด
# เปิดไฟล์ด้วยเบราว์เซอร์
```

### วิธีที่ 3: ใช้ Live Server (แนะนำ)
```bash
# ติดตั้ง Live Server ผ่าน VS Code Extension
# หรือใช้ Python
python -m http.server 8000

# เปิดเบราว์เซอร์ไปที่ http://localhost:8000
```

---

## 🏗️ การติดตั้งแบบมืออาชีพ (สำหรับนักพัฒนา)

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/lottery-ai.git
cd lottery-ai
```

### 2. ติดตั้ง Dependencies
```bash
# สร้าง package.json
npm init -y

# ติดตั้ง development dependencies
npm install --save-dev vite @vitejs/plugin-vanilla
npm install --save-dev prettier eslint
npm install --save-dev tailwindcss autoprefixer
```

### 3. สร้างไฟล์ package.json
```json
{
  "name": "lottery-ai",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "lint": "eslint . --ext js,html",
    "format": "prettier --write ."
  },
  "devDependencies": {
    "vite": "^5.0.0",
    "@vitejs/plugin-vanilla": "^1.0.0",
    "prettier": "^3.0.0",
    "eslint": "^8.0.0"
  }
}
```

### 4. สร้าง vite.config.js
```javascript
import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    port: 3000,
    open: true
  },
  build: {
    outDir: 'dist',
    assetsDir: 'assets'
  }
})
```

### 5. รันโปรเจค
```bash
# Development mode
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

---

## 🔑 การตั้งค่า API Keys

### 1. รับ API Keys

#### Google Gemini API:
1. ไปที่ [Google AI Studio](https://makersuite.google.com/)
2. สร้าง API Key ใหม่
3. คัดลอก API Key

#### OpenAI API:
1. ไปที่ [OpenAI Platform](https://platform.openai.com/)
2. สร้าง API Key ใหม่
3. คัดลอก API Key

### 2. การใช้งาน API Keys

#### วิธีที่ 1: ใส่ในหน้าเว็บ (Simple)
```javascript
// ใส่ API Key ในช่องที่กำหนดในหน้าเว็บ
// ข้อมูลจะเก็บใน localStorage
```

#### วิธีที่ 2: Environment Variables (Advanced)
```bash
# สร้างไฟล์ .env
VITE_GEMINI_API_KEY=your_gemini_api_key_here
VITE_OPENAI_API_KEY=your_openai_api_key_here
```

```javascript
// ใช้ในโค้ด
const geminiKey = import.meta.env.VITE_GEMINI_API_KEY;
const openaiKey = import.meta.env.VITE_OPENAI_API_KEY;
```

### 3. การรักษาความปลอดภัย API Keys
```javascript
// ✅ ถูกต้อง - ใช้ environment variables
const apiKey = import.meta.env.VITE_API_KEY;

// ❌ ผิด - เขียน API key ตรงในโค้ด
const apiKey = "sk-1234567890abcdef";
```

---

## 🔧 แนวทางการพัฒนาแบบขั้นตอน

### Phase 1: Foundation (สัปดาห์ที่ 1-2)
```markdown
✅ สร้างหน้า UI พื้นฐาน
✅ ระบบสร้างเลขด้วยอัลกอริทึมง่ายๆ
✅ ระบบบันทึกข้อมูลใน localStorage
✅ Responsive Design

📋 Tasks:
- [ ] สร้าง HTML structure
- [ ] เขียน CSS styling
- [ ] สร้าง JavaScript functions พื้นฐาน
- [ ] ทดสอบการทำงานในเบราว์เซอร์
```

### Phase 2: Core Features (สัปดาห์ที่ 3-4)
```markdown
✅ อัลกอริทึมสร้างเลขขั้นสูง (6 วิธี)
✅ ระบบอัพโหลดไฟล์ (TXT, Excel, CSV)
✅ การวิเคราะห์สถิติ
✅ ระบบจัดการข้อมูล

📋 Tasks:
- [ ] Fibonacci algorithm
- [ ] Prime numbers generator
- [ ] Statistical analysis
- [ ] Pattern recognition
- [ ] File upload system
- [ ] Data visualization
```

### Phase 3: AI Integration (สัปดาห์ที่ 5-6)
```markdown
✅ เชื่อมต่อ Gemini AI
✅ เชื่อมต่อ OpenAI
✅ ระบบแชทกับ AI
✅ การวิเคราะห์ด้วย AI

📋 Tasks:
- [ ] API integration
- [ ] Error handling
- [ ] Response formatting
- [ ] AI prompt optimization
```

### Phase 4: Advanced Features (สัปดาห์ที่ 7-8)
```markdown
✅ Neural Network simulation
✅ Chaos Theory algorithm
✅ Advanced statistics
✅ Export/Import system

📋 Tasks:
- [ ] Complex algorithms
- [ ] Data export features
- [ ] Performance optimization
- [ ] User experience improvements
```

### Phase 5: Polish & Deploy (สัปดาห์ที่ 9-10)
```markdown
✅ UI/UX refinements
✅ Performance optimization
✅ Error handling
✅ Production deployment

📋 Tasks:
- [ ] Code refactoring
- [ ] Performance testing
- [ ] Browser compatibility
- [ ] Documentation
- [ ] Deployment setup
```

---

## 📁 โครงสร้างโปรเจค

### รูปแบบ Simple (Single File)
```
หวยเทพ-ai/
├── index.html          # ไฟล์หลัก (ทุกอย่างรวมกัน)
├── README.md           # คู่มือการใช้งาน
└── assets/
    ├── images/         # รูปภาพ (ถ้ามี)
    └── data/           # ไฟล์ข้อมูลตัวอย่าง
```

### รูปแบบ Professional (Modular)
```
หวยเทพ-ai/
├── index.html
├── package.json
├── vite.config.js
├── .env
├── .gitignore
├── README.md
├── src/
│   ├── js/
│   │   ├── main.js
│   │   ├── algorithms.js
│   │   ├── ai-integration.js
│   │   ├── file-handler.js
│   │   ├── statistics.js
│   │   └── ui-components.js
│   ├── css/
│   │   ├── main.css
│   │   ├── components.css
│   │   └── responsive.css
│   └── assets/
│       ├── images/
│       └── data/
├── dist/               # Production build
└── docs/               # Documentation
```

### การแบ่งไฟล์ JavaScript
```javascript
// main.js - Entry point
import { LotteryGenerator } from './algorithms.js';
import { AIAssistant } from './ai-integration.js';
import { FileHandler } from './file-handler.js';

// algorithms.js - Mathematical algorithms
export class LotteryGenerator {
    fibonacci() { /* ... */ }
    primeNumbers() { /* ... */ }
    // ...
}

// ai-integration.js - AI API calls
export class AIAssistant {
    async callGemini() { /* ... */ }
    async callOpenAI() { /* ... */ }
}

// file-handler.js - File upload/download
export class FileHandler {
    parseExcel() { /* ... */ }
    parseCSV() { /* ... */ }
    exportData() { /* ... */ }
}
```

---

## 🌐 การ Deploy

### 1. GitHub Pages (ฟรี)
```bash
# สร้าง repository ใน GitHub
# Push โค้ดขึ้น GitHub
# เปิดใช้งาน GitHub Pages ใน Settings

# URL จะเป็น: https://username.github.io/repository-name
```

### 2. Netlify (ฟรี + ง่าย)
```bash
# 1. สร้างบัญชี Netlify
# 2. เชื่อมต่อกับ GitHub repository
# 3. Auto deploy เมื่อมีการ push

# Build settings:
# Build command: npm run build
# Publish directory: dist
```

### 3. Vercel (ฟรี + เร็ว)
```bash
# ติดตั้ง Vercel CLI
npm i -g vercel

# Deploy
vercel

# การตั้งค่าสำหรับ Vite
# Framework Preset: Vite
# Build Command: npm run build
# Output Directory: dist
```

### 4. Firebase Hosting (ฟรี + Google)
```bash
# ติดตั้ง Firebase CLI
npm install -g firebase-tools

# เข้าสู่ระบบ
firebase login

# เริ่มต้นโปรเจค
firebase init hosting

# Deploy
firebase deploy
```

---

## 🐛 การแก้ไขปัญหา

### ปัญหาที่พบบ่อย

#### 1. ไฟล์ไม่โหลด
```bash
# ✅ วิธีแก้
# ใช้ HTTP server แทนการเปิดไฟล์โดยตรง
python -m http.server 8000
# หรือ
npx serve .
```

#### 2. API ไม่ทำงาน
```javascript
// ❌ ปัญหา: CORS error
fetch('https://api.openai.com/v1/chat/completions')

// ✅ วิธีแก้: ใช้ proxy หรือ backend
// หรือใช้ browser extension สำหรับ development
```

#### 3. Excel ไม่อ่านได้
```javascript
// ❌ ปัญหา: ไม่ได้โหลด SheetJS
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

// ✅ วิธีแก้: เพิ่ม script tag ก่อน JavaScript
```

#### 4. ข้อมูลหาย
```javascript
// ❌ ปัญหา: localStorage เต็ม
// ✅ วิธีแก้: เพิ่มการตรวจสอบ
try {
    localStorage.setItem('data', JSON.stringify(data));
} catch (e) {
    console.error('Storage full:', e);
    // จัดการข้อมูลเก่า
}
```

### Debug Tools
```javascript
// เปิด Developer Console
console.log('Debug info:', data);

// ตรวจสอบ localStorage
console.log('Stored data:', localStorage.getItem('lotteryHistory'));

// ตรวจสอบ API response
fetch(url).then(r => r.json()).then(console.log);
```

---

## 📚 Resources และเอกสารอ้างอิง

### Documentation
- [MDN Web Docs](https://developer.mozilla.org/)
- [Vite Guide](https://vitejs.dev/guide/)
- [Google AI Studio](https://makersuite.google.com/)
- [OpenAI API Docs](https://platform.openai.com/docs)

### Libraries ที่ใช้
- [SheetJS](https://sheetjs.com/) - Excel file handling
- [Chart.js](https://www.chartjs.org/) - Data visualization
- [Prettier](https://prettier.io/) - Code formatting
- [ESLint](https://eslint.org/) - Code linting

### แหล่งเรียนรู้
- [JavaScript.info](https://javascript.info/)
- [CSS-Tricks](https://css-tricks.com/)
- [Web.dev](https://web.dev/)

---

## 🤝 การมีส่วนร่วม (Contributing)

### การส่ง Pull Request
1. Fork repository
2. สร้าง feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. เปิด Pull Request

### Code Style
```javascript
// ใช้ camelCase สำหรับตัวแปร
const lotteryNumber = 123456;

// ใช้ PascalCase สำหรับ Class
class LotteryGenerator {
    // ...
}

// ใช้ kebab-case สำหรับ CSS class
.lottery-card {
    /* ... */
}
```

---

## 📄 License

MIT License - ใช้งานได้อย่างอิสระสำหรับโปรเจคส่วนตัวและเชิงพาณิชย์

---

## 📞 ติดต่อและสนับสนุน

- 💬 **Issues**: [GitHub Issues](https://github.com/yourusername/lottery-ai/issues)
- 📧 **Email**: your.email@example.com
- 💻 **Website**: https://your-website.com

---

## 🎯 Roadmap

### Version 2.0 (Q2 2025)
- [ ] Mobile App (React Native)
- [ ] Backend API (Node.js)
- [ ] User Authentication
- [ ] Premium Features

### Version 3.0 (Q4 2025)
- [ ] Machine Learning Models
- [ ] Real-time Data Sync
- [ ] Social Features
- [ ] Advanced Analytics

---

**Made with ❤️ by Thai Developers for Thai People**