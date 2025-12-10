# iPhone Shop — deployment options

This folder contains a simple static website `iphone-shop.html` (and product pages). Below are a few simple ways to make the site available even after you close VS Code.

Two recommended approaches:

1) Public, persistent hosting (recommended)
- GitHub Pages (free for static sites) — easiest for a single static site.
- Netlify / Vercel — easier drag-and-drop and CI-based deploys.

2) Local hosting (only accessible on your machine or LAN)
- Start a background HTTP server on your Windows machine so the site runs even when VS Code is closed. If you want the site accessible from the internet, use `ngrok` (temporary public URL) or configure router port forwarding (advanced / less secure).

---

Quick steps: GitHub Pages (recommended)

1. Create a GitHub repository (use https://github.com/new).
2. In this folder init a git repo and push:

```powershell
cd "C:\Users\Admin\Desktop\Нова папка"
git init
git add .
git commit -m "Initial iPhone shop site"
# create remote repo on GitHub (copy the 'git remote add' line from GitHub UI)
# then push, e.g.:
git remote add origin https://github.com/<your-username>/<repo>.git
git branch -M main
git push -u origin main
```

3. In GitHub repo settings -> Pages -> choose `main` branch root (`/`) and save. After a minute your site will be available at `https://<your-username>.github.io/<repo>/iphone-shop.html` (or root depending on your repo setup).

Notes: pushing requires GitHub credentials. You can use GitHub Desktop or `gh` CLI for interactive flows.

---

Quick steps: Netlify (no git required)

- Go to https://app.netlify.com/drop and drag-and-drop this folder (zip the folder first or drag the built folder). Netlify will host it and give a public URL.

Or connect your GitHub repo to Netlify — every push deploys a new version.

---

Local background server (run without VS Code)

Option A — quick (requires Python installed):

1. From an elevated or normal PowerShell run:

```powershell
cd "C:\Users\Admin\Desktop\Нова папка"
# start server in new hidden window (this process survives closing VS Code because it's a separate process)
Start-Process -FilePath "python" -ArgumentList "-m http.server 8000" -WorkingDirectory "C:\Users\Admin\Desktop\Нова папка" -WindowStyle Hidden
```

2. Open `http://localhost:8000/iphone-shop.html` in your browser.

3. To stop the server: open Task Manager and end the `python.exe` process started by the previous command.

Option B — run on startup (persistent across logins)

- Use Task Scheduler to create a task that runs the above `Start-Process` or runs `python -m http.server 8000` at logon. This will start the server automatically when you sign in.

Option C — expose local site to internet (temporary)

- Use `ngrok` (https://ngrok.com/) to create a public URL that tunnels to your localhost:

```powershell
# after download and auth
ngrok http 8000
```

- ngrok prints a public https URL that forwards to `http://localhost:8000`.

Security note: exposing your local machine publicly can be unsafe — use ngrok for demo/testing only.

---

If you want, I can:
- Help create a Git repository and walk you through pushing to GitHub (you'll need to provide or run authentication locally).
- Create a simple PowerShell script to start the server and a sample `schtasks` command you can run to start it at login.
- Or prepare a Netlify deploy ZIP you can drop into Netlify.

Tell me which option you prefer and I will continue.
