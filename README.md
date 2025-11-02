# 🌐 NetCheck — Simple Internet Diagnostic Tool  

> A sleek and powerful shell script to test your network connection, latency, and speed — right from your terminal.  
> Built with 💙 by [**@TheLinuxPoint**](https://github.com/thelinuxpoint)

---

## ✨ Features
- ✅ Checks internet connectivity instantly  
- ⚡ Tests latency for popular servers (Google, GitHub, Cloudflare)  
- 📶 Runs optional speed test (if `speedtest-cli` is installed)  
- 🌍 Shows your public IP and network details  
- 🎨 Beautiful colored output with an ASCII header  

---

## 🖥️ Preview
<center>
<img src='https://github.com/thelinuxpoint/netcheck/blob/main/out.png'/>
</center>

## ⚙️ Installation

```bash
# Clone this repo
git clone https://github.com/thelinuxpoint/netcheck.git
cd netcheck.sh

# Make executable
chmod +x netcheck.sh

# (Optional) Move to PATH for global access
sudo cp netcheck.sh /usr/local/bin/netcheck
