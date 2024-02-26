#!/usr/bin/env bash
# Author: Andres Court
# Date: 2023-11-09
# Description: Change active tmux session

tmux switch -t $(tmux ls -F "#{session_name}" | fzf --reverse --prompt="Select Session: ")
