# find by typing `uname -n`
export my_2019_macbook="10-19-3-198.ddhcp.uni-oldenburg.de:vpn-172-26-2-159.awi.de;vpn-172-26-1-137.awi.de:MED42038-2.local:MED42038.local:med42038.lan:10-19-13-188.ddhcp.uni-oldenburg.de:med42038.home:10-19-14-39.ddhcp.uni-oldenburg.de"
export my_2023_macbook="134-1-39-58.awi.de;Mac;ohif01m027.home:10-17-3-15.ddhcp.uni-oldenburg.de:ohif01m027.w2kroot.uni-oldenburg.de:ohif01m027:ohif01m027.local:10-19-7-214.ddhcp.uni-oldenburg.de:10-19-6-209.ddhcp.uni-oldenburg.de"
export penduick_server="penduick"
export midway_server="midway2-login1.rcc.local:midway2-login2.rcc.local:midway-l16b-28.rcc.local:midway2-0701.rcc.local:midway2-0705.rcc.local:midway2-0706.rcc.local:midway2-0355.rcc.local"
export rosa_server="hpcl001;hpcl002;hpcl003;mpcs043;mpcs044;mpcs045;mpcs046;mpcs047;mpcs048;mpcs049;mpcs050;mpcs051;mpcs052;mpcs053;mpcs054;mpcs055;mpcs056"

# -----------------------------------------------------------------------------
# SHARED BY ALL {{{
# -----------------------------------------------------------------------------

# if you're scp-ing, we're done
if [ -z "$PS1" ]; then
    return
fi

# welcome message
if [ -f ~/.bash_welcome ]; then
    source ~/.bash_welcome
fi

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
# }}} MY MACBOOK 2023 {{{
# -----------------------------------------------------------------------------

if [[ "$my_2023_macbook" =~ "$(uname -n)" && -z "$1" ]] || [[ $1 == "mine" ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/fltrig002/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/fltrig002/miniconda/etc/profile.d/conda.sh" ]; then
            . "/Users/fltrig002/miniconda/etc/profile.d/conda.sh"
        else
            export PATH="/Users/fltrig002/miniconda/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # brew stuff
    eval "$(/opt/homebrew/bin/brew shellenv)"

	# make it pretty
    # export PS1="\[\e[0m\e[40m\e[1;30m\] :: \$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}') :: \[\e[0m\e[40m\e[1;41m\] LOCAL \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
    ENV='☕ LOCAL'; source ~/.bash_prompt

	export LDFLAGS="-L/usr/local/opt/ruby/lib"
	export CPPFLAGS="-I/usr/local/opt/ruby/include"
	export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$HOME/bin:/opt/homebrew/bin:$PATH"

  # ruby in the path
  export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
  # and you'll need that
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

	# remove zsh warning
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi


# -----------------------------------------------------------------------------
# }}} MY MACBOOK 2019 {{{
# -----------------------------------------------------------------------------

if [[ "$my_2019_macbook" =~ "$(uname -n)" && -z "$1" ]] || [[ $1 == "mine_old" ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/ftrigodet/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/ftrigodet/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/ftrigodet/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/ftrigodet/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

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
# }}} ROSA {{{
# -----------------------------------------------------------------------------

if [[ "$rosa_server" =~ "$(uname -n)" && -z "$1" ]] || [[ $1 == "rosa" ]]; then
    # load modules
    module load hpc-env/13.1
    #module load Miniconda3
    module load Mamba

    # go to the working directory
    cd $GROUPDSS && ll

    # change default group writing permission
    umask 0002

    # add programs to the PATH variable
    export PATH="$PATH:$GROUPDSS/SOFTWARE/EXECUTABLES:$HOME/bin:$HOME/.local/bin"

    # get your anvio port number
    source /fs/dss/groups/agecodatasci/SOFTWARE/SHARED/port_allocation

    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/cm/shared/uniol/sw/SYSTEM/Mamba/24.3.0-0/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/cm/shared/uniol/sw/SYSTEM/Mamba/24.3.0-0/etc/profile.d/conda.sh" ]; then
            . "/cm/shared/uniol/sw/SYSTEM/Mamba/24.3.0-0/etc/profile.d/conda.sh"
        else
            export PATH="/cm/shared/uniol/sw/SYSTEM/Mamba/24.3.0-0/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

	# make it pretty according to the login node vs compute node for interactive session
    #export PS1="\[\e[0m\e[40m\e[1;30m\] :: \$(echo \$CONDA_DEFAULT_ENV | awk -F '/' '{print \$NF}') :: \[\e[0m\e[40m\e[1;41m\] SSH://ROSA \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
    ENV='🖥️ SSH://ROSA'; source ~/.bash_prompt
fi

# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

if [[ "$midway_server" =~ "$(uname -n)" && -z "$1" ]] || [[ $1 == "midway" ]]; then
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

if [[ "$penduick_server" =~ "$(uname -n)"  && -z "$1" ]] || [[ $1 == "penduick" ]]; then
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
