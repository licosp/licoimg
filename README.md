# 🖼️ Web-based Image Viewer

> 🤖 **AI-Managed Repository**  
> This repository is primarily edited and managed by an AI agent named **Ai**, working in collaboration with human oversight.

---

A **premium**, **client-side** web-based image viewer that prioritizes privacy and modern design aesthetics. Built with Vite and Vanilla JavaScript, this application processes all images directly in your browser—no server uploads required.

---

## 🌐 Live Demo

**Experience it now**: [licosp.github.io/licoimg](https://licosp.github.io/licoimg/)

---

## 📦 Repository Structure (Monorepo)

This repository follows a **monorepo structure**, managing multiple interconnected projects:

| Component | Description |
|-----------|-------------|
| 🖼️ **Main Project** | Web-based Image Viewer application |
| 🤖 **AI Agent System** | `.agent/` directory with workflows, rules, and localized prompts |

---

## ✨ Features

### 🎨 Application Features

- **🖱️ Drag & Drop**  
  Effortlessly load images by dragging them onto the page

- **🖼️ Gallery View**  
  Browse your images in a beautiful, responsive grid layout

- **🔍 Lightbox Mode**  
  Detailed viewing experience with smooth zoom and pan capabilities

- **🔒 Privacy Focused**  
  All image processing happens locally in your browser  
  *Zero uploads. Zero tracking. Complete privacy.*

### ⚙️ Technical Features

- ✅ **Client-side only** operation
- ✅ Modern **CSS Variables** for theming
- ✅ Fully **responsive** design
- ✅ **Prettier** code formatting

---

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| **Vite** | Build tool and development server |
| **Vanilla JavaScript** | Core application logic |
| **CSS Variables** | Dynamic styling and theming |
| **GitHub Pages** | Deployment (from `docs/` folder) |
| **Prettier** | Code formatting and consistency |

---

## 🤖 AI Agent System

The `.agent/` directory powers the **AI-human collaborative workflow**:

### 📂 Directory Structure

```
.agent/
├── rules/               # Agent code of conduct and conventions
├── workflows/           # Automated workflows (commit, localization, etc.)
├── locales/ja/          # Japanese translations
└── .draft/              # Working drafts and planning documents
```

### 🔄 Development Workflow

Our development process follows a structured **AI-human collaboration model**:

1. **👤 Human** → Defines requirements and provides feedback
2. **🤖 AI Agent (Ai)** → Implements changes following defined rules
3. **🔄 Review** → Changes are reviewed using structured workflows
4. **✅ Commit** → Approved changes are committed with atomic, descriptive messages

### 📋 Key Workflows

- **`commit.md`** - Structured commit process with atomic changesets
- **`localize-prompts.md`** - English → Japanese translation workflow
- **`refine-instructions.md`** - Instruction clarity improvement
- **`beautify-markdown.md`** - Document beautification for human readability

---

## 🚀 Getting Started

### Prerequisites

- **Node.js** (v14 or higher)
- **npm** or **yarn**

### Installation & Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/licosp/licoimg.git
   cd licoimg
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm run dev
   ```
   
   Open your browser at the URL displayed in the terminal (usually `http://localhost:5173`)

4. **Build for production**
   ```bash
   npm run build
   ```
   
   Production files will be generated in the `docs/` directory

---

## 👤 Developer

**licosp**

- 🌐 **GitHub**: [github.com/licosp](https://github.com/licosp)
- 🐦 **X (Twitter)**: [@licospx](https://x.com/licospx)

---

## 📄 License

This project is open source. Please check the repository for license details.

---

<div align="center">

**Made with ❤️ by AI-Human Collaboration**

*Powered by Ai 🤖 × Human Creativity 👤*

</div>
