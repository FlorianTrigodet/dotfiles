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
alias ws="PS1=':: \$CONDA_DEFAULT_ENV :: [\u@\h \W]\$ '"

# -----------------------------------------------------------------------------
# }}} MY MACBOOK {{{
# -----------------------------------------------------------------------------

# specific to my macbook
if [[ "$my_2019_macbook" =~ "$(uname -n)" ]]; then
	alias wd="cd /Users/ftrigodet/Documents/PROJECT/FMT/INVERSIONS" 
	alias p="cd /Users/ftrigodet/Documents/PROJECT/"
    alias xl='open -a "Microsoft Excel"'
	alias oligotyping-activate-2.7="source ~/virtual-envs/oligotyping-2.7/bin/activate"
	alias oligotyping-activate-3.7="source ~/virtual-envs/oligotyping-3.7/bin/activate"
	alias penduick='ssh trigodet@penduick.univ-brest.fr -Y'
	alias penduick-anvio='ssh -L 8090:localhost:8090 penduick'
	alias penduick-extra_net='ssh trigodet@stockage.univ-brest.fr'
	alias midway='ssh -L 8180:localhost:8180 -L 8181:localhost:8181 -L 8182:localhost:8182 -L 8183:localhost:8183 -L 8184:localhost:8184 -L 8185:localhost:8185 midway | tee /dev/tty | python3 ~/.ssh/run_webbrowser.py'
    alias carl='ssh carl'
	anvi-activate-dev () {
	    conda activate anvio-dev
        export CONDA_DEFAULT_ENV="anvi'o dev"
	}
fi
# -----------------------------------------------------------------------------
# }}} CARL {{{
# -----------------------------------------------------------------------------

# specific to carl
if [[ "$carl_server" =~ "$(uname -n)" ]]; then
	anvi-activate-dev () {
	    conda activate ~/VIRTUAL-ENVS/anvio-dev/
        export CONDA_DEFAULT_ENV="anvi'o dev"
	}
    anvi-activate-7.1 () {
	    conda activate /project2/meren/PEOPLE/trigodet/VIRTUAL_ENV/anvio-7.1
        export CONDA_DEFAULT_ENV="anvi'o 7.1"
    }
	anvi-activate-flo () {
	    conda activate ~/VIRTUAL_ENVS/anvio-flo/
        export CONDA_DEFAULT_ENV="anvi'o flo"
	}
	alias ml="echo toto && pwd"
	alias wd="echo toto && pwd"

	# easy way to remember to anvi-wokflow command
	alias snake="echo 'clusterize -n 1 -j \"workflow\" \"anvi-run-workflow -w FIXME -c config.json --additional-params --cluster \\\"clusterize -j={rule} -o={log} -n={threads} -x\\\" --jobs FIXME --resource nodes=FIXME --latency-wait 100\"'"
	alias cl="clusterize"
	alias clh="column -t ~/.clusterize_history | tail"
	alias q="squeue --user=$USER -o '%11i %35j %5u %5C %13m %8T %10M %9l %6D %R'; echo ; \
		squeue --user=$USER -O 'arrayjobid:13,name:35,stdout:120'"
	alias qe="squeue --user=trigodet -o '%10i %30j %5u %8T %10M %9l %6D %R %5C %13m %15N'"
	alias sc="scancel"
	alias si="sinteractive --partition=meren --time=08:00:00 --mem=15G --exclude midway-l16b-28"
fi


# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

# specific to midway
if [[ "$midway_server" =~ "$(uname -n)" ]]; then
	anvi-activate-dev () {
	    conda activate /project2/meren/VIRTUAL-ENVS/anvio-dev/
        export CONDA_DEFAULT_ENV="anvi'o dev"
	}
    anvi-activate-7.1 () {
	    conda activate /project2/meren/PEOPLE/trigodet/VIRTUAL_ENV/anvio-7.1
        export CONDA_DEFAULT_ENV="anvi'o 7.1"
    }
	anvi-activate-flo () {
	    conda activate /project2/meren/PEOPLE/trigodet/anvio-flo/
        export CONDA_DEFAULT_ENV="anvi'o flo"
	}
	oligotyping-activate-3-7 () {
	    source /project2/meren/VIRTUAL-ENVS/oligotyping-python3.7/bin/activate
        export CONDA_DEFAULT_ENV="oligotyping 3.7"
	}
	alias ml="cd /project2/meren && pwd"
	alias fl="cd /project2/meren/PEOPLE/trigodet && pwd"
	alias wd="cd /project2/meren/PROJECTS/FMT/2017-Louie-Samples/INVERSION/INVERSION_ANVIO && pwd"
	alias wdfmt="cd /project2/meren/PROJECTS/FMT/2017-Louie-Samples && pwd"
	alias wdhmw="cd /project2/meren/PROJECTS/ORAL/HMW_METHOD_PAPER/SHORT_READS && pwd"
        alias midway="ssh midway2-login2.rcc.local"

	# easy way to remember to anvi-wokflow command
	alias snake="echo 'clusterize -n 1 -j \"workflow\" \"anvi-run-workflow -w FIXME -c config.json --additional-params --cluster \\\"clusterize -j={rule} -o={log} -n={threads} -x\\\" --jobs FIXME --resource nodes=FIXME --latency-wait 100\"'"
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
	alias wd='cd /scratch/work/florian/mydata/corrosion/fixed_potential/PANGENOME_TENDERIA'
	anvi-activate-dev () {
	    module load Anvio-master 
            cd /usr/local/bioware/github/anvio/ && git pull && cd - && conda activate /usr/local/bioware/conda-envs/anvio-master
        export CONDA_DEFAULT_ENV="anvi'o dev"
	}
	alias FastTree='FastTreeMP'
fi
#test
