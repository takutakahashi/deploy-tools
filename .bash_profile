if [ x$TERM = xdumb ]; then
    export TERM=xterm-256color
    exec >/dev/tty 2>/dev/tty </dev/tty
    cd $HOME
fi
