export PATH="/usr/local/bin:/usr/local/sbin:${HOME}/bin:${PATH}"
export PATH="$HOME/.rbenv/bin:$PATH"

case ${OSTYPE} in
  darwin*)
    ;;
  linux*)
    for i in /etc/profile.d/*.sh ; do
      [ -r $i ] && source $i
    done
    ;;
esac
