#!/bin/bash
# Deploy usap-story to GitHub Pages (custom domain story.usathleticperformance.com)
# Manuel : bash deploy.sh "V## — feature description"

set +e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMIT_MSG="${1:-Auto-deploy $(date +%Y-%m-%d-%H%M)}"
LOG="$REPO_DIR/deploy.log"

echo "" >> "$LOG"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Deploy triggered: $COMMIT_MSG" >> "$LOG"

cd "$REPO_DIR" || { echo "❌ Cannot cd to $REPO_DIR" >> "$LOG"; exit 0; }

if [ ! -d ".git" ]; then
  echo "❌ Pas un git repo. Setup manuel requis :" >> "$LOG"
  echo "   git init && git remote add origin git@github.com:ClaudeUSAP/usap-story.git" >> "$LOG"
  exit 0
fi

for path in index.html README.md CNAME; do
  [ -e "$path" ] && git add "$path" 2>>"$LOG"
done

if git diff --cached --quiet 2>>"$LOG"; then
  echo "→ Pas de changements à deployer" >> "$LOG"
  exit 0
fi

echo "→ Commit: $COMMIT_MSG" >> "$LOG"
git commit -m "$COMMIT_MSG" >>"$LOG" 2>&1

echo "→ Push to origin/main..." >> "$LOG"
if git push origin main >>"$LOG" 2>&1; then
  echo "✅ Deployed → https://story.usathleticperformance.com/" >> "$LOG"
  echo "✅ Deployed → https://story.usathleticperformance.com/"
else
  echo "❌ Push failed (voir log)" >> "$LOG"
  echo "❌ Push failed — vérifie SSH auth ou network. Log: $LOG"
  exit 0
fi
