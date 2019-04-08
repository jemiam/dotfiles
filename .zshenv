# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

setopt no_global_rcs

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

case ${OSTYPE} in
  darwin*)
    ;;
  linux*)
    for i in /etc/profile.d/*.sh ; do
      [ -r $i ] && source $i
    done
    ;;
esac

# android sdk
export ANDROID_HOME="${HOME}/android-sdk"
export PATH=${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools

## google cloud sdk
#source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
#source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# gnu getopt
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
