# -----------------------------------------------------------------------------
# SHARED BY ALL {{{
# -----------------------------------------------------------------------------

alias les='less -S'
alias ll='ls -alh'
alias lrt="ls -alhrt"
alias yu="yadm add -u; yadm commit -m '$(date)'; yadm push origin master"
alias ss="screen -S"
alias sls="screen -ls"
alias sx="screen -x"
alias sr="screen -r"
alias h="head -n"
alias t="tail -n"
alias col="column -t"
alias rmrf="rm -rf"
alias tlf="tail -f"
alias tarp="tar -zcvf"
alias untarp="tar -zxvf"
alias dush="du -sh"
alias rl="readlink -f"
alias mkdirp="mkdir -p"
alias ea="vim ~/.bash_aliases"
alias ei="vim ~/.inputrc"
alias eb="vim ~/.bashrc"
alias ev="vim ~/.vimrc"
alias sb="source ~/.bash_profile"
alias sedt="sed 's/\t/ | /g'"

# -----------------------------------------------------------------------------
# }}} MY MACBOOK {{{
# -----------------------------------------------------------------------------

# specific to my macbook
if [[ "$my_2019_macbook" =~ "$(uname -n)" ]]; then
	alias wd="cd /Users/frigodet/Documents/PROJET/UC_POUCHITIS/INVERSIONS" 
	alias p="cd /Users/frigodet/Documents/PROJET/"
	alias oligotyping-activate-2.7="source ~/virtual-envs/oligotyping-2.7/bin/activate"
	alias oligotyping-activate-3.7="source ~/virtual-envs/oligotyping-3.7/bin/activate"
	alias penduick='ssh trigodet@penduick.univ-brest.fr -Y'
	alias penduick-anvio='ssh -L 8090:localhost:8090 penduick'
	alias penduick-extra_net='ssh trigodet@stockage.univ-brest.fr'
	alias midway='ssh -L 8180:localhost:8180 -L 8181:localhost:8181 -L 8182:localhost:8182 -L 8183:localhost:8183 -L 8184:localhost:8184 -L 8185:localhost:8185 midway | tee /dev/tty | python3 ~/.ssh/run_webbrowser.py'
	anvi-activate-dev () {
	    conda activate anvio-master && source ~/virtual-envs/anvio-master/bin/activate
	    export PS1="\[\e[0m\e[40m\e[1;30m\] :: anvi'o dev :: \[\e[0m\e[40m\e[1;41m\] LOCAL \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
	}
fi

# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

# specific to midway
if [[ "$midway_server" =~ "$(uname -n)" ]]; then
	anvi-activate-dev () {
	    conda activate /project2/meren/VIRTUAL-ENVS/anvio-dev/
	    export PS1="\[\e[0m\e[40m\e[1;30m\] :: anvi'o dev :: \[\e[0m\e[40m\e[1;41m\] SSH://MIDWAY \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
	}
	oligotyping-activate-3-7 () {
	    source /project2/meren/VIRTUAL-ENVS/oligotyping-python3.7/bin/activate
	    export PS1="\[\e[0m\e[40m\e[1;30m\] :: oligotyping 3.7 :: \[\e[0m\e[40m\e[1;41m\] SSH://MIDWAY \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
	}
	alias ml="cd /project2/meren && pwd"
	alias wd="cd /project2/meren/PROJECTS/UC_POUCHITIS/INVERSIONS/ && pwd"
	alias wdfmt="cd /project2/meren/PROJECTS/FMT/2017-Louie-Samples && pwd"
	alias wdhmw="cd /project2/meren/PROJECTS/ORAL/HMW_METHOD_PAPER/SHORT_READS && pwd"
        alias midway="ssh midway2-login2.rcc.local"

	# easy way to remember to anvi-wokflow command
	alias snake="echo 'anvi-run-workflow -w FIXME -c config.json --additional-params --cluster \"clusterize -j={rule} -o={log} -n={threads} -x\" --jobs FIXME --resource nodes=FIXME --latency-wait 100'"
	alias cl="clusterize"
	alias clh="column -t ~/.clusterize_history | tail"
	alias q="sinfo --partition=meren -N -o '%N %P %11T %20E %C %8m %8e %8d'; echo ; \
		squeue --partition=meren -o '%11i %35j %5u %5C %13m %8T %10M %9l %6D %R'; echo ; \
		squeue --partition=meren --user=$USER -O 'arrayjobid:13,name:35,stdout:120'"
	alias qe="squeue --user=trigodet -o '%10i %30j %5u %8T %10M %9l %6D %R %5C %13m %15N'"
	alias sc="scancel"
	alias si="sinteractive --partition=meren --time=08:00:00 --mem=15G --exclude midway-l16b-28"

fi

# -----------------------------------------------------------------------------
# }}} Penduick {{{
# -----------------------------------------------------------------------------

# specific to penduick
if [[ "$penduick_server" =~ "$(uname -n)" ]]; then
	alias scratch='cd /scratch/work/florian'
	alias q='htop'
	alias bioware='cd /usr/local/bioware/'
	alias wd='cd /scratch/work/florian/mydata/corrosion/fixed_potential/metagenomes'
	anvi-activate-dev () {
	    module load Anvio-master
            anvi-activate-master
	    export PS1="\[\e[0m\e[40m\e[1;30m\] :: anvi'o dev :: \[\e[0m\e[40m\e[1;41m\] SSH://PENDUICK \[\e[0m\e[0m \[\e[1;34m\]\]\w\[\e[m\] \[\e[1;31m\]\n>>>\[\e[m\] \[\e[0m\]"
	}
	alias FastTree='FastTreeMP'
fi
#test
