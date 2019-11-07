# -----------------------------------------------------------------------------
# SHARED BY ALL {{{
# -----------------------------------------------------------------------------

alias les='less -S'
alias ll='ls -alh'


# -----------------------------------------------------------------------------
# }}} MY MACBOOK {{{
# -----------------------------------------------------------------------------

# specific to my macbook
if [[ "$my_2019_macbook" =~ "$(uname -n)" ]]; then
	alias wd="cd "
	alias penduick='ssh trigodet@penduick.univ-brest.fr -Y'
	alias penduick-anvio='ssh -L 8090:localhost:8090 trigodet@penduick.univ-brest.fr -Y'
	alias penduick-extra_net='ssh trigodet@stockage.univ-brest.fr'
fi

# -----------------------------------------------------------------------------
# }}} MIDWAY {{{
# -----------------------------------------------------------------------------

# specific to midway
if [[ "$midway_server" =~ "$(uname -n)" ]]; then
    alias anvi-activate-master="conda activate /project2/meren/VIRTUAL-ENVS/anvio-master/; set_anvio_paths /project2/meren/VIRTUAL-ENVS/anvio-master"
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
