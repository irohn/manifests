# Editor settings
export VISUAL=nvim
export EDITOR=nvim

# Language
export LC_ALL=en_US.UTF-8

# Add local bin directory to PATH
[ -d "$HOME"/.local/bin ] && \
  export PATH="$HOME"/.local/bin:"$PATH" 

