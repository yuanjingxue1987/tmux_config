# tmux_config
1. install tmux follow the steps that listed in "https://gist.github.com/pokev25/4b9516d32f4021d945a140df09bf1fde"
2. Link your config so that it can be applied to the tmux on your machine
```
ln -s {local_absolute_path_for_the_root_of_this_package}/.tmux.conf ~/.tmux.conf
```
3. install powerline and create log file for powerline:
```
sudo pip3 install powerline-status
touch /var/log/powerline.log
sudo chmod -R 777 /var/log/powerline.log
```

4. link powerline configs
```
ln -s {local_absolute_path_for_the_root_of_this_package}/powerline ~/.config/powerline
```
5. link the segments (custom segments)
```
ln -s {local_absolute_path_for_the_root_of_this_package}/segments/weat.py /usr/local/lib/python3.7/site-packages/powerline/segments/common/weat.py
ln -s {local_absolute_path_for_the_root_of_this_package}/segments/batt.py /usr/local/lib/python3.7/site-packages/powerline/segments/common/batt.py
```
6. config bash, append the following lines to the file '~/.bash_profile':
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {path_to_your_powerline_python_module}/bindings/bash/powerline.sh
```
## Switch to ZSH

1. install zsh
```
sudo apt install zsh
```

2. clone oh-my-zsh
```
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```
3. link zshrc
```
ln -s {local_absolute_path_for_the_root_of_this_package}/.zshrc ~/.zshrc
```

4. update path of powerline in .zshrc

5. add plugins for zsh (needs to add plugin name in ~/.zshrc):
* syntax highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
* auto suggestion
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
* 256 color
```
git clone https://github.com/chrissicool/zsh-256color.git ${zsh_custom:-~/.oh-my-zsh/custom}/plugins/zsh-256color
```

* load dir color db
```
update .zshrc, specity the right dir of the color schema db (the file named dircolors.256dark in this package)
```

6. install powerline-gitstatus
```
sudo pip3 install powerline-gitstatus
```
7. set zsh as your default shell
```
sudo chsh -s /bin/zsh {my username}

8. install tmux plugin manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

9. Press prefix + I to in tmux to install plugins
`
## Note
* if the segment changes, you need to run "powerline-daemon --replace" to reload powerline
* recommand font for the texts: Hack
* powerline log path: /var/log/powerline.log
