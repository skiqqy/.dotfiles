# .dotfilesMinimal
[![Build Status](https://travis-ci.com/Skippy404/.dotfilesMinimal.svg?branch=master)](https://travis-ci.com/Skippy404/.dotfilesMinimal)

My setups used for my raspberry pi's/ VM's etc  

## __INSTALLING__  
clone the repo, then follow the instructions below, note when if it looks fozen
when vim opens, vim just isnt buffering because it is in a non-buffering state,
simply wait for the install to finish (depending on your internet speed, max 30
seconds for all the plugins to be downloaded)
* To install everything (vim, bash, zsh)
````
make
````

---

* To just install vim configs, Note when the installation is complete, open vim,
if there are [?] glyphs you must then change your terminal font to one of the
installed powerline fonts, I personally use 'hack'.
````
make vim
````

---

* To just install bash configs
````
make bash
````

---

* To just install zsh configs
````
make zsh
````

---

Alternatively, you can run the following, which also installs my
[tmux](https://github.com/skippy404/.tmux) configs at the same time (for this
method sudo is needed as dependencies are installed which require root
access).
````
wget yggpi.co.za/install.sh && chmod+x install.sh && ./install.sh
````

---

## __Uninstalling__

To uninstall, simply type
````
make uninstall
````
This reset's all your configs to the way they where before you installed, this
is achieved through the ~/.backup and ~/.backup/.df\* files. Note,
the `make uninstall` only uninstall's the components you selected, that is, say
you type `make bash`, bash configs will be installed, then when you type `make uninstall`,
only the bash configs will be uninstalled and restored, ie other configs (for example
vim configs will remain unaffected)

## __TL;DR__  
just run this  
````
cd
mkdir repos
cd repos
git clone https://github.com/skippy404/.dotfilesMinimal
cd .dotfilesMinimal  
make
````

 __Bash Config__
![BASH](https://i.imgur.com/SQlMESF.png)

__Zsh Config__
![ZSH](https://i.imgur.com/XB0u26e.png)

__Vim Config__
![VIM](https://i.imgur.com/UqgDLXc.png)
