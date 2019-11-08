# -----------------------------------------------------------------------------
# SHARED BY ALL {{{
# -----------------------------------------------------------------------------

alias les='less -S'
alias ll='ls -alh'
alias yu="yadm add -u; yadm commit -m '$(date)'; yadm push origin master"
alias ss="screen -S"
alias sls="screen -ls"
alias sx="screen -x"
alias sr="screen -r"
alias h="head -n"
alias t="tail -n"
alias col="column -t"
alias tlf="tail -f"
alias rmrf="rm -rf"
alias tarp="tar -zcvf"
alias untarp="tar -zxvf"
alias dush="du -sh"
alias rl="readlink -f"
alias mkdirp="mkdir -p"
alias ea="vim ~/.bash_aliases"
alias ei="vim ~/.inputrc"
alias eb="vim ~/.bashrc"
alias ep="vim ~/.bash_prompt"
alias et="vim ~/.talon/user/"
alias ev="vim ~/.vimrc"
alias sb="source ~/.bash_profile"


# -----------------------------------------------------------------------------
# }}} MY MACBOOK {{{
# -----------------------------------------------------------------------------

# specific to my macbook
if [[ "$my_2019_macbook" =~ "$(uname -n)" ]]; then
	alias wd="cd "
	alias penduick='ssh trigodet@penduick.univ-brest.fr -Y'
	alias penduick-anvio='ssh -L 8090:localhost:8090 trigodet@penduick.univ-brest.fr -Y'
	alias penduick-extra_net='ssh trigodet@stockage.univ-brest.fr'
	alias midway='ssh -L 8180:localhost:8180 -L 8181:localhost:8181 -L 8182:localhost:8182 -L 8183:localhost:8183 -L 8184:localhost:8184 -L 8185:localhost:8185 trigodet@midway2.rcc.uchicago.edu'
fi

# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

# specific to midway
if [[ "$midway_server" =~ "$(uname -n)" ]]; then
        alias anvi-activate-master="conda activate /project2/meren/VIRTUAL-ENVS/anvio-master/; set_anvio_paths /project2/meren/VIRTUAL-ENVS/anvio-master"
	alias meren="cd /project2/meren"
	alias wd="cd /project2/meren/RESOURCES/METAGENOMES/GUT/190723_MIN_Run_9/ANALYSIS"

	# easy way to remember to anvi-wokflow command
	alias snake="echo 'anvi-run-workflow -w FIXME -c config.json --additional-params --cluster \"clusterize -j={rule} -o={log} -e={log} -n={threads} -x\" --jobs FIXME --resource nodes=FIXME --latency-wait 100'"
fi

# -----------------------------------------------------------------------------
# }}} Penduick {{{
# -----------------------------------------------------------------------------

# specific to penduick
if [[ "$penduick_server" =~ "$(uname -n)" ]]; then
	alias scratch='cd /scratch/work/florian'
	alias bioware='cd /usr/local/bioware/'
	alias wd='cd /scratch/work/florian/mydata/corrosion/fixed_potential/metatranscriptomes'
fi
