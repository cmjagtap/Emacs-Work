#!/bin/sh
# Author Chandramohan Jagtap
# Run file as `sh script.sh <option> <Installation path>`

if [ "$1" = "installEvil" ]; then
  tar -xzvf emacs-25.3.tar.gz 		#downloaded source code 
  sudo apt-get install autoconf -y 	#dependancy
  sudo apt-get install automake -y
  cd emacs-25.3
  sh autogen.sh
  sh ./configure --with-gif=no --with-tiff=no --prefix=$2 #argument $2 is path of installation
  make
  make install
  cd ..
  unzip evil-master.zip		#downloaded evil source code
  cd evil-master
  make emacsPath=$2  			#emacspath argument is path of emacs for configuration of evil mode
  make terminal emacsPath=$2		#run evil mode
fi

if [ "$1" = "installOrg" ]; then
  tar -xzvf emacs-25.3.tar.gz 		#downloaded source code 
  sudo apt-get install autoconf -y 	#dependancy
  sudo apt-get install automake -y
  cd emacs-25.3
  sh autogen.sh
  sh ./configure --with-gif=no --with-tiff=no --prefix=$2/org-mode/ #argument $2 is path of installation
  make
  make install
  cd ..
  unzip org-mode-master.zip			#downloaded org source code
  cd org-mode-master/org-mode/
  make emacsPath=$2/org-mode/			#Compiling org mode with emacs path
  make autoloads emacsPath=$2/org-mode/
  echo "(setq load-path (cons "$(pwd)/lisp" load-path))" >> ../../emacs-25.3/.dir-locals.el
  echo "(setq load-path (cons "$(pwd)/contrib/lisp" load-path))" >> ../../emacs-25.3/.dir-locals.el
  
  $2/bin/emacs ~/temp.org			#run Org-mode
fi

if [ "$1" = "uninstall" ]; then
  echo "Uninstalling"
  cd emacs-25.3
  make uninstall
fi


#etc.
