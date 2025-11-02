#!/bin/bash
#==============================================#
#   netcheck.sh — Simple Internet Diagnostic   #
#   Author: Prakash Choudhary (TheLinuxPoint)  #
#   GitHub: https://github.com/thelinuxpoint   #
#==============================================#

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# Check if required tools exist
command -v ping >/dev/null 2>&1 || { echo -e "${RED}Error:${RESET} ping not found"; exit 1; }

echo -e "${BLUE}"
echo "╔════════════════════════════════════╗"
echo "║        🌐  Network Checker         ║"
echo "╚════════════════════════════════════╝"
echo -e "${RESET}"

# 1. Check connectivity
echo -e "${YELLOW}[+] Checking internet connection...${RESET}"
if ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1; then
    echo -e "${GREEN}✔ Internet Connection: ACTIVE${RESET}"
else
    echo -e "${RED}✖ Internet Connection: INACTIVE${RESET}"
    exit 1
fi

# 2. Ping common servers
SERVERS=("google.com" "github.com" "cloudflare.com")
echo -e "\n${YELLOW}[+] Testing latency to popular servers:${RESET}"
for s in "${SERVERS[@]}"; do
    PING_RESULT=$(ping -c 1 -W 2 "$s" | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')
    if [ -n "$PING_RESULT" ]; then
        echo -e "   ${GREEN}$s:${RESET} ${PING_RESULT} ms"
    else
        echo -e "   ${RED}$s:${RESET} Unreachable"
    fi
done

# 3. Optional speed test
if command -v speedtest-cli >/dev/null 2>&1; then
    echo -e "\n${YELLOW}[+] Checking internet speed...${RESET}"
    speedtest-cli --secure --simple | sed "s/^/   /"
else
    echo -e "\n${RED}[!] speedtest-cli not installed.${RESET}"
    echo "   Install with: sudo apt install speedtest-cli"
fi

# 4. Public IP Info
if command -v curl >/dev/null 2>&1; then
    echo -e "\n${YELLOW}[+] Fetching public IP info...${RESET}"
    curl -s ifconfig.me/all | sed 's/^/   /'
else
    echo -e "${RED}curl not installed – skipping IP info.${RESET}"
fi

echo -e "\n${BLUE}───────────────────────────────────────────────${RESET}"
echo -e "${GREEN}All checks complete!${RESET}"
echo -e "${BLUE}───────────────────────────────────────────────${RESET}"
