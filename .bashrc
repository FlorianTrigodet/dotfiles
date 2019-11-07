# find by typing `uname -n`
export my_2019_macbook="MED42038.local"
export penduick_server="penduick"
export midway_server="midway2-login1.rcc.local"

# -----------------------------------------------------------------------------
# SHARED BY ALL {{{
# -----------------------------------------------------------------------------

# welcome message
bash ~/.bash_welcome

# Define your aliases here ...
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# ls coloring
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# -----------------------------------------------------------------------------
# }}} MY MACBOOK {{{
# -----------------------------------------------------------------------------

if [[ "$my_2019_macbook" =~ "$(uname -n)" ]]; then
	# nothing yet
	echo
fi

# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

if [[ "$midway_server" =~ "$(uname -n)" ]]; then
	# load modules
	module load Anaconda3/5.3.0
	module load vim/8.1
	module load rstudio/1.2.1335

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/software/Anaconda3-5.3.0-el7-x86_64/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/software/Anaconda3-5.3.0-el7-x86_64/etc/profile.d/conda.sh" ]; then
		. "/software/Anaconda3-5.3.0-el7-x86_64/etc/profile.d/conda.sh"
	    else
		export PATH="/software/Anaconda3-5.3.0-el7-x86_64/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	# source the anvio port
	source /project2/meren/VIRTUAL-ENVS/shared/00_load_all.sh

	# git pull anvio-master
	cd /project2/meren/VIRTUAL-ENVS/anvio-master/anvio; git pull; cd -
fi

# -----------------------------------------------------------------------------
# }}} Penduick {{{
# -----------------------------------------------------------------------------

if [[ "$penduick_server" =~ "$(uname -n)" ]]; then
	PATH=$PATH:$HOME/.local/bin:$HOME/bin
	export PATH
	
	# custom tmp directory
	export TMPDIR=/scratch/work/florian/tmp
fi
