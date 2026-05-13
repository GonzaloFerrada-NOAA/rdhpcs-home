# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# source /gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada/miniconda3/etc/profile.d/conda.sh

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ls='ls --color=auto'

# Set up GNU ls colors (works even if ~/.dircolors is absent)
if command -v dircolors >/dev/null; then
  eval "$(dircolors -b 2>/dev/null || dircolors -b)"
fi
# Ensure special styles for orphan/missing links
# export LS_COLORS="${LS_COLORS:+$LS_COLORS:}or=01;31:mi=01;37;41"

export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS="$(cat ~/LS_COLORS.hera)"
# bind 'set match-hidden-files off'
# bind 'set horizontal-scroll-mode off'

# Only run bind if the shell is interactive
if [[ $- == *i* ]]; then
  bind 'set match-hidden-files off'
  bind 'set horizontal-scroll-mode off'
fi

export TERM=xterm-256color
export TZ=UTC # Use UTC time, not eastern


# Common aliases:
alias date="date +'%b %e %H:%M'"
alias c='clear'
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias cd.......="cd ../../../../../.."
alias kk="ls -ltrh"
alias ll="ls -lh"
alias la="ls -la"
alias l1="ls -1"
alias ld="ls -lhd"
alias reload="clear; source ~/.bashrc"

export AAA="-d rrfs.db -w rrfs.xml"
alias rorun="rocotorun $AAA"
alias rostat="rocotostat $AAA"
alias roboot="rocotoboot $AAA"
alias rowind="rocotorewind $AAA"
alias rocheck="rocotocheck $AAA"
export monet="-d melodies-monet.verification.db -w melodies-monet.verification.xml"

# Shortcuts:
# export SC0="/scratch1/data_untrusted/Gonzalo.Ferrada"
export SC1="/gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada"
export SC2="/gpfs/f6/drsa-fire3/proj-shared/Gonzalo.Ferrada"
export SC3="/gpfs/f6/drsa-fire3/world-shared/Gonzalo.Ferrada"
alias sc1="cd $SC1"
alias sc2="cd $SC2"
alias sc3="cd $SC3"
alias rrfs="cd $SC3/rrfs"
alias ops="cd $SC3/opsroot"

alias mate="rmate"
alias acc="sacctmgr show assoc user=$USER format=cluster,partition,account%20,user%20,qos%60"
# alias grepi="grep -rnw . -e "
alias grepo="grep -rno . -e "
alias findi="find . -print | grep -i "
alias tf="tail -f "
alias weight="du -skh"
alias ncview="ncview -repl"




# Slurm:
# alias qsme="date; squeue --user=Gonzalo.Ferrada"
# alias qsme="date; squeue -u Gonzalo.Ferrada -O jobid:12,partition:12,qos:8,name:40,statecompact:3,timeused:10,timelimit:12,numnodes:6,nodelist"
alias qsme="date; squeue -u Gonzalo.Ferrada -O jobid:12,partition:12,qos:8,account:15,name:40,statecompact:3,timeused:10,timelimit:12,numnodes:6,numcpus:6,nodelist"
alias qs="date; squeue --start --user=Gonzalo.Ferrada"


# ------------------------------------------------------
# Application specifics:
# Python:
# export PATH=/scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada/miniconda3/bin:$PATH
# export PYTHONPATH=/scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada/HOME/PYTHON/FUNCTIONS

# Matlab:
export MATLABPATH="/gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada/.HOME/matlab-earth-sciences/fx"
alias loadmatlab='module load matlab; matlab -nodisplay -nodesktop -nosplash'

# ------------------------------------------------------
# Terminal beautification:
update_prompt() {
    DIR1=$(echo "$PWD" | cut -d/ -f2)               # Extract top-level directory
    DIR2=$(basename "$(dirname "$PWD")")           # Extract parent of current directory
    PS1="\[\033[31m\]\h:\[\033[32m\]$DIR1\[\033[37m\]:$DIR2\[\033[33m\]/\W\[\033[0m\]> "
}

PROMPT_COMMAND=update_prompt



# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/gpfs/f6/drsa-fire3/scratch/Gonzalo.Ferrada/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

