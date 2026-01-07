# Chromebook Setup Checklist - BidDeed.AI Development

**Date:** ____ / ____ / ________  
**Chromebook Model:** _______________________________  
**Setup Time Started:** ________  
**Setup Time Completed:** ________

---

## ☐ PHASE 1: ENABLE LINUX (Target: 5 minutes)

### Step 1.1: Access Settings
- [ ] Click clock in bottom-right corner
- [ ] Click Settings icon (gear)
- [ ] Navigate to **Advanced** section

**Time Completed:** ________

### Step 1.2: Enable Linux
- [ ] Click **Developers** in left sidebar
- [ ] Click **Turn On** next to "Linux development environment"
- [ ] Accept default settings (Debian 11)
- [ ] Click **Install**

**Time Completed:** ________

### Step 1.3: Wait for Terminal
- [ ] Terminal opens automatically (3-5 minutes)
- [ ] See prompt: `penguin@penguin:~$`

**Time Completed:** ________

**Phase 1 Total Time:** ________ minutes

---

## ☐ PHASE 2: RUN MASTER INSTALLER (Target: 30-45 minutes)

### Step 2.1: Download Installer
```bash
curl -fsSL https://raw.githubusercontent.com/breverdbidder/chromebook-dev-setup/main/chromebook-master-install.sh -o ~/install.sh
```
- [ ] Command executed successfully
- [ ] File downloaded to home directory

**Time Completed:** ________

### Step 2.2: Make Executable
```bash
chmod +x ~/install.sh
```
- [ ] Permissions set

**Time Completed:** ________

### Step 2.3: Run Installer
```bash
./install.sh
```
- [ ] Installation started
- [ ] See progress: `[1/15]`, `[2/15]`, etc.

**Time Started:** ________

### Step 2.4: Monitor Progress
Track each automated step:
- [ ] `[1/15]` Updating system packages
- [ ] `[2/15]` Installing Node.js 20 LTS
- [ ] `[3/15]` Installing Git
- [ ] `[4/15]` Installing GitHub CLI
- [ ] `[5/15]` Installing Python 3.11
- [ ] `[6/15]` Installing Claude Code
- [ ] `[7/15]` Installing Supabase CLI
- [ ] `[8/15]` Creating workspace directory
- [ ] `[9/15]` Cloning repositories (3 repos)
- [ ] `[10/15]` Installing Python dependencies
- [ ] `[11/15]` Creating custom aliases
- [ ] `[12/15]` Creating environment template
- [ ] `[13/15]` Creating browser launcher
- [ ] `[14/15]` Creating session-end script
- [ ] `[15/15]` Creating validation script

**Time Completed:** ________

### Step 2.5: Verify Success
- [ ] See message: "Installation Complete! 🎉"
- [ ] Note total installation time: ________ minutes

**Phase 2 Total Time:** ________ minutes

---

## ☐ PHASE 3: CONFIGURE CREDENTIALS (Target: 3 minutes)

### Step 3.1: GitHub Authentication
```bash
gh auth login
```
- [ ] Selected: **GitHub.com**
- [ ] Selected: **HTTPS**
- [ ] Selected: **Y** (authenticate Git)
- [ ] Selected: **Login with web browser**
- [ ] Copied one-time code: _______________________
- [ ] Pasted code in browser
- [ ] Clicked **Authorize**
- [ ] See: "✓ Logged in as breverdbidder"

**Time Completed:** ________

### Step 3.2: Configure Environment Variables
```bash
cd ~/workspace
cp .env.template .env
nano .env
```

Fill in these values:
- [ ] `ANTHROPIC_API_KEY=sk-ant-...`
      - Get from: https://console.anthropic.com/settings/keys
      - Value: _______________________________________
      
- [ ] `SUPABASE_ANON_KEY=...`
      - Get from: https://supabase.com/dashboard/project/mocerqjnksmhcjzxrewo/settings/api
      - Value: _______________________________________
      
- [ ] `GITHUB_TOKEN=ghp_...`
      - Get from: https://github.com/settings/tokens
      - Value: _______________________________________

- [ ] Saved file (Ctrl+X → Y → Enter)

**Time Completed:** ________

**Phase 3 Total Time:** ________ minutes

---

## ☐ PHASE 4: VALIDATE INSTALLATION (Target: 2 minutes)

### Step 4.1: Run Validation Script
```bash
~/workspace/validate-install.sh
```

