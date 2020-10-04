# Configurations for extra stuff for the main script

# NANO
if [ $configurenano == y ]; then
    touch .nanorc
    mkdir $HOME/.config/nano
fi
