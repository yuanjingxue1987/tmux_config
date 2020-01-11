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

5. link the tmux theme
```
mkdir ~/.config/powerline/themes
ln -s {local_absolute_path_for_the_root_of_this_package}/tmux ~/.config/powerline/themes/tmux
```

6. link the weather segment
```
ln -s {local_absolute_path_for_the_root_of_this_package}/segments/weat.py /usr/local/lib/python3.7/site-packages/powerline/segments/common/weat.py
```
7. config bash, append the following lines to the file '~/.bash_profile':
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {path_to_your_powerline_python_module}/bindings/bash/powerline.sh
```

recommand font for the texts: Hack
