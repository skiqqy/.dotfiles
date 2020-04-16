# .dotfilesMinimal
My setups used for my raspberry pi's/ VM's etc  

## __INSTALLING__  
clone the repo, then
* To install both vim and bashrc configs:
````
make
````
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
* To just install bashrc configs
````
make bash
````
##__Uninstalling__

To uninstall, simply type
````
make uninstall
````

##__TL;DR__  
just run this  
`cd;  
mkdir repos;  
cd repos;  
git clone https://github.com/skippy404/.dotfilesMinimal;  
cd .dotfilesMinimal;  
make
`
  
 __TERMINAL__
![TERMINAL](https://i.imgur.com/SQlMESF.png)
  
__VIM__
![VIM](https://i.imgur.com/UqgDLXc.png)
