
* [Purpose](#purpose)
* [What is this](#what-is-this)
* [What is NOT](#what-is-not)
* [Manage plugins](#manage-plugins)
  * [Skip plugins](#skip-plugins)
  * [Install a plugin](#install-a-plugin)
* [Minimal Working Examples](#minimal-working-examples)
  * [🐍 MWE](#MWE-Python)
  * [</> JS](#MWE-JS)
* [Bonus](#bonus)
* [FAQs](#faqs)
  * [Neo-/Vim files are somehow owned by root](#neo-/vim-files-are-somehow-owned-by-root)
  * [Vimspector plugin fails](#vimspector-plugin-fails)
* [TODOs](#todos)
  * [General](#general)
  * [🐍 Python](#TODOs-Python)
  * [</> WebDev](#TODOs-WebDev)
* [License](#license)

## Purpose
- Out of the box installation of Neo-/Vim and its most popular plugins for **Ubuntu** users. Just run these steps:

Step 1 - **Clone** this repo
```sh
sudo apt install -y git && \
  git clone https://github.com/juanMarinero/vim-install-basic && \
  cd vim-install-basic
```

Step 2 - **Install** Vim or NeoVim
- For Vim
```sh
chmod +x install/Vim/install.sh && \
  install/Vim/install.sh
```

- For Neovim
```sh
chmod +x install/NeoVim/install.sh && \
  install/NeoVim/install.sh
echo 'vim() { nvim "$@"; }' >> ~/.bashrc
```

Step 3: reboot
```sh
sudo reboot
```

Step 4: Install **plugin** dependencies, plugins and their postinstalls. Run each line 1 by 1. To exit each Neo-/Vim run `:qa`.
```sh
cd vim-install-basic
vim +PlugInstall  # wait till shows "- Post-update hook for coc.nvim ... OK". Check :CocInfo and :VimspectorToggleLog
vim -c "source plugins/coc.nvim/postinstall2.vim" # See details :CocInfo
source plugins/coc.nvim/postinstall3.sh
vim -c "source plugins/coc.nvim/postinstall4.vim" file.c # takes a while
vim -c "source plugins/vimspector/postinstall.vim"       # takes a while, check :VimspectorToggleLog
source plugins/vimspector/postinstall.sh
```

See [video](https://github.com/juanMarinero/vim-install-basic/raw/refs/heads/main/videos/VimInstallationStep3.mp4).

Other purposes:
- To get familiar with Neo-/Vim and its most used plugins directly, not worrying about installation nor settings
- Modular Neo-/Vim config and install files:
  - To quick check, in Ubuntu, how to install popular plugins. E.g. coc.nvim prerequisites, see [plugins/coc.nvim/dependencies.sh](./plugins/coc.nvim/dependencies.sh)],  and post-installs like:  [plugins/coc.nvim/postinstall*](./plugins/coc.nvim/).
   - This modular approach helps to customize (and learn) Vim features and plugins.
```
README.md
.vimrc
install
  |_ Vim
    |_ ...
  |_ NeoVim
    |_ ...
general
  |_ mappings.vim
  |_ settings.vim
plugins
  |_ ale
    |_ mappings.vim
    |_ settings.vim
    |_ prerequisites.sh
    |_ postinstall.vim
    |_ filetype
      |_ ...
  |_ ...
 VirtualManager.md
 ...
```

## What is this

- This is a **modest Neo-/Vim config**uration ready to install and use in **Ubuntu**
- It's for both Vim and NeoVim. That's why:
  - the plugins selected are compatible for boths
  - and it's configured with vimscripts (`.vim` extension) instead of Lua scripts.
  - Though one can easily edit/expand the configs for Vim-only or NeoVim-only.
- It's a quick example of how to set up a basic Python or Javascript project. Emphasis on linters and debugging. See the [MWE](#minimal-working-examples) section.


## What is NOT
- It's not a detailed preconfiguration for Neo-/Vim. For a stronger NeoVim only preconfiguraion see [NvChad](https://nvchad.com/docs/quickstart/install) in [bonus](#bonus).
- It's not a swiss-knife for every user:
  - It's focused on 🐍 Python developers. Though tools like [ALE](https://github.com/dense-analysis/ale) and [coc.nvim](https://github.com/neoclide/coc.nvim) ([vim-fugitive](https://github.com/tpope/vim-fugitive), [vim-test](https://github.com/vim-test/vim-test),...) are gold for all.
  - It's for **Ubuntu**, and alike, OS users. Not for Mac nor Windows. See how to install Ubuntu in **Virtual Manager** in [VirtualManager.md](./VirtualManager.md).
  - Plugins are installed via [junegunn/vim-plug](https://github.com/junegunn/vim-plug). See [vimawesome.com](https://vimawesome.com/) for other Vim plugin managers.


## Manage plugins

### Skip plugins

To not install some/all plugins follow next steps.
Alternative install them all (see ##purpose) and then comment respective plugin lines of .vimrc (see step 2 below) to just not load them. If desired to use those then uncomment previous commented lines. This approach works if `:PlugClean` is not run, otherwise read [install-a-plugin](#install-a-plugin).

0. Clone this repo and change to its directory
```sh
git clone https://github.com/juanMarinero/vim-install-basic
cd vim-install-basic
```

1. A Move [plugins](./plugins) directory so `install.sh` cannot find it.
```
mv -r ./plugins ./plugins.bak
```
1. B Alternative if just few plugins not to install then loop it. For example:
```
plugins_skip=["coc.nvim" "ale"] # customize
```
And run
```sh
mkdir -p plugins.bak
for plugin in $plugins; then
   mv -r ./plugins/$plugin ./plugins.bak/$plugin
end
```

2. Comment desired lines in-between `plug#start` and `plug#end` of [.vimrc](./.vimrc). So `:PlugInstall` does not install them.


3. And run `install/<NeoVim or Vim>/install.sh`, `vim +PlugInstall`, etc. described in [purpose](#purpose).


### Install a plugin

To install an skipped plugin of previous section

1. Add/uncomment next 3 lines in-between `plug#start` and `plug#end` of [.vimrc](./.vimrc) for the desired plugin. For example uncomment
```
" Plug 'puremourning/vimspector'
" source plugins/vimspector/settings.vim
" source plugins/vimspector/mappings.vim
```

2.  Set plugin to add. For example
```
plugin="vimspector"
```

3. Change directory to this cloned repo `cd vim-install-basic` and run
```
cp -r plugins.bak/$plugin plugins/$plugin
./plugins/$plugin/prerequisites.sh
vim +PlugInstall
vim -c "source plugins/$plugin/postinstall.vim"
```

Note coc.nvim has several postinstall scripts to run in vim or shell. See [plugins/coc.nvim/README.md](./plugins/coc.nvim).

## Minimal Working Examples

### <a id="MWE-Python"></a>🐍 MWE

Next is a simple Python project to mainly demonstrate:
- How ALE linters show warnings and errors. And fixers like `black` auto correct some.
- How Coc.nvim suggests code
- How Vimspector debugs

Steps:
```sh
cd vim-install-basic
```

Then run
```sh
dir=$HOME/MWE_Python
mkdir -p $dir && cd $dir

venv_dir="venv"
python3 -m venv "$venv_dir"
source $venv_dir/bin/activate
which python # check

# ✨ 🍰 ✨ ALE linters & fixers
cd -
source plugins/ale/filetype/python/python.sh
cp -av plugins/ale/filetype/python/config_files/. "$dir"

# 🔍🪲 vimspector debugger
source plugins/vimspector/filetype/python/python.sh
cp -av plugins/vimspector/filetype/python/config_files/. "$dir"
vim -c "source plugins/vimspector/filetype/python/python.vim" file.py # wait and exit
```

And debug on an example script
```sh
[ -d "$dir" ] && cd "$dir"
wget -O main.py https://raw.githubusercontent.com/puremourning/vimspector/refs/heads/master/support/test/python/simple_python/main.py && \
  sed -i -e 's/\b100\b/10/g' -e 's/\b99\b/7/g' -e 's/\b18\b/2/g' main.py && \
  black main.py

sleep 2
vim -c "call vimspector#SetLineBreakpoint('main.py',13,{ 'condition': 'i == 3 or i == 7' })" \
    -c "call vimspector#SetLineBreakpoint(expand('%'), 25)" \
    -c "call vimspector#Launch()" \
    -c "VimspectorWatch i" \
    -c "VimspectorWatch t._var | VimspectorWatch self._var" \
    -c "VimspectorWatch hex(id(self))  | VimspectorWatch hex(id(t))" \
    -c 'sleep 2 | execute "wincmd j" | execute "wincmd L" | execute "wincmd h"' \
    -c 'sleep 1 | vertical resize +25 | resize +10 | execute "normal zR"' \
    main.py
```

In Viminspector execute step-ins (`:call vimspector#StepInto()`), continues (`:call vimspector#Continue()`),... Observe how conditional breakpoints pause it at `i` 3 and 7.

### <a id="MWE-JS"></a></> JS

```sh
cd vim-install-basic
```

Then run
```sh
repo_dir="$HOME/Downloads/vimspector"
git clone https://github.com/puremourning/vimspector "$repo_dir"

dir=$HOME/MWE_JS
mkdir -p $dir && cd $dir
cp -arv "$repo_dir/support/test/web/." .
rm -rf "$repo_dir"

# Add an HTML button that runs the desired `console.log` command
file="www/index.html"
line_to_add='   <button type="button" onclick="console.log(calculate(5,1))">Click Me to calculate(5,1)</button>'
total_lines=$(wc -l < "$file")
insert_line=$((total_lines - 1)) # Subtract 1 from the total number of lines
sed -i "${insert_line}i\ $line_to_add" "$file" # Insert the new line at the calculated position

# ✨ 🍰 ✨ ALE linters & fixers
cd -
cp -av plugins/ale/filetype/javascript/config_files/. "$dir"
cp plugins/ale/filetype/javascript/javascript.sh "$dir"
cd - && ./javascript.sh && rm javascript.sh && cd -

# 🔍🪲 vimspector debugger
source plugins/vimspector/filetype/javascript/javascript.sh
sudo apt install -y moreutils
deb="$dir/.vimspector.json"
jq '.configurations = {chrome: .configurations.chrome}' "$deb" | sponge "$deb"
jq '.configurations.chrome += {"breakpoints": {"exception": {"all": "", "uncaught": ""}}}' "$deb" | sponge "$deb"
vim -c "source plugins/vimspector/filetype/javascript/javascript.vim" file.js # wait and exit
```

And debug `www/js/test.js`
```sh
[ -d "$dir" ] && cd "$dir"

# Port 1234
# chmod +x run_server && ./run_server # if PHP installed
nohup python3 -m http.server 1234 > /dev/null 2>&1 & # Serving HTTP on 0.0.0.0 port 1234 (http://0.0.0.0:1234/)
ss -tulnp | grep 1234 # Check

# Note: breakpoint at line 27 to watch variable values of last loop iter
vim -c "call vimspector#SetLineBreakpoint(expand('%'), 24)" \
    -c "call vimspector#SetLineBreakpoint(expand('%'), 27)" \
    -c "call vimspector#Launch()" \
    -c "VimspectorWatch a | VimspectorWatch b | VimspectorWatch i" \
    -c "execute 'normal 24ggzv'" \
    www/js/test.js
```

Previous command `:call vimspector#Launch()` opens the respective adapter-browser, there open the `www` website. Then:
- Run for example the command `calculate(5,1)`:
  - Opt. A: in the console window of Vimspector run (to insert text press 'i'): `calculate(5,1)`
  - Opt. B: in browser's console (Open Web-Developer-Tools with Ctrl+Shift+I and go to tab *Console*) run `calculate(5,1)`
  - Opt. C: in browser click the HTML button that says `Click Me to calculate(5,1)`

In Viminspector execute step-ins (`:call vimspector#StepInto()`), continues (`:call vimspector#Continue()`),... observe how variables `a`, `b` and `i` evolve.

Alternative use the Google-Chrome debugger:
- Open Web-Developer-Tools (Ctrl+Shift+I)
- Go to tab *Sources*
- Open the tab of the JS file

Note that the Google-Chrome debugger window gets on top when a Vimspector command is run, solve this closing the Google-Chrome debugger (Ctrl+Shift+I toggles it).


Free the port when done debugging
```sh
sudo pkill -9 -f "python3 -m http.server 1234"
ss -tulnp | grep 1234 # Check
```


## Bonus

🔍 To search:
- Vim maps use `:Maps` or `,m`. See [fzf.vim cusotme maps](./plugins/fzf.vim/mappings.vim)
- Vim maps definition script use `,fV`. See [Search.vim](./plugins/miscellaneous/Search.vim)
- All Vim settings, docs,.. use `,fVa`. See [Search.vim](./plugins/miscellaneous/Search.vim)

🗿 [NvChad](https://nvchad.com/docs/quickstart/install)
- Supercharged NeoVim with many popular plugins
- The configs, written in Lua, are designed to be easily edited
- It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for package management

## FAQs

### Neo-/Vim files are somehow owned by root
Do **not** run `sudo -E install/install.sh` ( nor `sudo -E`), just run `install/Vim/install.sh`. If a script is executed with `sudo` it's like the `root` runs it. For example we want to [make]-install Vim in a dir owned by the current user (`whoami`), not by the `root`.

### Vimspector plugin fails
- See MWEs above. Apply alike for your file extension.
- Check official examples [vimspector/support/test](https://github.com/puremourning/vimspector/tree/master/support/test)


## TODOs

### General
- Add [vim-fugitive](https://github.com/tpope/vim-fugitive) and [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- Add [vim-test](https://github.com/vim-test/vim-test)
- Add ctags with [preservim/tagbar](https://github.com/preservim/tagbar) or [liuchengxu/vista.vim](https://github.com/liuchengxu/vista.vim)
- Add an informative status bar [vim-airline](https://github.com/vim-airline/vim-airline)
- Add [undotree](https://github.com/mbbill/undotree)

### <a id="TODOs-Python"></a>🐍 Python
- Add [jupyter-vim](https://github.com/jupyter-vim/jupyter-vim) as a qtconsole plugin

### <a id="TODOs-WebDev"></a></> WebDev
- Add JS-HTML-CSS-live-preview [turbio/bracey.vim](https://github.com/turbio/bracey.vim/)
- Add an abbreviation expander [emmet-vim](https://github.com/mattn/emmet-vim)

## License
GNU General Public License. **GPLv3** or newer.
