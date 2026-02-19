# this is where I store my binaries when I don't have write access,
export PATH=$PATH:~/bin

# pull from yadm before anything
if hash yadm 2>/dev/null; then
    #yadm pull
    echo 'nothing to see'
else
    echo 'yadm binary not found. dotfiles were not pulled. install here: https://github.com/TheLocehiliosan/yadm'
fi

# source the .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
