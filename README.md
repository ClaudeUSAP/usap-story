# USAP Story — Ranking & Impact Table

Interactive coach/parent-facing analysis showing how French players transition to the US based on their national ranking at various stages of the recruiting process.

**Live**: https://story.usathleticperformance.com/

## Access

Unlisted (no public link from map.usathleticperformance.com). Shared only via SCOUT admin + Player Dashboard for logged-in coaches and parents.

`<meta name="robots" content="noindex, nofollow">` prevents search engine indexation.

## Data source

- FR National Ranking : FFGOLF Mérite Amateur (Messieurs + Mesdames) — monthly refresh
- Scoreboard performance : scoreboard.clippd.com (CLIPPD Inc.)
- Commit data (dates, rank at commit, Aug Y-1, Aug Y) : SCOUT athletes table (Supabase EU `bfxhruvkzidvznsyyryp`), auto-synced

## Deploy

```bash
bash deploy.sh "V## — <description>"
```

Pushes to `main` branch. GitHub Pages redeploys in 30-60s.

## Setup

- GitHub Pages enabled on `main` branch, root folder
- Custom domain `story.usathleticperformance.com` configured via `CNAME` file + DNS CNAME record on Gandi (`story` → `claudeusap.github.io`)
- SSL auto-provisioned by GitHub Pages

## Related repos

- **map.usathleticperformance.com** → `ClaudeUSAP/usap-players-map` (public interactive map)
- **scout.usathleticperformance.com** → `ClaudeUSAP/usap-scout` (agent/coach admin)
- **player.usathleticperformance.com** → parent dashboard
