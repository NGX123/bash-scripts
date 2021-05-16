# Remove default XDG folders
mkdir -p "$HOME"/.stdfldrs
cat "$textfiles_dir"/dirs > "$HOME"/.config/user-dirs.dirs
rm -rf "$HOME"/Music "$HOME"/Pictures "$HOME"/Public "$HOME"/Templates "$HOME"/Videos
