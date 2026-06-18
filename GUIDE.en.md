# n8n Manager — Detailed User Guide (English)

> This document is written step-by-step in plain language so that even people **new to computers, phones, electronics, or IT** can follow it. Technical terms are explained in simple words.

🌐 **한국어:** [GUIDE.md](./GUIDE.md) ·  📄 **Short overview:** [README.en.md](./README.en.md)

> ℹ️ The tool's on-screen menu is in **Korean**. This guide tells you exactly which key does what, so non-Korean speakers can use it confidently.

---

## 📑 Table of Contents

0. [How to read this](#0-how-to-read-this)
1. [What are n8n and a workflow?](#1-what-are-n8n-and-a-workflow)
2. [Prerequisites in detail](#2-prerequisites-in-detail)
3. [Download & install (step by step)](#3-download--install-step-by-step)
4. [How to run + every menu 0–9](#4-how-to-run--every-menu-09)
5. [How to use it (first screen, first workflow)](#5-how-to-use-it-first-screen-first-workflow)
6. [Stopping / restarting](#6-stopping--restarting)
7. [Backup / restore](#7-backup--restore)
8. [Uninstalling](#8-uninstalling)
9. [Command reference (what each does)](#9-command-reference-what-each-does)
10. [Troubleshooting (by symptom)](#10-troubleshooting-by-symptom)
11. [Frequently asked questions (Q&A)](#11-frequently-asked-questions-qa)
12. [File & document locations](#12-file--document-locations)
13. [License · Copyright · Commercial use](#13-license--copyright--commercial-use)
14. [Safety & disclaimer](#14-safety--disclaimer)

---

## 0. How to read this

- **In a hurry?** Just read "Quick Start" in [README.en.md](./README.en.md).
- Use this document like a **dictionary you consult when stuck**. You don't need to read it cover to cover.
- The scrolling text in the black window **looks scary but is normal** — it's just n8n working.

---

## 1. What are n8n and a workflow?

- **n8n:** a tool that automatically connects different internet services.
- **Workflow:** an **automatic rule** that says "when this happens → do that".
  - Example 1) "When a new Gmail arrives → send a Telegram notification"
  - Example 2) "Every morning at 9 → collect headlines from a news site → save them to Google Sheets"
- In short, it makes the **computer do repetitive manual work** for you.
- You build workflows by **connecting visual blocks with lines**, so you don't need to code.

---

## 2. Prerequisites in detail

### 2-1. A Windows computer
- Windows 10 or 11 works. No special hardware needed.
- About **0.5–1 GB** of free disk space is enough.
- This `.bat` tool is **Windows-only** (it will not run on Mac or phones).

### 2-2. Internet connection
- **Required for install/update** (programs are downloaded from the internet).
- After install, building automations may need internet depending on the services you connect.

### 2-3. Node.js
- **Node.js** is the **base program** n8n runs on (n8n runs on top of Node.js).
- **You don't need it ready — this kit installs it for you.**
  - If your PC has `winget` (Windows' auto-installer), it tries an **automatic install**.
  - If not, it opens the **official site (nodejs.org)** and guides you to install it.
- If installing manually: click the big **"LTS"** button on the site, run the downloaded file, and keep pressing **"Next"**.

> ⚠️ **Right after installing Node.js**, **fully close** any open black window and **re-run** the `.bat`. (This lets Node.js be recognized.)

---

## 3. Download & install (step by step)

### 3-1. Download
1. If you received a **ZIP file**: right-click → **"Extract All"**.
2. Open the extracted folder. You should see `n8n_Manager_One-Click_Install-Run.bat`.
3. Make sure `사용설명서.txt` (the guide) is in the **same folder**.

> 💡 A folder with a **Korean path** (e.g., Desktop) works fine. If you hit problems, move it to a short English path like `C:\n8n`.

### 3-2. "Unblock" a file downloaded from the internet (once, if needed)
Windows sometimes locks files received from the internet/messengers for safety.
1. Right-click the `.bat` → **"Properties"**.
2. If you see an **"Unblock"** checkbox at the bottom, **tick it**.
3. Click **"OK"**. (If it isn't there, it's already unlocked — just move on.)

### 3-3. Install (automatic, recommended)
1. **Double-click** `n8n_Manager_One-Click_Install-Run.bat`.
2. (If a **blue warning** appears on first run → see 3-4 below.)
3. When the Korean menu appears, press **`0`** once.
4. Follow the on-screen guidance.
   - If Node.js is present → it installs n8n and **launches automatically**.
   - If Node.js is missing → it tries auto-install or opens the install site (see 2-3).
5. You succeeded when you see **"[완료] 설치가 끝났습니다!"** ("Install complete!").

### 3-4. If the "Windows protected your PC" blue warning appears (first time only)
- The first time you open an internet-downloaded `.bat`, a large blue window (**"Windows protected your PC"**) may appear.
- It does **not** mean a virus — it's Windows checking a file it hasn't seen before.
- How to handle: click **"More info"**, then click the **"Run anyway"** button. → The black window opens normally.
- Usually needed **only the first time**.

### 3-5. When "Administrator rights" are needed
- If install keeps failing, **right-click the `.bat` → "Run as administrator"**.
- Antivirus/security software may block it or delete the `.bat`. Temporarily disable it or add an "exception/allow", then retry.

---

## 4. How to run + every menu 0–9

In the black window, **press one number key** to select instantly (no Enter needed; invalid keys won't register, so it's safe).

### `[0]` First time?
- Does install + run **in one go**. **Most recommended for first-timers.**

### `[1]` Install
- Installs n8n only. (Guides you to Node.js first if missing.)

### `[2]` Update
- Updates the installed n8n to the **latest version**. Needs internet.

### `[3]` Start (port 5678)
- **Starts** n8n. The most-used menu.
- After it starts, the **browser opens automatically**. If not, type `http://localhost:5678`.
- A **"port"** is the **number** n8n uses. The default is **5678**.
- If 5678 is already in use, the screen lets you choose **① keep 5678 / ② start on another number (recommended) / ③ back to menu**.

### `[4]` Start (custom port)
- Start on a port number you choose (e.g., `8080`).
- If unsure, just press **Enter** — it uses the default 5678.
- Non-numbers or values above 65535 automatically revert to 5678.

### `[5]` Backup / open folder
- `[1]` Back up now: saves your work as a **dated copy**.
- `[2]` Open folder: opens the work folder (`.n8n`) in Explorer.
- `[3]` Go back.

### `[6]` Troubleshoot (auto-check)
- Checks Node.js / npm / n8n / internet at once. (Internet is checked by pinging `8.8.8.8`.)
- Shows a **"what to do next"** recommendation.
- Also saves the result to **`n8n_진단결과.txt`** (attach it when asking for help).

### `[7]` Uninstall
- `[1]` Remove program only: your work is **kept**. (Recommended)
- `[2]` Full delete incl. data: your work is **also erased**. **Cannot be undone.** (Double-confirmed + backup advised)
- `[3]` Cancel.

### `[8]` Exit
- Closes this menu window. (If n8n is running, stop it first — see chapter 6.)

### `[9]` View guide
- Opens `사용설명서.txt` from the same folder in Notepad.

---

## 5. How to use it (first screen, first workflow)

### 5-1. First screen — "Set up owner account"
1. When you start n8n with `[3]`, the browser shows a **"Set up owner account"** screen.
2. **Choose your own email and password** and enter them.
   - This account is used **only on your computer**, so any email is fine.
   - But **write it down so you don't forget** (see password-recovery in chapter 10).
3. After creating it, the n8n editor appears. Now you can build automations.

### 5-2. If a "firewall" window appears
- If a **"Windows Security Alert"** appears, click **"Allow access"** (this allows local communication on your own PC).

### 5-3. Build your first workflow — a very simple example
1. In the editor, click **`+`** (new workflow).
2. Pick a starting block (trigger) — e.g., "Manual Trigger".
3. Connect the next block with **`+`** — e.g., a simple note/notification.
4. Run it once with the **Execute / Test** button at the top.
5. If it works, press **Save**. → Saved automations are stored in the `.n8n` folder.

> At first, practice with one "Manual Trigger → simple action". Once comfortable, expand to email/messenger/sheet connections.

---

## 6. Stopping / restarting

### 6-1. Stopping (important)
- While n8n runs, text keeps scrolling in the black window.
- To stop, in **that black window** press **`Ctrl` + `C`** together.
- When **"종료하시겠습니까(Y/N)?"** ("Terminate? Y/N") appears, press **`Y`** and Enter.

### 6-2. Can I just close the black window?
- Closing it stops n8n too. It's usually fine, but the `Ctrl + C` method above is cleaner.

### 6-3. Restarting
- Double-click the `.bat` again → press `[3]`.
- Note: n8n **does not auto-start when you boot the PC.** Start it with `[3]` each time you want to use it.

---

## 7. Backup / restore

### 7-1. Backup (protect your work)
1. Menu `[5]` → `[1]` Back up now.
2. A copy is created at `C:\Users\(yourname)\n8n_backup_(date)`.
3. Move that folder to a **USB drive or cloud** for extra safety.

### 7-2. Restore (rolling back a backup)
- The original work folder is `C:\Users\(yourname)\.n8n`.
- To restore: with n8n stopped, overwrite the `.n8n` folder with the contents of your backup folder.
- (If unsure, keep the backup folder and ask for help rather than deleting anything.)

---

## 8. Uninstalling

1. Menu `[7]` Uninstall.
2. **Choose one of two:**
   - `[1]` **Remove program only** — your work is kept. (Recommended)
   - `[2]` **Full delete incl. data** — your work is also erased and **cannot be recovered**.
3. `[2]` asks for **confirmation twice** for safety. Always do `[5]` Backup first.

> Note: after "Remove program only", the work folder (`.n8n`) remains. If you reinstall later, you can pick up where you left off.

---

## 9. Command reference (what each does)

> These are commands the kit runs **for you, internally**. **You don't need to type them.** This is for reference only.

| Command | What it does |
|---|---|
| `npm install -g n8n` | Installs n8n. |
| `npm update -g n8n` | Updates n8n to the latest. |
| `npm uninstall -g n8n` | Removes n8n. |
| `n8n start` | Starts n8n on the default port (5678). |
| `n8n start --port=8080` | Starts n8n on a chosen port (e.g., 8080). |
| `n8n --version` | Shows the installed n8n version. |
| `node --version` | Shows the Node.js version. |
| `npm --version` | Shows the npm (installer tool) version. |
| `winget install OpenJS.NodeJS.LTS` | (When Node.js is missing) auto-installs Node.js. |

- **npm** is the **package-install tool** that comes with Node.js.
- `-g` means "install so it can be used across the whole computer".

---

## 10. Troubleshooting (by symptom)

> Always press menu `[6]` Troubleshoot first for an auto-check. Below are extra fixes per symptom.

### 🔵 A "blue warning" appears on first run
- It's the **"Windows protected your PC"** window — not a virus alert, just a check for a file it hasn't seen before.
- Click **"More info"** → **"Run anyway"** and it opens normally. (First time only.)

### 🔴 Antivirus deletes or blocks the `.bat`
- Security software may be suspicious of a `.bat` it hasn't seen before.
- Briefly turn off the antivirus, or add this file to its **"exception/allow"** list, then run again.
- If the source is trustworthy, it's safe. (This kit only downloads n8n from the internet to install it.)

### 🔴 "Node.js is missing / not recognized"
- Press menu `[1]` (or `[0]`) for Node.js guidance.
- If you just installed it, **fully close the black window and re-run**.

### 🔴 Install keeps failing
1. Check the internet connection.
2. **Run the `.bat` as administrator.**
3. Check whether antivirus/firewall is blocking (disable briefly or allow an exception).
4. Company/school networks may block it. Try on home internet.

### 🔴 The browser won't open
- Type into the address bar: `http://localhost:5678` (or your custom port).
- Wait 5–10 seconds, then refresh with **F5**.

### 🔴 "Port already in use"
- n8n may already be running → type `http://localhost:5678`.
- If another program uses it → start on a different number (e.g., 8080) via menu `[4]`.

### 🔴 "This page can't be reached"
- n8n may still be starting. Wait 5–10 seconds, then **F5**.
- If still failing, check the black window for red text (errors) and attach the `[6]` result file when asking for help.

### 🔴 I forgot my password
- The n8n account exists **only on your computer**.
- Fix: delete the work folder (`.n8n`) and start n8n again to create a new account.
- ⚠️ But **your automations are erased too.** Back up with `[5]` first if they matter.

### 🔴 Korean text looks broken (black window)
- This `.bat` is saved for Korean Windows. **Never open it in Notepad and re-save it** (that breaks the Korean). To read it, use menu `[9]` or `사용설명서.txt`.

### 🟡 Still not resolved
- Send the `n8n_진단결과.txt` file from menu `[6]` and ask for help. (Install failures are usually internet, permissions, or antivirus.)

---

## 11. Frequently asked questions (Q&A)

**Q. The English/text in the black window is scary. Is something wrong?**
A. No. It's just n8n working. Leave it as is.

**Q. Does it cost money?**
A. Running n8n **on your own computer is free**. (It's different from n8n's paid cloud service.)

**Q. Do I always need internet?**
A. Needed for **install and update**. While running, it depends on the services you connect.

**Q. Is my data (account/work) sent anywhere?**
A. No. This tool and n8n run **only on your computer**. Your work is stored only in the `.n8n` folder.

**Q. Does n8n auto-start when I boot the PC?**
A. No. It runs **only when you start it with `[3]`** (no auto-start at Windows boot).

**Q. Can I use it on another computer?**
A. Yes — install it separately on each PC. To move your work, copy the `[5]` backup folder into the `.n8n` location on the new PC.

**Q. I want to remove it.**
A. Press menu `[7]`. You can keep your work and remove only the program, or delete everything. (Back up with `[5]` before deleting everything.)

**Q. I forgot my password.**
A. The n8n account is on your computer only, so delete the work folder (`.n8n`) and create it again. But your automations are erased too, so back up first if they matter.

---

## 12. File & document locations

### Inside the kit folder (your downloaded folder)
- `n8n_Manager_One-Click_Install-Run.bat` — main program
- `사용설명서.txt` — short Korean guide (opened by `[9]`)
- `README.md` / `README.en.md` — overview (KR / EN)
- `GUIDE.md` / `GUIDE.en.md` — detailed guide (KR / EN, this document)
- `README.pdf` / `README.en.pdf` / `GUIDE.pdf` / `GUIDE.en.pdf` — PDF versions (identical content)
- `LICENSE` — this kit's license (Apache-2.0)
- `NOTICE` — copyright, trademark, non-affiliation notice

### Locations n8n creates automatically
- `C:\Users\(yourname)\.n8n` — **your work storage** (most important)
- `C:\Users\(yourname)\n8n_backup_(date)` — `[5]` backup copies
- `(kit folder)\n8n_진단결과.txt` — `[6]` check result

---

## 13. License · Copyright · Commercial use

> ⚖️ **There are two different licenses. Always verify before any commercial use.**

### 13-1. This kit's license
- The kit's original files are under **Apache License 2.0** ([LICENSE](./LICENSE)).
- Copyright: **Copyright 2026 SoDam AI Studio** ([NOTICE](./NOTICE)).
- Free to use/modify/redistribute, but you must **keep the copyright notice and LICENSE/NOTICE** (and **state changes** if you distribute a modified version).

### 13-2. n8n's own license (★ important)
- This kit only **downloads and installs n8n from npm**; it does not bundle/redistribute n8n.
- **n8n = Sustainable Use License (fair-code)** — **NOT standard OSI open source.** Some components may be covered by the separate **n8n Enterprise License**.
- **Allowed:** personal use, **internal business use**, self-hosting, viewing/modifying source.
- **Restricted (commercial resale):**
  - Selling n8n **as a service** to third parties
  - Offering n8n under a **different name (white-label)**
  - **Redistributing n8n as the back-end** of a commercial product
- Such commercial uses require **n8n's separate permission / an Enterprise License**.
- Official sources (**verify directly** before any commercial use — terms may change):
  - <https://docs.n8n.io/sustainable-use-license/>
  - <https://github.com/n8n-io/n8n/blob/master/LICENSE.md>
  - <https://n8n.io/pricing/>

### 13-3. Trademark
- **"n8n"** is a trademark of **n8n GmbH**; **"Node.js"** of the OpenJS Foundation; **"Windows"** of Microsoft. This kit is an **unofficial helper with no official, affiliate, or sponsorship relationship** ([NOTICE](./NOTICE)).

> 🔎 **Plain:** Using it yourself / for your company internally is OK. Selling n8n to others or under another brand needs n8n's permission.

---

## 14. Safety & disclaimer

- This kit is provided **"as-is" with no warranty**. You are **solely responsible** for the results of using it.
- It runs **only on your own computer** and does not send your data anywhere.
- **Passwords and your work are your responsibility.** Back up important work with `[5]`, and always back up before `[7]` full delete.
- Never run a `.bat` sent by someone you don't trust.
- Privacy: your n8n account info (email/password) is stored **only in the local `.n8n` folder** on your computer. Nothing is sent externally.

---

*The content of this document (GUIDE.en.md) and GUIDE.en.pdf is identical. The PDF is generated directly from this .md file.*
