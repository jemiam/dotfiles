set -x PATH $PATH $HOME/bin
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -U FZF_LEGACY_KEYBINDINGS 0

#function fish_prompt
#  eval $GOPATH/bin/powerline-go -error $status -shell bare
#end

# oh-my-fish/plugin-pecoの設定
#function fish_user_key_bindings
#  # Bind for prco history to Ctrl+r
#  bind \cr peco_select_history
#end

# コピペ用設定
# Xサーバーと通信する
if test -e /mnt/c/WINDOWS/System32/wsl.exe
  set LOCAL_IP (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
  set -x DISPLAY $LOCAL_IP:0
end

# asdf
source ~/.asdf/asdf.fish
