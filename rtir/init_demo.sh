#!/usr/bin/env bash
set -euo pipefail


# Disable colors if not a TTY
if [[ -t 1 ]]; then
  RED=$'\033[31m'; YEL=$'\033[33m'; BLU=$'\033[34m'
  BOLD=$'\033[1m'; DIM=$'\033[2m'; RST=$'\033[0m'
else
  RED=""; YEL=""; BLU=""; BOLD=""; DIM=""; RST=""
fi

cat <<EOF

${YEL}${BOLD}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  ⚠️  RTIR Standalone Mode is NOT supported in this image             ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${RST}

This image is part of the ${BOLD}csirt-lab${RST} setup (${DIM}RTIR + Adminer + Mattermost + Email + Roundcube + FakeTotal${RST})

${RED}${BOLD}At this moment, a stand-alone RTIR container will not run.${RST}
It requires services provided by the full docker compose stack.

${BOLD}✅ Use the full lab environment:${RST}
  ${YEL}git clone https://github.com/kirzaks/csirt-lab${RST}
  ${YEL}cd csirt-lab${RST}
  ${YEL}docker compose up -d${RST}

${BOLD}📌 Repository:${RST}
  https://github.com/kirzaks/csirt-lab

EOF

exit 1
