# WezTerm Configuration

My personal [WezTerm](https://wezfurlong.org/wezterm/) configuration.

## Installation

### 1. Install WezTerm

#### Windows

Install WezTerm using `winget`:

```powershell
winget install wez.wezterm
```

#### Linux

Install WezTerm by following the official installation instructions for your Linux distribution:

https://wezfurlong.org/wezterm/installation.html

---

### 2. Clone the configuration

WezTerm looks for its configuration in `~/.config/wezterm/`.

Clone this repository directly into that directory:

```bash
git clone https://github.com/AlexanderGuacan/wezterm.git ~/.config/wezterm
```

After cloning, the configuration should be available at:

```text
~/.config/wezterm/
```

Restart WezTerm to load the configuration.

---

## Shell integration

### OSC 7

WezTerm can use the **OSC 7 escape sequence** to keep track of the shell's current working directory.

This is especially useful when creating or splitting panes. Without OSC 7, a new pane may not start in the same directory as the current pane.

If splitting panes does not preserve the current working directory, add the following function to your `~/.bashrc`:

```bash
__wezterm_osc7() {
  if hash wezterm 2>/dev/null ; then
    wezterm set-working-directory 2>/dev/null && return 0
  fi
  printf "\033]7;file://%s%s\033\\" "${HOSTNAME}" "${PWD}"
}

PROMPT_COMMAND="__wezterm_osc7${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
```

Then reload your shell configuration:

```bash
source ~/.bashrc
```

Or restart your terminal.

### What does this do?

The shell sends the current working directory to WezTerm using the **OSC 7** escape sequence whenever the prompt is displayed.

This allows WezTerm to know which directory the current shell is in and use it when creating new panes or tabs.
