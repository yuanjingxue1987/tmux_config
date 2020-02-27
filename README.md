# tmux_config
1. install tmux follow the steps that listed in "https://gist.github.com/pokev25/4b9516d32f4021d945a140df09bf1fde"
2. Link your config so that it can be applied to the tmux on your machine
```
ln -s {local_absolute_path_for_the_root_of_this_package}/.tmux.conf ~/.tmux.conf
```
3. install powerline:
```
sudo pip3 install powerline-status
```

4. link powerline config
```
mkdir ~/.config/powerline
ln -s {local_absolute_path_for_the_root_of_this_package}/config_powerline.json ~/.config/powerline/config.json
```
5. link the color schemes
```
ln -s {local_absolute_path_for_the_root_of_this_package}/colorschemes ~/.config/powerline/colorschemes
```

6. link the themes
```
ln -s {local_absolute_path_for_the_root_of_this_package}/themes ~/.config/powerline/themes
```

7. link the weather segment
```
ln -s {local_absolute_path_for_the_root_of_this_package}/segments/weat.py /usr/local/lib/python3.7/site-packages/powerline/segments/common/weat.py
```
8. config bash, append the following lines to the file '~/.bash_profile':

```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {path_to_your_powerline_python_module}/bindings/bash/powerline.sh
```
## Switch to ZSH

1. install zsh

2. clone oh-my-zsh
```
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```
3. link zshrc
```
ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc``
```

4. update ~/.zshrc, add powerline config
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {local_absolute_path_for_python_lib}/dist-packages/powerline/bindings/zsh/powerline.zsh
```

## Note
* if the segment changes, you need to run "powerline-daemon --replace" to reload powerline
* recommand font for the texts: Hack
