# Chromebook Quick Start - BidDeed.AI Development

**Total Time:** 45-60 minutes  
**Automation:** 80% (32-47 min automated, 13 min manual)  
**Difficulty:** Easy (follow steps in order)

---

## ⚡ FASTEST PATH TO DEVELOPMENT

### Phase 1: Enable Linux (5 minutes - MANUAL)

1. **Open Chrome OS Settings**
   - Click clock → Settings icon
   - Or press: Search + I

2. **Navigate to Developers**
   - Scroll to bottom → **Advanced**
   - Click **Developers**

3. **Turn On Linux**
   - Click **Turn On** next to "Linux development environment"
   - Accept default settings
   - Click **Install** (takes 3-5 minutes)

4. **Wait for Terminal**
   - Terminal opens automatically when ready
   - You'll see: `penguin@penguin:~$`

✅ **Checkpoint:** Terminal is open and ready

---

### Phase 2: Run Master Installer (30-45 minutes - AUTOMATED)

**Copy-paste these commands into terminal:**

```bash
# Download and run installer
curl -fsSL https://raw.githubusercontent.com/breverdbidder/chromebook-dev-setup/main/chromebook-master-install.sh -o ~/install.sh
chmod +x ~/install.sh
./install.sh
```

**What it installs (automatically):**
- Node.js 20 LTS
- Claude Code 2.0.74+
- Git + GitHub CLI
- Python 3.11+
- Supabase CLI
- All 3 BidDeed.AI repositories
- Custom aliases and shortcuts

**Progress:** You'll see `[1/15]`, `[2/15]`, etc. as it works.

⏱️ **Go get coffee** - this takes 30-45 minutes.

✅ **Checkpoint:** See "Installation Complete! 🎉" message

---

### Phase 3: Configure Credentials (3 minutes - MANUAL)

**Step 1: GitHub Authentication**
```bash
gh auth login
```
- Choose: **GitHub.com**
- Choose: **HTTPS**
- Choose: **Y** (authenticate Git)
- Choose: **Login with web browser**
- Copy the code shown
- Press Enter (browser opens)
- Paste code and authorize

✅ **Checkpoint:** See "✓ Logged in as breverdbidder"

**Step 2: API Keys**
```bash
cd ~/workspace
cp .env.template .env
nano .env
```

Fill in:
- `ANTHROPIC_API_KEY` - Get from https://console.anthropic.com/settings/keys
- `SUPABASE_ANON_KEY` - Get from https://supabase.com/dashboard/project/mocerqjnksmhcjzxrewo/settings/api
- `GITHUB_TOKEN` - Get from https://github.com/settings/tokens

Save: **Ctrl+X** → **Y** → **Enter**

✅ **Checkpoint:** Environment variables configured

---

### Phase 4: Validate Installation (2 minutes - AUTOMATED)

```bash
~/workspace/validate-install.sh
```

**Expected output:**
```
✅ Node.js: v20.x.x
✅ Claude Code: v2.0.74+
✅ Git: v2.x.x
✅ GitHub CLI: Authenticated
✅ Python: v3.11.x
✅ Supabase CLI: v1.x.x
✅ Repository: brevard-bidder-scraper
✅ Repository: life-os
✅ Repository: spd-site-plan-dev
```

✅ **Checkpoint:** All green checkmarks

---

### Phase 5: Launch Browser (2 minutes - MANUAL)

**Option A: Use launcher script**
```bash
~/workspace/launch-browser.sh
```

**Option B: Manual bookmark setup**
Open these in Chrome and press **Ctrl+D** to bookmark:
- https://github.com/breverdbidder
- https://supabase.com/dashboard/project/mocerqjnksmhcjzxrewo
- https://brevard-bidder-landing.pages.dev
- https://life-os-aiy.pages.dev
- https://claude.ai

✅ **Checkpoint:** All tabs open and bookmarked

---

## 🚀 START DEVELOPING

### First Command:
```bash
biddeed
```

