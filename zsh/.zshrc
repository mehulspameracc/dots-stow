# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# mt_zshrc.conf

# Sample .zshrc for Dev Environment

# OS-specific aliases and setups.

  

# Oh My Zsh setup

export ZSH="$HOME/.oh-my-zsh"
  

# Theme
ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"
ENABLE_CORRECTION="true"

# Plugins

plugins=(git fzf colorize jsontools cp docker docker-compose emoji frontend-search gh asdf jump themes tmux sudo common-aliases history extract pip python yarn web-search copypath copyfile alias-finder dirhistory copybuffer postgres vscode urltools zsh-autosuggestions zsh-syntax-highlighting)

  

export PATH="$HOME/.local/bin:$PATH"
  

# {% if ansible_os_family == 'Debian' %}


# Debian aliases

alias nli='nala install -y '
alias nlug='nala upgrade -y'
alias nlr='nala remove -y '
alias nlu='nala update '
alias nlf='nala fetch'
alias nls='nala search '
alias nlq='nala show '


# {% elif ansible_os_family == 'RedHat' %}  

# RedHat aliases
  
alias dni='dnf install -y '
alias dnug='dnf upgrade -y'
alias dnr='dnf remove -y '
alias dnu='dnf update '
alias dns='dnf search '
alias dnq='dnf info '

# {% elif ansible_os == 'Archlinux' %}

  

# Arch aliases

alias pmi='sudo pacman -S --noconfirm '
alias pmu='sudo pacman -Syu --noconfirm'
alias pmr='sudo pacman -Rns --noconfirm '
alias pms='sudo pacman -Ss '
alias pmq='sudo pacman -Qi '


# {% elif ansible_os == 'Darwin' %}

# MacOS Paths
  

export PATH="/usr/local/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

  
  

# MacOS aliases
  
alias bri='brew install '
alias bru='brew upgrade'
alias brc='brew cleanup'
alias brs='brew search '
alias brq='brew info '
 

# {% endif %}

  
  

# eval "$(zoxide init zsh)"  # zoxide setup

  
  

#Ls cd

chpwd() lsd

# Tmux autostart

  

#ZSH_TMUX_AUTOSTART=true

  
  
  

# NVM setup (if js env)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# yarn 
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  

# PNPM setup (if js env)

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
   *) export PATH="$PNPM_HOME:$PATH" ;;
esac

  

# Bun setup (if js env)

export BUN_INSTALL="$HOME/.bun"
[ -s "$BUN_INSTALL/bin/bun" ] && export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # This loads bun completions

  

# UV path (if python env)

# export PATH="$HOME/.cargo/bin:$PATH"

  

# Basic aliases

# list stuff
  
alias l.="lsd"
alias lk="lsd -l"
alias lp="lsd -a"
alias lla="lsd -la"
alias lo="lsd --tree"
alias ip='ip -color=auto'

# edit stuff

#alias t ='touch '
alias nv='nvim'
alias vi='nvim'


alias omzcf="nv ~/.oh-my-zsh"
alias tmuxcf="nv ~/.config/tmux/tmux.conf"
alias zshcf="nv ~/.zshrc"
alias nvcf="nv ~/.config/nvim/init.vim"
alias vicf="nv ~/.vimrc"
alias tmuxpwcf='nv ~/.config/tmux/plugins/tmux-powerline/themes/default.sh'
alias alaccf='nv ~/.config/alacritty/alacritty.toml'


# source stuff

alias srczsh='source ~/.zshrc'
alias srctmux='tmux source-file ~/.config/tmux/tmux.conf'

# tmux stuff

alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
alias tm='tmux -u'
alias tms='tm new -s'
alias tma='tm a -t'  

# other aliases

alias cat='bat'
alias top='btop'

alias aliases_zsh='cat ~/.zshrc | alias'
alias al='aliases_zsh | grep '
  
alias c='clear'
alias h='history'

  

alias pnpm_upgrade='curl -fsSL https://get.pnpm.io/install.sh | sh -s -- -f && source ~/.zshrc'

# aliases nvim distros
alias nvchad='NVIM_APPNAME=nvim-nvchad nvim'
alias lazyvim='NVIM_APPNAME=nvim-lazyvim nvim'

# alias nvchad='NVIM_APPNAME=nvim-nvchad nvim'

# Function to select Neovim distribution with fzf
_nvim_selector() {
  local nvim_configs_dir="$HOME/.config"
  local distros=()

  # Find nvim* directories, excluding common non-config directories
  for dir in "$nvim_configs_dir"/nvim*; do
    if [[ -d "$dir" ]]; then
      # Extract distro name (e.g., nvim-nvchad from /home/user/.config/nvim-nvchad)
      local distro_name=$(basename "$dir")
      # Exclude common non-config nvim directories
      case "$distro_name" in
        nvim-backups|nvim-swaps|nvim-undo|nvim-shada|nvim-sessions|nvim-backup)
          ;;
        *)
          distros+=("$distro_name")
          ;;
      esac
    fi
  done

  if [[ ${#distros[@]} -eq 0 ]]; then
    echo "No Neovim configurations (nvim*) found in $nvim_configs_dir"
    # Fallback to default nvim if no distros are found
    command nvim "$@"
    return $?
  fi


  #Use fzf to select a distro
  # fzf options:
  # --height=40%: Sets the height of the fzf window to 40% of the terminal.
  # --reverse: Display the list in reverse order (last item first).
  # --border: Draw a border around the fzf window.
  # --info=inline-right: Show info (like prompt, query) on the right side.
  # --prompt='Neovim Distro> ': Sets the prompt text.
  # --bind 'ctrl-j:down,ctrl-k:up,ctrl-f:page-down,ctrl-b:page-up': Key bindings.
  # --color: Defines the color scheme.
  #   hl: Highlighted string
  #   hl+: Highlighted string (current match)
  #   fg: Foreground color (text)
  #   fg+: Foreground color (current match text)
  #   bg: Background color
  #   bg+: Background color (current match)
  #   prompt: Prompt color
  #   pointer: Pointer to the current selection (e.g., >)
  #   marker: Multi-select marker color
  #   spinner: Loading spinner color
  #   header: Header color
  #   info: Info line color
  #   border: Border color
  #   label: Label color
  #   query: Query color
  #   scrollbar: Scrollbar color
  local selected_distro=$(printf '%s\n' "${distros[@]}" | fzf \
    --height=20% \
    --reverse \
    --border \
    --info=inline-right \
    --prompt='Neovim Distro ✨' \
    --bind 'ctrl-j:down,ctrl-k:up,ctrl-f:page-down,ctrl-b:page-up' \
    --color='hl:#1C1C1C,hl+:#AF5FFF,bg+:#1C1C1C,fg+:#ABE9B4,fg:#86D7FF,prompt:#86D7FF,pointer:#D7AFFF,marker:#ABE9B4,border:#D7AFFF')



  if [[ -n "$selected_distro" ]]; then
    # Launch nvim with the selected NVIM_APPNAME
    NVIM_APPNAME="$selected_distro" command nvim "$@"
  fi
}

# Set aliases for nvim launchers
alias nv='_nvim_selector'
alias nvim='_nvim_selector'

  

# Sourcing OMZ
source $ZSH/oh-my-zsh.sh

  

# Sourcing Powerlevel10k & To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  
  
  

# Add Nvim aliases

# {% for distro in nvim_distros %}

# alias nvim-{{ distro }}='NVIM_APPNAME={{ distro }} nvim'

# {% endfor %}
