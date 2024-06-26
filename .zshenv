# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

setopt no_global_rcs

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/go/bin

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

#export GOENV_ROOT="$HOME/.goenv"
#export PATH="$GOENV_ROOT/bin:$PATH"

case ${OSTYPE} in
  darwin*)
    export PATH=/opt/homebrew/bin:$PATH

    # android sdk
    #export ANDROID_HOME="${HOME}/android-sdk"
    #export PATH=${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools
    export PATH="${HOME}/Library/Android/sdk/platform-tools:$PATH"

    # gnu getopt
    export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

    export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
    export PATH=/opt/homebrew/opt/mysql-client/bin:$PATH
    #export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
    #export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
    export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
    export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
    ## google cloud sdk
    #source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    #source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

    # php
    # export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"

    # gnubin
    PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    ;;
  linux*)
    for i in /etc/profile.d/*.sh ; do
      [ -r $i ] && source $i
    done
    ;;
esac

export PATH="$HOME/.poetry/bin:$PATH"

# export JAVA_HOME=`/usr/libexec/java_home -v 14`

# turn off less beep
# export LESS="$LESS -R -Q"
# lessの文字コードをutf-8にする
export LESSCHARSET=utf-8

# pip install --userを使った時のpath
export PATH="$HOME/.local/bin:$PATH"

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