This starts a 7-hour Claude Code session in brevard-bidder-scraper.

**Try this task:**
```
Update the Smart Router logging to include timestamp and model used
```

If it works, **you're done!** 🎉

---

## 📝 DAILY WORKFLOW

### Morning (30 seconds):
```bash
# Start 7-hour autonomous session
biddeed
```

### During Development:
```bash
# Deploy changes
deploy "Added feature X"

# Check Supabase connection
sb-check

# View recent errors
sb-errors

# Pull latest from all repos
pull-all
```

### End of Day (1 minute):
```bash
# Generate summary and checkpoint
~/workspace/session-end.sh
```

---

## 🔧 CUSTOM COMMANDS REFERENCE

| Command | What It Does |
|---------|--------------|
| `biddeed` | Start 7-hour session in brevard-bidder-scraper |
| `lifeos` | Start session in life-os |
| `spd` | Start session in spd-site-plan-dev |
| `deploy "msg"` | Commit and push with message |
| `sb-check` | Test Supabase connection |
| `sb-errors` | Show recent errors from database |
| `pull-all` | Update all repositories |
| `test-all` | Run tests across all projects |
| `ws` | Navigate to workspace |
| `bb` | Navigate to brevard-bidder-scraper |
| `los` | Navigate to life-os |
| `spdev` | Navigate to spd-site-plan-dev |

---

## 🆘 TROUBLESHOOTING

### "Command not found: biddeed"
```bash
source ~/.bashrc
```

### "Permission denied"
```bash
chmod +x ~/workspace/*.sh
```

### "GitHub authentication failed"
```bash
gh auth logout
gh auth login
```

### "Supabase connection timeout"
```bash
# Test directly
curl https://mocerqjnksmhcjzxrewo.supabase.co/rest/v1/

# Check environment
cat ~/workspace/.env | grep SUPABASE
```

### "Claude Code not found"
```bash
# Reinstall
sudo npm install -g @anthropic-ai/claude-code
claude --version
```

---

## 📚 NEXT STEPS

### After First Successful Session:
1. **Read safety rules:** `cat ~/workspace/brevard-bidder-scraper/.claude/claude_code_rules.md`
2. **Understand architecture:** `cat ~/workspace/spd-site-plan-dev/docs/EVEREST_ASCENT_PATTERN.md`
3. **Review fatal errors:** `cat ~/workspace/brevard-bidder-scraper/docs/FATAL_ERRORS_CHECKLIST.md`

### Optimize Your Workflow:
1. Set Chrome to open automatically with pinned tabs
2. Add `biddeed` to Chrome OS startup
3. Create keyboard shortcuts for common commands

### Learn the Stack:
- LangGraph: https://langchain-ai.github.io/langgraph/
- Supabase: https://supabase.com/docs
- Claude Code: https://docs.anthropic.com/claude-code

---

## ✅ SUCCESS CRITERIA

**You're ready to develop when:**
- ✅ `biddeed` starts Claude Code session
- ✅ `deploy "test"` pushes to GitHub
- ✅ `sb-check` returns JSON response
- ✅ GitHub Actions workflow runs automatically
- ✅ Cloudflare Pages deploys automatically

**Time invested:** 45-60 minutes  
**ROI:** Unlimited - dedicated AI development workstation  
**Maintenance:** <5 min/week

---

## 🎯 REMEMBER

**80/20 Rule:**
- 80% automated (installer does the work)
- 20% manual (authentication, API keys, bookmarks)

**Zero-Human-Loop:**
- Once setup is complete, development is 98% autonomous
- Claude Code handles: coding, testing, committing, deploying
- You handle: strategic direction, final approvals

**Distraction-Free:**
- Dedicated Chromebook = no context switching
- All tools and repos ready to go
- One command to start (`biddeed`)

---

**Questions?** Reference the full automation report: `CHROMEBOOK_AUTOMATION_REPORT.md`

**Last Updated:** January 7, 2026  
**Version:** 1.0
