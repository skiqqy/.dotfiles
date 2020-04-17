# .dotfilesMinimal
[![Build Status](https://travis-ci.com/Skippy404/.dotfilesMinimal.svg?branch=master)](https://travis-ci.com/Skippy404/.dotfilesMinimal)

My setups used for my raspberry pi's/ VM's etc  

## __INSTALLING__  
clone the repo, then
* To install both vim and bashrc configs:
````
make
````

---

* To just install vim configs, note when complete, open vim
(a warning complaining about 'gruvbox' will show, just hit enter), then type
`:PlugInstall`, wait for it to finish installing (approx 20 seconds max). Then
close vim (:q twice, too close both panes). To check that it was installed correctly
just type `vim`, and it should now look like the image below, if there are [?] glyphs
you must then change your terminal font to one of the installed powerline fonts,
i personally use 'hack'
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

## __TL;DR__  
just run this  
`cd;  
mkdir repos;  
cd repos;  
git clone https://github.com/skippy404/.dotfilesMinimal;  
cd .dotfilesMinimal;  
make
`

 __Bash Config__
![BASH](https://i.imgur.com/SQlMESF.png)

__Zsh Config__
![ZSH](https://i.imgur.com/XB0u26e.png)

__Vim Config__
![VIM](https://i.imgur.com/UqgDLXc.png)