Check all items are green:
- [ ] ✅ Node.js: v20.x.x
- [ ] ✅ Claude Code: v2.0.74+
- [ ] ✅ Git: v2.x.x
- [ ] ✅ GitHub CLI: Authenticated
- [ ] ✅ Python: v3.11.x
- [ ] ✅ Supabase CLI: v1.x.x
- [ ] ✅ Repository: brevard-bidder-scraper
- [ ] ✅ Repository: life-os
- [ ] ✅ Repository: spd-site-plan-dev
- [ ] ✅ Environment template created
- [ ] ✅ Browser launcher configured

**Time Completed:** ________

**Phase 4 Total Time:** ________ minutes

---

## ☐ PHASE 5: BROWSER SETUP (Target: 2 minutes)

### Step 5.1: Launch Browser with Pinned Tabs
```bash
~/workspace/launch-browser.sh
```
- [ ] Chrome opened with 5 tabs

**OR manually open and bookmark:**
- [ ] https://github.com/breverdbidder
- [ ] https://supabase.com/dashboard/project/mocerqjnksmhcjzxrewo
- [ ] https://brevard-bidder-landing.pages.dev
- [ ] https://life-os-aiy.pages.dev
- [ ] https://claude.ai

### Step 5.2: Pin Tabs (Optional)
- [ ] Right-click each tab → **Pin**

**Time Completed:** ________

**Phase 5 Total Time:** ________ minutes

---

## ☐ FINAL VALIDATION: FIRST DEVELOPMENT SESSION

### Test 1: Start BidDeed.AI Session
```bash
biddeed
```
- [ ] Claude Code starts
- [ ] Opens brevard-bidder-scraper repository
- [ ] Shows 7-hour session timer

**Time Completed:** ________

### Test 2: Give Claude a Task
Try: "Show me the Smart Router configuration and explain the tier selection logic"

- [ ] Claude responds with code explanation
- [ ] No errors in terminal

**Time Completed:** ________

### Test 3: Test Deployment
```bash
deploy "Test commit from Chromebook setup"
```
- [ ] Git commit created
- [ ] Pushed to GitHub
- [ ] No errors

**Time Completed:** ________

### Test 4: Test Supabase Connection
```bash
sb-check
```
- [ ] Returns JSON response
- [ ] No connection errors

**Time Completed:** ________

---

## ✅ SETUP COMPLETE!

**Total Setup Time:** ________ minutes

**Breakdown:**
- Phase 1 (Enable Linux): ________ minutes
- Phase 2 (Master Installer): ________ minutes
- Phase 3 (Configure Credentials): ________ minutes
- Phase 4 (Validate Installation): ________ minutes
- Phase 5 (Browser Setup): ________ minutes

**Automation Rate:** ________%
(Formula: Phase 2 time / Total time × 100)

---

## 📋 POST-SETUP CHECKLIST

### Immediate Next Steps:
- [ ] Read safety rules: `cat ~/workspace/brevard-bidder-scraper/.claude/claude_code_rules.md`
- [ ] Review architecture: `cat ~/workspace/spd-site-plan-dev/docs/EVEREST_ASCENT_PATTERN.md`
- [ ] Check fatal errors list: `cat ~/workspace/brevard-bidder-scraper/docs/FATAL_ERRORS_CHECKLIST.md`

### Optional Optimizations:
- [ ] Set Chrome to auto-open with pinned tabs on startup
- [ ] Create keyboard shortcut for `biddeed` command
- [ ] Install additional Chrome extensions for development
- [ ] Configure Chrome OS dark mode for night coding

### Weekly Maintenance:
- [ ] Update packages: `sudo apt-get update && sudo apt-get upgrade`
- [ ] Pull latest changes: `pull-all`
- [ ] Check Claude Code updates: `npm update -g @anthropic-ai/claude-code`
- [ ] Review Supabase metrics: Check dashboard weekly

---

## 🆘 TROUBLESHOOTING LOG

**Issue 1:**
- Problem: _____________________________________________
- Time occurred: ________
- Solution: _____________________________________________
- Time resolved: ________

**Issue 2:**
- Problem: _____________________________________________
- Time occurred: ________
- Solution: _____________________________________________
- Time resolved: ________

**Issue 3:**
- Problem: _____________________________________________
- Time occurred: ________
- Solution: _____________________________________________
- Time resolved: ________

---

## 📝 NOTES

_____________________________________________
_____________________________________________
_____________________________________________
_____________________________________________
_____________________________________________
_____________________________________________
_____________________________________________
_____________________________________________

---

**Setup Completed By:** _______________________________  
**Date:** ____ / ____ / ________  
**Signature:** _______________________________

**Next Review Date:** ____ / ____ / ________ (30 days from setup)

---

**Version:** 1.0  
**Last Updated:** January 7, 2026  
**Document:** CHROMEBOOK_SETUP_CHECKLIST.md
