# Pomo CLI - A simple Pomodoro Timer for Your Terminal

A extreme lightweight, no-fuss Pomodoro Technique timer that runs directly in your terminal.

### Preview

### Features
* Standard Pomodoro cycle: Work -> Short Break -> Long Break.
* Desktop notifications on session completion (`notify-send`).
* Customizable timer durations via command-line arguments.

### Prerequisites
This script is designed for Linux systems and required the following to be installed:

* `bash`
* `tput` (usually part of `ncurses`)
* `notify-send` (usually part of `libnotify`)

On Ubuntu/Debian, you can install the notification tool with:
```bash
sudo apt-get update && sudo apt-get install libnotify-bin
```

### Installation
You can install `pomo-cli` with a single command using `curl` or `wget`:

**curl:**
```bash
bash -c "$(curl -fsSL [https://raw.githubusercontent.com/ABB00717/pomo-cli/refs/heads/master/install.sh](https://raw.githubusercontent.com/ABB00717/pomo-cli/refs/heads/master/install.sh))"
```

**wget:**
```bash
bash -c "$wget -O- [https://raw.githubusercontent.com/ABB00717/pomo-cli/refs/heads/master/install.sh](https://raw.githubusercontent.com/ABB00717/pomo-cli/refs/heads/master/install.sh))"
```

The script will be installed to `~/.local/bin`. Please ensure `~/.local/bin` is in your shell's `PATH`.

### Usage
**Start with default settings (25m work, 5m short break, 15m long break)**
```bash
pomo
```

**Start with custom durations:**
```bash
# Usage: pomo [work_mins] [short_break_mins] [long_break_mins]
pomo 45 10 30
```
