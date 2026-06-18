# n8n Manager — One-Click Install & Run Kit (English)

> A friendly Windows tool that lets even **complete beginners** install and launch n8n with **two mouse clicks and one key press**.

🌐 **한국어 버전:** [README.md](./README.md)
📖 **Detailed manual:** [GUIDE.en.md](./GUIDE.en.md) (English) · [GUIDE.md](./GUIDE.md) (한국어)

> ℹ️ This kit is built **Korean-first** (the menu inside the tool is in Korean). This English README explains exactly what each step and menu does so non-Korean speakers can use it too.

---

## 📑 Table of Contents

1. [What is this?](#-what-is-this)
2. [⚡ Quick Start (3 steps)](#-quick-start-3-steps)
3. [📋 Prerequisites / Required programs](#-prerequisites--required-programs)
4. [💻 Supported environment](#-supported-environment)
5. [⬇️ How to download](#️-how-to-download)
6. [🚀 How to install](#-how-to-install)
7. [🔵 If a blue warning appears on first run (must read)](#-if-a-blue-warning-appears-on-first-run-must-read)
8. [▶️ How to run](#️-how-to-run)
9. [🧭 Menu at a glance](#-menu-at-a-glance)
10. [🔒 Safety & privacy at a glance](#-safety--privacy-at-a-glance)
11. [🗂️ File & document locations](#️-file--document-locations)
12. [❓ If something goes wrong](#-if-something-goes-wrong)
13. [📜 License · Copyright · Commercial use](#-license--copyright--commercial-use)
14. [⚠️ Disclaimer (please read)](#️-disclaimer-please-read)

---

## 🟢 What is this?

- **n8n** is a tool that automatically connects different internet services (email, messengers, Google Sheets, etc.) to **do repetitive tasks for you**.
  - e.g. "When an email arrives, send a phone notification", "Collect the news every morning".
- **This kit (the black-window tool)** is a Korean-language "remote control" that helps you **easily install, run, and manage** n8n.
  - Don't worry if lots of text scrolls by in the black window — that's normal, not an error.

> One-line summary: **Double-click `n8n_Manager_One-Click_Install-Run.bat`, then press one number key on screen.**

---

## ⚡ Quick Start (3 steps)

1. **Open the folder** you downloaded. Find the file `n8n_Manager_One-Click_Install-Run.bat`.
2. **Double-click that file.** A black window shows a Korean menu.
   - If a **blue warning window** (`Windows protected your PC`) appears, don't panic — see 👉 [section 7](#-if-a-blue-warning-appears-on-first-run-must-read). (You only handle this once.)
3. **Press the `0` key once.** (`0` = "처음이세요?" / "First time?") It installs and then launches automatically.

> Shortly after, your web browser opens by itself and shows a **"Set up owner account"** screen. Just choose your own email and password to create the account. (This account is used **only on your own computer**.)

The first install may take **1–3 minutes** depending on your internet speed. If text seems frozen, please wait.

---

## 📋 Prerequisites / Required programs

| Item | Required? | Notes |
|---|---|---|
| **Windows PC** | ✅ Required | Windows 10 or 11 |
| **Internet connection** | ✅ Required | Needed for install/update |
| **Node.js** | ✅ Required | The "base" program n8n runs on. **If missing, this kit installs it for you automatically.** |
| **n8n** | ✅ Required | Installed automatically by menu `[0]` or `[1]`. |

> ✅ **Nothing to memorize.** If Node.js is missing, the kit guides and installs it. Just press `[0]`.
> 💾 **Disk space:** About **0.5–1 GB** of free space is enough for Node.js + n8n.

---

## 💻 Supported environment

- **OS:** Windows 10 / Windows 11 (built for Korean Windows; works on English Windows too)
- **Hardware:** A normal office PC is enough (no special graphics card needed)
- **Tested on:** Windows 11, n8n version 2.x
- **Mac · phone:** This `.bat` tool is **Windows-only** (it will not run on Mac or phones).

---

## ⬇️ How to download

This kit consists of **one file (.bat)** and **a few documents**. How you obtain it depends on where it was shared.

- **If you got a ZIP file:** right-click → "Extract All" → open the extracted folder.
- **If from a site like GitHub:** green `Code` button → `Download ZIP` → extract as above.
- **If you got the whole folder:** just use it as is.

> 📌 **Important:** Keep `n8n_Manager_One-Click_Install-Run.bat` and `사용설명서.txt` (the guide) **in the same folder**. (Menu `[9]` opens the guide from the same folder.)

### If a file downloaded from the internet is "blocked" (one time)

Windows sometimes **locks** files received from the internet or messengers for safety. Unlock it like this:

1. Right-click `n8n_Manager_One-Click_Install-Run.bat` → **"Properties"**.
2. If you see a small **"Unblock"** checkbox at the bottom, **tick it**.
3. Click **"OK"**. (If the checkbox isn't there, it's already unlocked — just move on.)

---

## 🚀 How to install

There are **two ways**. For first-timers, way 1 is recommended.

### Way 1) Automatic (recommended) — one `[0]`
1. Double-click `n8n_Manager_One-Click_Install-Run.bat`
2. Press `0`
3. If Node.js is missing, an auto-install prompt appears. Follow the on-screen guidance.
4. When install finishes, it **launches automatically**.

### Way 2) Manual — `[1]` install only
1. Double-click the `.bat`
2. Press `1` → installs n8n only.
3. Later, press `[3]` to run it.

> ⚠️ **If you just installed Node.js**, **fully close** the black window and **re-run** the `.bat`. (This lets the computer recognize Node.js anew.)

---

## 🔵 If a blue warning appears on first run (must read)

The first time you double-click a `.bat` downloaded from the internet, a large blue window may appear:

> **"Windows protected your PC"** / "Windows의 PC 보호"

This does **not** mean a virus — it's Windows' safety step for "a file it hasn't seen before". Proceed like this:

1. In the blue window, click the small text **"More info"**.
2. A **"Run anyway"** button appears below — click it.
3. The black window (menu) then opens normally. (This is usually needed **only the first time**.)

> 🛡️ **If antivirus (security software) deletes or blocks the `.bat`:** briefly turn off the antivirus, or add this file to its "exception/allow" list, then run it again. If the file didn't come from a stranger, it is safe. (This kit only downloads n8n from the internet to install it; it does not touch your computer otherwise.)

---

## ▶️ How to run

1. Double-click `n8n_Manager_One-Click_Install-Run.bat`
2. Press `3` ("Start n8n")
3. The browser opens by itself shortly. If not, type into the address bar: **http://localhost:5678**

**How to stop:** In the black window where n8n is running, press **`Ctrl` + `C`** together, and when "종료하시겠습니까(Y/N)?" ("Terminate? Y/N") appears, press `Y`.

> For detailed screen explanations, first login, and your first workflow, see 👉 [GUIDE.en.md](./GUIDE.en.md).

---

## 🧭 Menu at a glance

In the black window, just **press one number key** (no Enter needed).

| Key | Menu (Korean) | What it does |
|---|---|---|
| `0` | 처음이세요? (First time?) | Install + run in one go (recommended first) |
| `1` | 설치하기 (Install) | Downloads n8n onto your computer |
| `2` | 업데이트하기 (Update) | Updates n8n to the latest version |
| `3` | 시작하기 5678 (Start) | Starts n8n (use this normally) |
| `4` | 시작하기 (Start, custom port) | Starts n8n on a port number you choose |
| `5` | 백업 (Backup / open folder) | Safely copies your work |
| `6` | 문제 해결 (Troubleshoot) | Auto-checks what's wrong |
| `7` | 삭제하기 (Uninstall) | Removes n8n (keep work / full delete) |
| `8` | 끝내기 (Exit) | Closes this menu window |
| `9` | 사용설명서 보기 (View guide) | Opens the text guide in Notepad |

---

## 🔒 Safety & privacy at a glance

The five things first-timers ask about most, kept short.

| Question | Answer |
|---|---|
| 💰 **Does it cost money?** | Running n8n **on your own computer is free**. (Different from the company's paid cloud service.) |
| 🌐 **Is my data sent anywhere?** | No. This tool and n8n run **only on your computer**. Your account and work are not transmitted externally. |
| 📶 **Do I always need internet?** | Only for **install/update**. While running, it depends on the services you connect. |
| 🔁 **Does it auto-start when I boot the PC?** | No. n8n runs **only when you start it with `[3]`** (no auto-start). |
| 🔑 **What if I forget my password?** | The account lives only on your computer. If lost, you can delete the work folder (`.n8n`) and create a new one — but **your automations are erased too**, so back up with `[5]` first. |

---

## 🗂️ File & document locations

### Kit files (inside the folder you downloaded)
| File | Role |
|---|---|
| `n8n_Manager_One-Click_Install-Run.bat` | Main program (double-click this) |
| `사용설명서.txt` | Short Korean guide opened by `[9]` (Notepad) |
| `README.md` / `README.en.md` | Korean / English overview (this document) |
| `GUIDE.md` / `GUIDE.en.md` | Korean / English detailed manual |
| `README.pdf` · `GUIDE.pdf`, etc. | PDF versions (identical content) |
| `LICENSE` / `NOTICE` | License & copyright info |

### Folders n8n creates (automatically)
| Location | Contents |
|---|---|
| `C:\Users\(yourname)\.n8n` | **Where your work (automations) is stored.** Keep it safe. |
| `C:\Users\(yourname)\n8n_backup_(date)` | A copy made when you press `[5]` Backup |
| `(kit folder)\n8n_진단결과.txt` | The check result saved when you press `[6]` Troubleshoot |

---

## ❓ If something goes wrong

1. **First press `[6]` Troubleshoot.** It auto-checks Node.js / n8n / internet and even tells you **"what to do next"**.
2. If a **blue warning** (`Windows protected your PC`) blocks it → see [section 7](#-if-a-blue-warning-appears-on-first-run-must-read) ("More info → Run anyway").
3. If still stuck, **right-click the `.bat` → "Run as administrator"** and try again.
4. Send the check-result file (`n8n_진단결과.txt`) to whoever helps you — it speeds up the fix.

> For symptom-by-symptom fixes (browser won't open, port in use, forgot password, broken Korean text, etc.), see the "Troubleshooting" chapter in 👉 [GUIDE.en.md](./GUIDE.en.md).

---

## 📜 License · Copyright · Commercial use

> ⚖️ **Please read this. There are two different licenses involved.**

### 1) License of this kit (the installer tool & docs)
- The **original files of this kit** (`.bat`, README, GUIDE, etc.) are provided under the **Apache License 2.0** (see the [LICENSE](./LICENSE) file).
- Copyright: **Copyright 2026 SoDam AI Studio** (see [NOTICE](./NOTICE)).
- You may freely use, modify, and redistribute them, but you must **keep the original copyright notice and the LICENSE/NOTICE files** (and if you distribute a modified version, **state that you changed it**).

### 2) License of n8n itself (★ very important)
- This kit only **downloads and installs n8n from the internet (npm)**; it does **not** bundle/redistribute the n8n program.
- **n8n uses the "Sustainable Use License" (fair-code).** It is **NOT a standard OSI-approved open-source license.** Some components may be covered by the separate **n8n Enterprise License**.
- **Allowed:** personal use, **internal business use**, self-hosting (running on your own computer), viewing & modifying source code.
- **Restricted (regarding commercial resale):**
  - Selling n8n **as a service** to third parties
  - Offering n8n under a **different name (white-label)**
  - **Redistributing n8n as the back-end** of a commercial product
- If you need a **commercial use** that falls under those restrictions, you need **n8n's separate permission or an Enterprise License**.
- Official sources (please **verify directly** before any commercial use — license terms may change):
  - Sustainable Use License: <https://docs.n8n.io/sustainable-use-license/>
  - License text: <https://github.com/n8n-io/n8n/blob/master/LICENSE.md>
  - Pricing / Enterprise: <https://n8n.io/pricing/>

### 3) Trademark
- **"n8n"** is a trademark of **n8n GmbH**; **"Node.js"** is a trademark of the OpenJS Foundation; **"Windows"** is a trademark of Microsoft.
- This kit is **not an official n8n product** and has **no sponsorship, affiliation, or endorsement** from n8n GmbH (it is an unofficial helper tool). See [NOTICE](./NOTICE).

> 🔎 **Plain summary:** "Installing it to use for your own work / your company's internal work" is fine. "Selling n8n to others as a service or under another brand" requires n8n's permission.

---

## ⚠️ Disclaimer (please read)

- This kit is provided **"as-is" with no warranty of any kind.** You are **solely responsible** for any results of using it.
- This tool runs **only on your own computer**. It does not send your data anywhere.
- **Passwords and your work are your responsibility.** Use `[5]` Backup for important work, and **always back up before `[7]` full delete** (full delete cannot be undone).
- Never run a `.bat` file sent by someone you don't trust.

---

*The content of this document (README.en.md) and README.en.pdf is identical. The PDF is generated directly from this .md file.*
