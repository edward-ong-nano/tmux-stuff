#!/bin/sh

SESSION="dev" 
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION) # Only create tmux session if it doesn't already exist if [ "$SESSIONEXISTS" = "" ]

if ["$SESSIONEXISTS" = ""]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Start Larry development pane
    tmux rename-window -t 0 'Larry dev'
    tmux send-keys -t 'Larry dev' 'cd ~/development-environment/backend_dir/' C-m 'clear' C-m # Switch to bind script?
    tmux send-keys -t 'Larry dev' 'source /Users/edward.ong/.local/share/virtualenvs/backend_dir-Q94xGAis/bin/activate' C-m 'clear' C-m # Switch to bind script?

    # Start Larry envvars pane
    tmux new-window -t $SESSION:1 -n 'Larry envvars'
    tmux send-keys -t 'Larry envvars' 'cd ~/development-environment/backend_dir/deploy/gus_and_larry/variables/' C-m 'clear' C-m # Switch to bind script?

fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
