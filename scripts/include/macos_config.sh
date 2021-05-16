# Install the tools
xcode-select --install

# Configure git
git config --global user.name "NGX123"
git config --global user.email "NGX123"

# Change zsh to bash
brew install bash bash-completion
sudo sh -c "echo '/usr/local/bin/bash' >> /etc/shells"
chsh -s /usr/local/bin/bash && sudo chsh -s /usr/local/bin/bash

# Edit Bash configs
touch "$HOME"/.bash_profile "$HOME"/.bashrc
echo '. "$HOME"/.bashrc' >> "$HOME"/.bash_profile
echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> "$HOME"/.bash_profile
echo 'export CLICOLOR=1' >> "$HOME"/.bashrc

# echo "
# ---------------------------------------------------------------------------------------------------------
# 1. Check if VScode, Transmission, iTerm2, Vbox, Geany, MPV, Qemu and Google Chrome were installed
# 2. Check if vm, opt, src, .config, github folders were created
# 3. Try pushing commits to private repos to check if macos uses the nickname(NGX123) and not the real name
# ---------------------------------------------------------------------------------------------------------
# "
