# Jest Testing Env Setup for Lunch-And-Learn

## Summary:
This setup includes all the configuration necessary to turn macOS into a more productive environment for the keyboard-driven software connoiseur. This includes a tiling window manager, some `vim`-driven keybindings, and assorted terminal configurations.

## Full Installation:
For an automatic(ish) install, run `init.sh` from inside this directory. `sudo` is not required. If any new shells or dialogs interrupt the installation process, installation will resume on completion of or `exit` from those processes.

## Installation Breakdown
While the full installation works swimmingly, most people will disagree with at least one part of my default configuration. To that end, here's a section-by-section run-through of the full installation:

1. __`.config` directory setup__:
```bash
# force rename to proper directory
if [ ! "$PWD" == "$HOME/.config" ]; then
  mv "$PWD" ~/.config/
fi
```

As spec'd out by the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html), `~/.config` should be where configurations live. Many applications fail to follow this rule, but it's a good starting place for dotfiles.


2. __dependency management (Homebrew)__:
```bash
if [ ! $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
```

Homebrew exposes the `brew` command for `apt` or `pacman`-like package installation and management for macOS.

3. __common dependencies__:
```bash
brew install ruby git fd bat neovim ripgrep htop fzf emojify httpie z tree
```

Using Homebrew, this line installs a number of useful tools. They are:

  * `ruby` and `git`: yes, macOS ships with built-in versions of both, but neither are kept up-to-date relative to their Homebrew counterparts. You can survive with outdated versions of both, but why bother?
  * `fd`: a drop-in replacement for `find` that's faster in just about every way. Integrates nicely with `fzf`, too.
  * `bat`: a faster, prettier, and more user-friendly replacement for `cat`.
  * `neovim`: my preferred editor when not using VS Code's Live Share features
  * `ripgrep`: a faster `grep` that also integrates closely with `neovim` and `fzf`. Called as `rg` from the terminal, saving you two keystrokes over `grep`
  * `htop`: like `top` for getting system info, but fancier. I have this running pretty much all the time to keep tabs on running processes and boost my hacker cred.
  * `fzf`: a general-purpose fuzzy finder. I use this as a replacement for manual `history` searching via the `CTRL-R` shortcut, and as a replacement for manual `cd`-ing to common directories via the `CTRL-G` shortcut provided by integration with `z`
  * `emojify`: this converts emoji shorthand (e.g. `:tada:`) into actual emoji. This is especially important for displaying [gitmoji](https://gist.github.com/rxaviers/7360908)-heavy `git` histories through commands like `git log --color | emojify | less`.
  * `httpie`: Like `curl`, but integrates directly with `jq` for `JSON` parsing and syntax higlighting, as well as defaulting to `application/json` content types for data transfer. Nice for testing `JSON` APIs, but not as versatile as raw `curl`.
  * `z`: a "frecency"-based file explorer used to jump directly to commonly-visited directories. This is used in conjunction with `fzf` for fast file system navigation.
  * `tree`: sometimes it's nice to see the nested directory structure of a project. `tree` is used to get a quick outline of the project structure (rather than manually `ls`-ing different directories).


4. __terminal configuration (`oh-my-zsh`)__:
```bash
export ZSH="$HOME/.config/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

My shell of choice is `zsh` over `bash` or `fish` (although `fish` is also a strong contender), and my shortcuts, plugins, and terminal themes are all managed through `oh-my-zsh`. At some point, I expect to set up `antigen` for plugin management, but this configuration is simple enough for the time being to get away with not using a dedicated terminal plugin manager.

5. __configuration symlinking__:
```bash
ln -sf ~/.config/.*rc ~
```

There's a bright future some day where all programs are configurable through the proper `.config` directory... but that future is not today. Some configuration files need to be placed in the `$HOME` directory, but we still want to manage those files through this repo. This step, then, symlinks any dotfile that ends in `rc` to the `$HOME` directory, since it just so that all offending programs installed by this setup happen to follow the `rc`-ending naming convention.

6.  __Node setup__:
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.zshrc
nvm install node
```

When working with JavaScript, I use `nvm` to manage node versions and global dependencies. This step sets up the required `nvm` command-line tools (including modifiying the proper `zsh` configuration files as necessary) and installing the latest version of `node`.

12. __NeoVim providers__:
```bash
pip3 install --user neovim
npm install -g neovim
gem install neovim
```

Rather than requiring compilation gymnastics (like `vim`), NeoVim uses external "provider" packages to expose NeoVim internals to plugins written in languages other than VimScript. These commands intall those providers for Python3, JavaScript, and Ruby, respectively. Run `:checkhealth` to verify that all providers are installed correctly and included in `$PATH`.

> You'll note the lack of Python2 support here. This is an intentional choice, as it's `$CURRENT_YEAR`, and Python2 should go the way of the Dodo. If a package requires Python2, I won't be using that package.

12. __iTerm themes__:
```bash
cp ~/.config/iTerm2/com.googlecode.iterm2.plist ~/Library/Preferences/
```

13. Docker:
We are installing docker and starting the service so that it runs when you start your machine

14. Yarn:
Use Yarn..... Its better

15. Google Cloud Utils
Because we use GCP I thought it would be nice to have the CLI tools

16. VS Code:
I am using VS Code and if you want to follow along with me, use VS Code. If not, know that I am silently judging you.

17. Slack (Dark):
Why the hell does slack not have a dark mode?? 🤷🏾‍.... Let's fix that..
