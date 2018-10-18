Git repo of my personal shell profile variables

## Installing
Copy this directory somewhere in your home directory. The directory should be persistent, so probably keep this in your "projects" directory or somewhere similar. If in doubt, you can keep this under `.local/share/madumlao-profile`.

Next, run the `install.sh` script. It should backup your existing profile and replace it with symlinks to this version.

~~~ sh
madumlao@lenneth ~/Projects/madumlao-profile $ ./install.sh 
Backing up original profile under /home/madumlao/Projects/madumlao-profile/backup
'/home/madumlao/.bash_profile' -> '/home/madumlao/Projects/madumlao-profile/backup/.bash_profile'
'/home/madumlao/.bash_profile' -> 'Projects/madumlao-profile/skel/.bash_profile'
'/home/madumlao/.bashrc' -> '/home/madumlao/Projects/madumlao-profile/backup/.bashrc'
'/home/madumlao/.bashrc' -> 'Projects/madumlao-profile/skel/.bashrc'
'/home/madumlao/.profile' -> '/home/madumlao/Projects/madumlao-profile/backup/.profile'
'/home/madumlao/.profile' -> 'Projects/madumlao-profile/skel/.profile'
'/home/madumlao/.vimrc' -> '/home/madumlao/Projects/madumlao-profile/backup/.vimrc'
'/home/madumlao/.vimrc' -> 'Projects/madumlao-profile/skel/.vimrc'
'/home/madumlao/.zprofile' -> '/home/madumlao/Projects/madumlao-profile/backup/.zprofile'
'/home/madumlao/.zprofile' -> 'Projects/madumlao-profile/skel/.zprofile'
'/home/madumlao/.zshrc' -> '/home/madumlao/Projects/madumlao-profile/backup/.zshrc'
'/home/madumlao/.zshrc' -> 'Projects/madumlao-profile/skel/.zshrc'
~~~
