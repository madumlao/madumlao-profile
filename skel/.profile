# environment variables
export TZ="Asia/Manila"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.crypt/bin:$PATH"

# set your umask
# group readonly
# others no read access
umask 026

# effectively unlimited history
export HISTSIZE=10000000

# default profile-specific settings
PROFILE_ENABLE_KUBECTL=y

# firefox hardware acceleration
export MOZ_USE_OMTC=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=

# Preferred editor
export VISUAL="vim"
export EDITOR="vim"
export THOR_MERGE="meld"
export PAGER="less -r -i"

# source local variables
# will override any variables defined above
[ -f "$HOME/.profile-local" ] && source "$HOME/.profile-local"
[ -f "$HOME/.profile-private" ] && source "$HOME/.profile-private"
# end preferences - switched controls below

# force enable sbin paths in environments that dont turn them on
echo "$PATH" | egrep -q ':?/usr/sbin:?' || export PATH="$PATH:/usr/sbin"
echo "$PATH" | egrep -q ':?/sbin:?'     || export PATH="$PATH:/sbin"

# gtk options
# enable "command pallete"
# export GTK3_MODULES="/usr/lib/x86_64-linux-gnu/libplotinus/libplotinus.so:$GTK3_MODULES"

# Ubuntu make installation of Ubuntu Make binary symlink
export PATH="$HOME/.local/share/umake/bin:$PATH"

# C compiler options
export CPATH="$HOME/include:$CPATH"
export LIBRARY_PATH="$HOME/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"

# composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# phpenv
PHPENV_ROOT="${PHPENV_ROOT:-${HOME}/.phpenv}"
if [ -z "$PHPENV_DISABLE" ] && [ -d "$PHPENV_ROOT/bin" ]; then
	export PATH="$HOME/.phpenv/bin:$PATH"
	eval "$(phpenv init -)"

	# php-build
	export PHP_BUILD_CONFIGURE_OPTS="--with-libdir=lib --with-pear --with-ldap --with-ldap-sasl --with-mhash --with-sodium --with-gmp --with-mysql-sock=/run/mysqld/mysqld.sock"
	export PHP_BUILD_KEEP_OBJECT_FILES=y
fi

# rbenv
RBENV_ROOT="${RBENV_ROOT:-${HOME}/.rbenv}"
if [ -z "$RBENV_DISABLE" ] && [ -d "$RBENV_ROOT/bin" ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

# jenv
JENV_ROOT="${JENV_ROOT:-${HOME}/.jenv}"
if [ -z "$JENV_DISABLE" ] && [ -d "$JENV_ROOT/bin" ]; then
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
fi

# nodenv
NODENV_ROOT="${NODENV_ROOT:-$HOME/.nodenv}"
if [ -z "$NODENV_DISABLE" ] && [ -d "$NODENV_ROOT/bin" ]; then
	export PATH="$HOME/.nodenv/bin:$PATH"
	eval "$(nodenv init -)"
fi

# pyenv
PYENV_ROOT="${PYENV_ROOT:-${HOME}/.pyenv}"
if [ -z "$PYENV_DISABLE" ] && [ -d "$PYENV_ROOT/bin" ]; then
	export PATH="$HOME/.pyenv/bin:$PATH"
	export PIPENV_VENV_IN_PROJECT=1
	PYENV_MAJOR_VERSION="$(pyenv --version|cut -f 2 -d ' '|cut -f 1 -d .)"
	if [ "$PYENV_MAJOR_VERSION" -gt 1 ]; then
		eval "$(pyenv init --path)"
	fi
	eval "$(pyenv init -|grep -v '^echo')"
fi

# perl
export PATH="/home/madumlao/perl5/bin${PATH:+:${PATH}}"; export PATH;
export PERL5LIB="/home/madumlao/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
export PERL_LOCAL_LIB_ROOT="/home/madumlao/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
export PERL_MB_OPT="--install_base \"/home/madumlao/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=/home/madumlao/perl5"; export PERL_MM_OPT;

# aliases
alias less='less -i -r'
