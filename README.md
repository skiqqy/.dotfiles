# .dotfilesMinimal
[![Build Status](https://travis-ci.com/Skippy404/.dotfilesMinimal.svg?branch=master)](https://travis-ci.com/Skippy404/.dotfilesMinimal)

My setups used for my raspberry pi's/ VM's etc  

## Installing  
clone the repo, then follow the instructions below, note when if it looks fozen
when vim opens, vim just isnt buffering because it is in a non-buffering state,
simply wait for the install to finish (depending on your internet speed, max 30
seconds for all the plugins to be downloaded)
* To install everything (vim, bash, zsh)
````
make
````

---

* To just install vim configs,
````
make vim
````

---

* To just install bash configs,
````
make bash
````

---

* To just install zsh configs,
````
make zsh
````

### Installing Custom

You can further customize the configs, by using `c<target>` during installation,
examples are show below,

* install everything + a custom bash config,
````
make all cbash
````

* just install bash configs, and customize it,
````
make bash cbash
````

---

* Alternatively, you can run the following, which also installs my
[tmux](https://github.com/skippy404/.tmux) configs at the same time (for this
method sudo is needed as dependencies are installed which require root
access).
````
curl -O yggpi.co.za/install.sh && bash install.sh
````

---

### FAQS

* vim:
	* if there are [?] glyphs you must then change your terminal font to one of
	  the installed powerline fonts, I personally use 'hack'.

* bash:
	* The prompt is setup like so: `[<name>@<hostname>] -[git-status 'flag']-> [<time>] <pwd>`
	* `name` -> your username.
	* `hostname` -> your hostname.
	* `[git-status 'flag']` -> is only present when inside a repository, and
	instead of 'git-status' it displays the current branch, and has flags present
	based on the repo status, specifically,
	    * `!` -> File(s) has been modified/ is unstaged.
	    * `?` -> File(s) is not being tracking.
	    * `+` -> File(s) have been added to be tracked.
	    * `>` -> File(s) have been renamed.
	    * `x` -> File(s) have stopped being tracked (ie deleted from repo).
	    * `*` -> Commits have not been pushed.
	* Note, these 'flags' can be grouped, an example is show:
	    * `user@pc[master !?]23:28~/repo1` -> In order of flag appearence, on
	    'master' branch, modified/unstaged file, and an untracked file.
	    * `user@pc[test_branch x+?*]23:28~/repo2` -> In order of flag appearence,
	    on 'test_branch', with a file has been untracked/ deleted, a file that
		has been tracked, an untracked file, and commits that have not been pushed.
	* `pwd` -> is your current path.
* Macos + bashrc + zsh
	* Macos freaks out with my alias setup for ls, as a result when you `ls`
	  a warning is shown, to fix this, simply edit ~/.bashrc or ~/.zshrc (which
	  ever one you are using), and just removed the appropriate aliases, that
	  is, delete the lines with 'ls -Fh --color=auto'. I keep it in the bashrc
	  and zshrc since i dont use MacOS, muh arch linux.

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
