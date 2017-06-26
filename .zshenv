# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

export GOPATH=$HOME/go
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

# google cloud sdk
source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# smarby inc
export SMTP_SERVER=email-smtp.us-west-2.amazonaws.com
export SMTP_USERNAME=AKIAICBMZG7K632SJMGQ
export SMTP_PASSWORD=AjhBgCzLAjWKVdhUiqvunvHjdWBvVaOEFolSEfBB0Rl7
export SLACK_WEB_HOOK=hook
export SLACK_CHANNEL=test-notification
export SYNC_ROOT_DIR=/Users/ejima/work/smarby/piglet
export GOOGLE_API_KEY=AIzaSyA6u5daAyEz67xLU08pnQ0srq9xgQ9V0sk
export FACEBOOK_APP_ID=1135924679846094
export FACEBOOK_SECRET_KEY=78412f8ce830d4c28bdf91babe6d7c4c
