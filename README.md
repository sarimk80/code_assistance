# 🧠 MacAI Clipboard Assistant

A macOS application that supercharges your clipboard using AI!  
Whether you're copying non-English text or code snippets, this app steps in to help—instantly.


<img width="513" alt="Screenshot 2025-04-17 at 12 05 37 PM" src="https://github.com/user-attachments/assets/8960c1d0-15c0-4b48-8c59-8769400a2306" />
<img width="509" alt="Screenshot 2025-04-17 at 12 07 14 PM" src="https://github.com/user-attachments/assets/19c974a3-b909-4c63-9df8-0cb40e5cae0f" />


## ✨ Features

- 🔤 **AI Translation**: Automatically detects non-English text in your clipboard, opens a window, and translates it into English using [Ollama](https://ollama.com/).
- 🧑‍💻 **Code Enhancement**: Copies a piece of code? The app improves it and adds meaningful comments to boost readability and maintainability.
- ⚡ **Fast & Lightweight**: Built with Swift (macOS app) and FastAPI (Python backend) for seamless real-time AI interaction.
- 🧠 **AI-Powered**: Utilizes Ollama's local LLMs for fast, private, and offline-friendly processing.


## 🚀 How It Works

1. You copy some text.
2. The app checks if it's:
   - 🌍 A non-English sentence → Translates it.
   - 🧾 A code snippet → Enhances it with improvements and comments.
3. A new window pops up showing the AI-generated result.


## 🛠️ Tech Stack

- **Frontend (macOS App)**: SwiftUI
- **Backend**: Python, FastAPI
- **AI Model**: [Ollama](https://ollama.com/) (LLM for translation and code understanding)
- **Clipboard Monitoring**: NSPasteboard APIs
