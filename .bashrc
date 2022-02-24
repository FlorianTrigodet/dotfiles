# find by typing `uname -n`
export my_2019_macbook="MED42038.local:med42038.lan"
export penduick_server="penduick"
export midway_server="midway2-login1.rcc.local:midway2-login2.rcc.local:midway-l16b-28.rcc.local:midway2-0701.rcc.local:midway2-0705.rcc.local:midway2-0706.rcc.local:midway2-0355.rcc.local"

# -----------------------------------------------------------------------------
# SHARED BY ALL {{{
# -----------------------------------------------------------------------------

# if you're scp-ing, we're done
if [ -z "$PS1" ]; then
    return
fi

# welcome message
bash ~/.bash_welcome

# Define your aliases here ...
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# ls coloring
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Name terminal windows
function named() {
    printf "\e]1337;SetBadgeFormat=%s\a" $(echo "$1" | base64)
    echo -ne "\033]0;"$1"\007"
}


# -----------------------------------------------------------------------------
# }}} MY MACBOOK {{{
# -----------------------------------------------------------------------------

if [[ "$my_2019_macbook" =~ "$(uname -n)" ]]; then
	# added by Anaconda3 2019.10 installer
	# >>> conda init >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/frigodet/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    \eval "$__conda_setup"
	else
	    if [ -f "/Users/frigodet/opt/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/Users/frigodet/opt/anaconda3/etc/profile.d/conda.sh"
		CONDA_CHANGEPS1=false conda activate base
	    else
		\export PATH="/Users/frigodet/opt/anaconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda init <<<

	# make it pretty
    export PS1="\[\e[0m\e[40m\e[1;30m\] :: \$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}') :: \[\e[0m\e[40m\e[1;41m\] LOCAL \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
	
	export LDFLAGS="-L/usr/local/opt/ruby/lib"
	export CPPFLAGS="-I/usr/local/opt/ruby/include"
	export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$HOME/bin:$PATH"

	# add some stuff to the path
	export PATH="/Users/frigodet/github/trimal/source:$PATH"

	# remove zsh warning
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

if [[ "$midway_server" =~ "$(uname -n)" ]]; then
	# load modules
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

	# make it pretty
    export PS1="\[\e[0m\e[40m\e[1;30m\] :: \$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}') :: \[\e[0m\e[40m\e[1;41m\] SSH://MIDWAY \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"

	# source the anvio port
	source /project2/meren/VIRTUAL-ENVS/shared/00_load_all.sh

	# add some programs to the PATH variable
	export PATH="$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/EXECUTABLES/"
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/Flye/bin
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/minimap2
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/reads-for-assembly
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/vsearch-2.14.1-linux-x86_64/bin
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/sratoolkit.2.9.6-1-centos_linux64/bin
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/SPAdes-3.13.0-Linux/bin	
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/idba-1.1.3/bin
fi


# -----------------------------------------------------------------------------
# }}} Penduick {{{
# -----------------------------------------------------------------------------

if [[ "$penduick_server" =~ "$(uname -n)" ]]; then
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/usr/local/bioware/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/usr/local/bioware/anaconda/etc/profile.d/conda.sh" ]; then
		. "/usr/local/bioware/anaconda/etc/profile.d/conda.sh"
	    else
		export PATH="/usr/local/bioware/anaconda/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	# make it pretty
    export PS1="\[\e[0m\e[40m\e[1;30m\] :: \$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}') :: \[\e[0m\e[40m\e[1;41m\] SSH://PENDUICK \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"


	PATH=$PATH:$HOME/.local/bin:$HOME/bin
	export PATH
	
	# Phyloflash db location
	export PHYLOFLASH_DBHOME=/scratch/work/florian/mydata/corrosion/fixed_potential/metagenomes/SHORT_READ_BASED/rRNA/138.1

	# custom tmp directory
	export TMPDIR=/scratch/work/florian/tmp
fi
