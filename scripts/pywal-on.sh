#!/bin/bash

cd $HOME
echo "(cat ~/.cache/wal/sequences &)" >> $HOME/.zshrc
echo "local pywal = require('pywal') pywal.setup()" >> $HOME/.config/nvim/init.lua
