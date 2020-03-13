#!/bin/bash

function check_session(){
	session_name=$1
	if [[ `tmux ls | grep -w "$session_name"` ]]; then
		echo "alreay exist session $session_name"
	fi
}

function init_session(){
	session_name=$1
	first_windows=exp1
	second_windows=viid
	third_windows=download


	# first window is ssh * 4
	tmux new-session -n exp1 -s $session_name -d
	tmux send-keys -t ${session_name}:${first_windows}.0 " sshx exp1 y" Enter
	tmux split-window -h -t ${session_name}:${first_windows}.0
	tmux send-keys -t $session_name:exp1.1 " sshx exp1 y"  Enter

	tmux split-window -v -t ${session_name}:${first_windows}.0
	tmux send-keys -t $session_name:exp1.2 " sshx exp1 y"  Enter

	tmux split-window -v -t ${session_name}:${first_windows}.1
	tmux send-keys -t $session_name:exp1.3 " sshx exp1 y"  Enter

	# second window is for viid *2
	# i don't kwon why the fuck -c it not work 
	tmux  new-window -n ${second_windows} -t ${session_name}
	tmux send-keys -t ${session_name}:${second_windows}.0 "cd ~/git-repo/viid/java" Enter
	tmux split-window -h -t ${session_name}:${second_windows}.0 
	tmux send-keys -t ${session_name}:${second_windows}.1 "cd ~/git-repo/viid/java" Enter
	

	# third window for Download

	tmux new-window -n ${third_windows} -t ${session_name}
	tmux send-keys -t ${session_name}:${third_windows} "cd ~/Downloads" Enter

	# forth window is blank

	tmux new-window  -t ${session_name} 
	
}
session_name=$1

if [[ "$session_name" == "" ]]; then
	session_name="teko"
fi

check_session $session_name

init_session $session_name
