# environment variables
export TZ="Asia/Manila"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.crypt/bin:$PATH"

# set your umask
# group readonly
# others no read access
umask 026

# effectively unlimited history
export HISTSIZE=10000000

# source private variables
[ -f "$HOME/.profile-priivate" ] && source "$HOME/.profile-private"

# firefox hardware acceleration
export MOZ_USE_OMTC=1

# Preferred editor
export VISUAL="vim"
export EDITOR="vim"

# gtk options
# enable "command pallete"
export GTK3_MODULES="/usr/lib/x86_64-linux-gnu/libplotinus/libplotinus.so:$GTK3_MODULES"

# Ubuntu make installation of Ubuntu Make binary symlink
export PATH="$HOME/.local/share/umake/bin:$PATH"

# C compiler options
export CPATH="$HOME/include:$CPATH"
export LIBRARY_PATH="$HOME/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"

# composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# php-build
export PHP_BUILD_CONFIGURE_OPTS="--with-ldap=/usr --with-ldap-sasl=/usr --with-mhash=/usr --with-mysql-sock=/run/mysqld/mysqld.sock --with-apxs2"
export PHP_BUILD_KEEP_OBJECT_FILES=y

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# nenv
export PATH="$HOME/.nenv/bin:$PATH"
eval "$(nenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# perl
export PATH="/home/madumlao/perl5/bin${PATH:+:${PATH}}"; export PATH;
export PERL5LIB="/home/madumlao/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
export PERL_LOCAL_LIB_ROOT="/home/madumlao/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
export PERL_MB_OPT="--install_base \"/home/madumlao/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=/home/madumlao/perl5"; export PERL_MM_OPT;
