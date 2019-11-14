# find by typing `uname -n`
export my_2019_macbook="MED42038.local"
export penduick_server="penduick"
export midway_server="midway2-login1.rcc.local:midway2-login2.rcc.local:midway-l16b-28.rcc.local:midway2-0701.rcc.local:midway2-0705.rcc.local:midway2-0706.rcc.local"

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
	
	# >>> ANVI'O STUFF >>>
	alias anvi-activate-master="source ~/virtual-envs/anvio-master/bin/activate"
	# <<< ANVI'O STUFF <<<
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

	# add some programs to the PATH variable
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/minimap2
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/sratoolkit.2.9.6-1-centos_linux64/bin
	export PATH=$PATH:/project2/meren/RESOURCES/PUBLIC/SOFTWARE/SPAdes-3.13.0-Linux/bin

	# perl stuff
	PATH="/home/trigodet/perl5/bin${PATH:+:${PATH}}"; export PATH;
	PERL5LIB="/home/trigodet/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
	PERL_LOCAL_LIB_ROOT="/home/trigodet/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
	PERL_MB_OPT="--install_base \"/home/trigodet/perl5\""; export PERL_MB_OPT;
	PERL_MM_OPT="INSTALL_BASE=/home/trigodet/perl5"; export PERL_MM_OPT;
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
