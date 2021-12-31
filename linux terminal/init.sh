#! /bin/sh
base_dir=$(cd "$(dirname "$0")";pwd)

# installed zsh...

echo " install oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo " download zsh plugins"
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo " chang oh-my-zsh conf"
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"ys\"/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

cp $(pwd)/config/tmux.conf ~/.tmux.conf
echo "alias tmux='TERM=xterm-256color tmux'" ~/.zshrc

chsh -s /bin/zsh
exec -l /bin/zsh

