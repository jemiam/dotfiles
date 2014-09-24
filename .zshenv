export PATH="${HOME}/.rbenv/bin:${HOME}/bin:${PATH}"

case ${OSTYPE} in
  darwin*)
    ;;
  linux*)
    for i in /etc/profile.d/*.sh ; do
      [ -r $i ] && source $i
    done
    ;;
esac
