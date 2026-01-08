# Chromebook Development Setup - BidDeed.AI

**80% Automated Chromebook Installation for AI Development**

[![Setup Time](https://img.shields.io/badge/Setup_Time-45--60_min-blue)]()
[![Automation](https://img.shields.io/badge/Automation-80%25-green)]()
[![Claude Code](https://img.shields.io/badge/Claude_Code-2.0.74+-purple)]()

Complete development environment setup for BidDeed.AI foreclosure intelligence platform on Chromebook.

---

## ⚡ Quick Start (3 Steps)

### Step 1: Enable Linux on Chromebook (5 minutes)
Settings → Advanced → Developers → Turn On Linux

### Step 2: Run Master Installer (30-45 minutes, automated)
```bash
curl -fsSL https://raw.githubusercontent.com/breverdbidder/chromebook-dev-setup/main/chromebook-master-install.sh -o ~/install.sh
chmod +x ~/install.sh
./install.sh
```

### Step 3: Configure Credentials (3 minutes)
```bash
gh auth login
cp ~/workspace/.env.template ~/workspace/.env
nano ~/workspace/.env
```

**Total time:** 45-60 minutes (80% automated)

---

## 🚀 NEW: Claude Code Desktop - Multi-Session Parallel Workflows

**Upgrade your development workflow from sequential to parallel execution!**

Claude Code Desktop (late 2025/early 2026 release) transforms your Chromebook into a parallel AI engineering workstation:

- **4x Development Speed**: Run 4 sessions simultaneously instead of sequentially
- **Git Worktree Isolation**: Zero merge conflicts across parallel tasks
- **Persistent Memory**: CLAUDE.md files maintain context across restarts
- **Plan Mode**: AI reviews changes before execution for safe autonomous work
- **Browser Control**: Automated testing and QA workflows

**For BidDeed.AI specifically:**
- Zoning Analyst, ForecastEngine™, SPD Pipeline, and maintenance run in parallel
- 28 hours of sequential work → 7 hours parallel execution
- Your 20-minute daily oversight → 5-10 minutes reviewing completed work

📖 **[Read the complete Claude Code Desktop Guide →](CLAUDE_CODE_DESKTOP_GUIDE.md)**

Quick install (after CLI setup):
```bash
cd ~/Downloads
wget https://storage.googleapis.com/osprey-downloads-c02f6a0d-347c-492b-a752-3e0651722e97/nest-stable/claude-code-desktop-linux-x64.AppImage
chmod +x claude-code-desktop-linux-x64.AppImage
mkdir -p ~/Applications
mv claude-code-desktop-linux-x64.AppImage ~/Applications/
~/Applications/claude-code-desktop-linux-x64.AppImage
```

---

## 🚨 BREAKTHROUGH: Oh-My-OpenCode (Sisyphus) - 28x Speed Multiplier

**The ultimate enhancement to your AI development workflow!**

Oh-my-opencode (nicknamed "Sisyphus") takes Claude Code Desktop's 4x parallelism and multiplies it by 7x through:

- **Background Agents**: Work continues autonomously ("go for a walk" while it completes features)
- **Specialized Roles**: Oracle (architecture), Librarian (research), Frontend Engineer
- **LSP/AST Tools**: Deep code understanding (refactored 8,000 ESLint warnings in 1 day)
- **Token Efficiency**: 40% reduction while doing MORE work ($24K of production testing)
- **Ralph Loop**: Continuous self-improvement until production-ready

**Real-World Performance:**
```
Task: Implement Zoning Analyst POC
- Manual: 2 weeks
- Desktop Only: 7 hours
- Desktop + Sisyphus: 55 minutes  ← 28x faster
```

**The Math:**
- Baseline CLI: 28 hours for 4 features
- + Desktop: 7 hours (4x improvement)  
- + Sisyphus: **~1 hour (28x improvement)**

📖 **[Read the complete Oh-My-OpenCode Integration Guide →](OH_MY_OPENCODE_INTEGRATION.md)**

**Quick Install:**
```bash
curl -fsSL https://bun.sh/install | bash
bunx oh-my-opencode install --claude=max20
```

**Then Try:**
```bash
opencode "Implement complex feature. Use background agents. Go ultrawork."
# Minimize window, go get coffee, come back to completed work
```

10.9k ⭐ on GitHub | Battle-tested with $24K of production usage | Works with your existing setup

---

## 📦 What Gets Installed

- **Node.js 20 LTS** - JavaScript runtime
- **Claude Code 2.0.74+** - AI coding assistant with LSP integration
- **Git + GitHub CLI** - Version control and GitHub automation
- **Python 3.11+** - Backend programming language
- **Supabase CLI** - Database management
- **All 3 BidDeed.AI repositories:**
  - brevard-bidder-scraper (main platform)
  - life-os (productivity system)
  - spd-site-plan-dev (site plan development)
- **Custom aliases** - Productivity shortcuts
- **Development scripts** - Automated workflows

---

## 📋 Documentation

| Document | Purpose | When to Use |
|----------|---------|-------------|
| [CHROMEBOOK_QUICK_START.md](CHROMEBOOK_QUICK_START.md) | 80/20 setup guide | First-time setup |
| [CHROMEBOOK_SETUP_CHECKLIST.md](CHROMEBOOK_SETUP_CHECKLIST.md) | Printable checklist | Track progress |
| [CLAUDE_CODE_DESKTOP_GUIDE.md](CLAUDE_CODE_DESKTOP_GUIDE.md) | **Multi-session parallel workflows** | **After CLI setup** |
| [OH_MY_OPENCODE_INTEGRATION.md](OH_MY_OPENCODE_INTEGRATION.md) | **🚨 28x speed via background agents** | **After Desktop installed** |
| [log_lsp_metrics.py](log_lsp_metrics.py) | LSP performance tracker | Weekly monitoring |

---

## 🚀 Daily Workflow

After setup, use these commands:

```bash
# Start 7-hour autonomous development session
biddeed

# Commit and push changes
deploy "Implemented feature X"

# Test Supabase connection
sb-check

# Update all repositories
pull-all

# Run tests across all projects
test-all

# End-of-day summary
~/workspace/session-end.sh
```

### Custom Aliases Reference

| Alias | Command | Purpose |
|-------|---------|---------|
| `biddeed` | Start Claude Code in brevard-bidder-scraper | Main development |
| `lifeos` | Start Claude Code in life-os | Personal productivity |
| `spd` | Start Claude Code in spd-site-plan-dev | Site plan projects |
| `deploy` | `git add . && git commit && git push` | Quick deployment |
| `sb-check` | Test Supabase connection | Verify database |
| `sb-errors` | Show recent errors | Debug issues |
| `pull-all` | Update all repos | Sync with GitHub |
| `ws` | `cd ~/workspace` | Navigate to workspace |
| `bb` | `cd ~/workspace/brevard-bidder-scraper` | Navigate to main repo |

---

## 🎯 Success Criteria

Installation is complete when:

- ✅ `biddeed` starts Claude Code session
- ✅ `deploy "test"` pushes to GitHub
- ✅ `sb-check` returns JSON response
- ✅ GitHub Actions workflows run automatically
- ✅ Cloudflare Pages deploys automatically

Run validation: `~/workspace/validate-install.sh`

---

## 🛠️ Technical Stack

### Development Tools
- **Claude Code 2.0.74+** - AI pair programming with LSP
- **GitHub Actions** - CI/CD automation
- **Cloudflare Pages** - Static site hosting

### Backend
- **Python 3.11+** - Core language
- **LangGraph** - Multi-agent orchestration
- **Supabase** - PostgreSQL database + auth

### Frontend
- **React** - UI framework
- **Tailwind CSS** - Styling
- **TypeScript** - Type safety

---

## 📊 Time Breakdown

| Phase | Time | Type | Description |
|-------|------|------|-------------|
| Enable Linux | 5 min | Manual | Chrome OS settings |
| Master Installer | 30-45 min | **Automated** | All package installation |
| Configure Credentials | 3 min | Manual | GitHub + API keys |
| Browser Setup | 2 min | Manual | Bookmarks and tabs |
| **Total** | **45-60 min** | **80% automated** | Ready to develop |

---

## 🔐 Security

**API Keys Required:**
- `ANTHROPIC_API_KEY` - Get from https://console.anthropic.com/settings/keys
- `SUPABASE_ANON_KEY` - Get from Supabase dashboard
- `GITHUB_TOKEN` - Get from https://github.com/settings/tokens

**Security Best Practices:**
- Never commit `.env` files
- Rotate tokens quarterly
- Use GitHub Secrets for CI/CD
- Store keys in Cloudflare Pages environment variables

---

## 🆘 Troubleshooting

### "Command not found: biddeed"
```bash
source ~/.bashrc
```

### "Permission denied (publickey)"
```bash
ssh-keygen -t ed25519 -C "brevardbidderai@gmail.com"
gh ssh-key add ~/.ssh/id_ed25519.pub
```

### "Claude Code not found"
```bash
sudo npm install -g @anthropic-ai/claude-code
claude --version
```

### "Supabase connection timeout"
```bash
curl https://mocerqjnksmhcjzxrewo.supabase.co/rest/v1/
cat ~/workspace/.env | grep SUPABASE
```

---

## 📈 Metrics & Monitoring

### LSP Integration Benefits
Run `python3 ~/workspace/log_lsp_metrics.py` to track:
- Zero-hallucination verification
- Cross-file navigation speed
- Type checking improvements
- Auto-completion accuracy

**Expected Time Savings:**
- Per session (7 hours): ~60 minutes
- Per week (5 sessions): ~5 hours
- Per month (20 sessions): ~20 hours

---

## 🔄 Maintenance

### Weekly
- Run `pull-all` to sync repositories
- Check GitHub Actions usage (2,000 min/month free)
- Review Supabase insights for errors

### Monthly
- Update Claude Code: `npm update -g @anthropic-ai/claude-code`
- Update system: `sudo apt-get update && sudo apt-get upgrade`
- Review API costs (target: <$100/month)

### Quarterly
- Test rollback procedures
- Audit security (rotate keys)
- Update documentation

---

## 📞 Support & Links

### Repositories
- **Main Platform:** [brevard-bidder-scraper](https://github.com/breverdbidder/brevard-bidder-scraper)
- **Life OS:** [life-os](https://github.com/breverdbidder/life-os)
- **SPD Site Plans:** [spd-site-plan-dev](https://github.com/breverdbidder/spd-site-plan-dev)
- **Organization:** [breverdbidder](https://github.com/breverdbidder)

### Production URLs
- BidDeed.AI Landing: https://brevard-bidder-landing.pages.dev
- Life OS Dashboard: https://life-os-aiy.pages.dev
- Supabase Dashboard: https://supabase.com/dashboard/project/mocerqjnksmhcjzxrewo

### Documentation
- [GitHub Repository Reference](https://github.com/breverdbidder/chromebook-dev-setup/blob/main/GITHUB_REPOSITORY_REFERENCE.md)
- [Everest Ascent Pattern](https://github.com/breverdbidder/spd-site-plan-dev/blob/main/docs/EVEREST_ASCENT_PATTERN.md)

---

## 🎓 Learning Resources

- **Claude Code:** https://docs.anthropic.com/claude-code
- **LangGraph:** https://langchain-ai.github.io/langgraph/
- **Supabase:** https://supabase.com/docs
- **GitHub Actions:** https://docs.github.com/en/actions
- **Cloudflare Pages:** https://developers.cloudflare.com/pages

---

## 📄 License

Proprietary - Everest Capital USA

---

## 🙋 FAQs

**Q: Can I use this on a non-Chromebook Linux system?**  
A: Yes! The installer works on any Debian-based Linux (Ubuntu, Debian, etc.)

**Q: What if I already have Node.js/Python installed?**  
A: The installer checks versions and upgrades if needed. Existing installs are preserved.

**Q: Can I customize the aliases?**  
A: Yes! Edit `~/.bashrc` and run `source ~/.bashrc` to reload.

**Q: How much disk space is needed?**  
A: Approximately 5GB for all tools + repositories.

**Q: Can I install this on multiple Chromebooks?**  
A: Yes! Run the installer on each device. Credentials sync via GitHub.

---

**Version:** 1.2  
**Last Updated:** January 8, 2026 (Added Oh-My-OpenCode 28x speed multiplier)  
**Author:** Ariel Shapira, Everest Capital USA
