   
    if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

export EDITOR=vim
export PATH="/usr/local/heroku/bin:$PATH"

if [ -d "Escritorio" ]; then
  cd Escritorio
fi

# Prompt del bash 
PS1=' [\[\033[01;31m\]\W\[\033[00m\]] $ '


