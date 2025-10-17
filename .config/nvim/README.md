# Install (Debian)

## Install prerequisites and dependencies:
```
sudo apt install build-essential fd-find git curl wget python3-venv ripgrep unzip
```
- build-essential: nvim-treesitter
- fd-find: telescope (not required)
- git: download the dotconfig repository
- python3-venv: mason.nvim (ruff)
- ripgrep: telescope (live-grep finder)
- unzip: mason.nvim

## Install Neovim:
We don't use Debian **apt install** as its version is really old.
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
mkdir -p $HOME/.local/bin
rm -rf   $HOME/.local/bin/nvim-linux-x86_64
tar -C   $HOME/.local/bin -xzf nvim-linux-x86_64.tar.gz
echo "export PATH=\$PATH:$HOME/.local/bin/nvim-linux-x86_64/bin" >> $HOME/.bashrc
```
*type **bash** to open a new shell to apply the PATH command*

# Install (RHEL8)
My installation of RHEL8 has glibc version 2.28, but normal neovim releases require >=2.29. Fortunately, neovim provide (unsupported) releases built with glibc 2.17: https://github.com/neovim/neovim-releases/releases

## Install prerequisites and dependencies:
```
sudo yum install ripgrep
```
- ripgrep: telescope (live-grep finder)

## Install Python
This is only in cases where you need your own python version. For example, on RHEL8, the installed Python version is 3.6 while the latest major Python release is 3.13.
Find the release you want to download here: https://www.python.org/downloads/source/. I chose 3.12.11. Get the link for the Gzipped source tarball and then run these commands:
```
wget https://www.python.org/ftp/python/3.12.11/Python-3.12.11.tgz
tar zxvf Python-3.12.11.tgz
cd Python-3.12.11/
./configure --enable-optimizations --prefix=$HOME/.local && make && make install
```
This may take a few minutes, but once it's done, you now have your own Python installation inside the ~/.local/bin folder, which should be in your $PATH. If you enter **which python3** you should see that your .local/bin binary is used.

## Install Neovim:
```
curl -LO https://github.com/neovim/neovim-releases/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz # change version!
mkdir -p $HOME/.local/bin
rm -rf   $HOME/.local/bin/nvim-linux-x86_64
tar -C   $HOME/.local/bin -xzf nvim-linux-x86_64.tar.gz
echo "export PATH=\$PATH:$HOME/.local/bin/nvim-linux-x86_64/bin" >> $HOME/.bashrc
```

# Any Linux
Regardless of whether you came from Debian or RHEL above, you should continue below as both setups require Go and NodeJS binaries.

## Install Go
For Golang linting and formatting in Neovim via gopls, gofmt, etc.
```
wget https://go.dev/dl/go1.25.0.linux-amd64.tar.gz # <-- Change version number!
mkdir -p $HOME/.local/bin
rm -rf   $HOME/.local/bin/go
tar -C   $HOME/.local/bin -xzf go1.25.0.linux-amd64.tar.gz
echo "export PATH=$HOME/.local/bin/go/bin:\$PATH" >> $HOME/.bashrc
echo "export PATH=$HOME/go/bin:\$PATH" >> $HOME/.bashrc # for things installed with "go install"
```
We need the $HOME/go/bin folder in path as this is where golang tools like air/wgo/etc tend to be installed. Run **bash && go version** to ensure that Go binary is executed correctly.

## Install NodeJS
> https://nodejs.org/en/download - select "prebuild Node.js for Linux"

I use this for the pyright LSP. If you don't use this, you can skip this step.
```
wget https://nodejs.org/dist/v22.18.0/node-v22.18.0-linux-x64.tar.xz
mkdir -p $HOME/.local/bin
rm -rf   $HOME/.local/bin/node-v22.18.0-linux-x64
tar -C   $HOME/.local/bin -xf node-v22.18.0-linux-x64.tar.xz
echo "export PATH=\$PATH:$HOME/.local/bin/node-v22.18.0-linux-x64/bin" >> $HOME/.bashrc
```
*type **bash** to apply the PATH command*

## Clone repository
This contains my personal nvim and tmux settings. I really hope the **.config** folder does not already exist. If it does, you're on your own.
```
cd && git clone https://github.com/emieli/dotconfig.git .config
```
You should now be able to start Nvim with the **nvim** command. You should see a black window for a few seconds then see lots of plugins get installed. Let it run for a minute or so as it has a lot to do the first time it starts up.

# Keymap cheat sheet
Cheat sheet for nvim keybindings. Some are defaults, some are plugin-specific.

## LSP stuff: (https://neovim.io/doc/user/lsp.html#_global-defaults)
  	K:          vim.lsp.buf.hover
  	gd:         vim.lsp.buf.definition (config/options)
  	grn:        vim.lsp.buf.rename
  	gra:        vim.lsp.buf.code_action
  	grr:        vim.lsp.buf.references

## Snacks:
    <leader>bd: Delete buffer without disrupting split-layout.

## Telescope:
  	<leader>ff: Files in folder
  	<leader>fg: Files in git
        ctrl+t: Open file in tab

## LSP diagnostics
  	<leader>tn: Go to next diagnostics error
  	<leader>tp: Go to prev diagnostics error

## nvim-cmp: (LSP auto-complete dialog)
  	tab:        select next item in suggestion list, arrow keys also work
  	shift+tab:  select prev item in suggestion list, arrow keys also work

## Comment code (code_comments.lua)
    <leader>cc: Comment highlighted line(s)
    <leader>cu: Uncomment highlighted line(s)

## Code folding (ufo.lua)
    za:         Fold indented code under cursor. If cursor on folded line, perform unfold instead.
    zA:         Fold all layers in current function. If cursor on folded line, perform unfold-all instead.
    zr:         Unfold all folds, one layer at a time.
    zR:         Unfold all fold layers in one go.
    zm:         Fold all folds, one layer at time. I think. It's hard to tell because folds can happen off-screen.
    zM:         Fold all layers in one go.

Commands are a bit annoying because they do different things based on whether the cursor-line is currently folded or not.
Example: zM will close all folds. If you then press "zr", one layer at a time will unfold.
zM seem to be clashing with the J command sometimes. I see that joining two lines after running zM causes other parts of my code to fold. Weird.

## Increment number
Highlight the number you're on with **vw** then press **g** followed by **Ctrl+a** to increment the number.
You can also do it with multiple numbers by placing each number on its own row, then use v to highlight all **0**'s, then press **g** and **Ctrl+a** to increment them all sequentially.
```
0 -> 1
0 -> 2
0 -> 3
0 -> 4
```
