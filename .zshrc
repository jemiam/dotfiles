# 
# http://d.hatena.ne.jp/oovu70/20120405/p1
# http://memo.officebrook.net/20090205.html
#

# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

# スラッシュを単語の一部とみなさない
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# 3秒以上かかった処理を詳細表示
REPORTTIME=3

bindkey -e               # キーバインドをemacsモードに設定
#bindkey -v              # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する 
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt pushd_ignore_dups # pushdで同じディレクトリを重複してpushしない。
#setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

# C-s, C-qを無効にする。
#setopt no_flow_control
# 補完時にスペルチェックをする。
#setopt auto_correct
# リターンを押す度にスペルチェックをする。
#setopt correct
#setopt correct_all
# pushd を引数無しで実行した時に pushd ~ とする。
#setopt pushd_to_home
# rm * を実行する前に確認される。
#setopt rmstar_wait

# asdf
if [[ -e $HOME/.asdf/asdf.sh ]]; then
  . $HOME/.asdf/asdf.sh
elif [[ -e /usr/local/opt/asdf/libexec/asdf.sh ]];then
  #echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
  . /usr/local/opt/asdf/libexec/asdf.sh
fi

# completion
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(${ASDF_DIR}/completions $fpath)

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin # aliasを補完候補に含める

# 補完侯補を動き回る
zstyle ':completion:*:default' menu select

# 補完侯補をhjklで動き回る
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_space  # スペースで始まるコマンド行はヒストリリストから削除
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt hist_expand        # 補完時にヒストリを自動的に展開する。
setopt inc_append_history # 履歴をインクリメンタルに追加
setopt hist_verify        # ヒストリを呼び出してから実行する間に一旦編集可能

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "" history-beginning-search-backward-end
bindkey "" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }


# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

### Title (user@hostname) ###
case "${TERM}" in
(kterm*|xterm*|)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac


# ------------------------------
# Other Settings
# ------------------------------
### RVM ###
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

case "${OSTYPE}" in
  darwin*)
    # gcs
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  ;;
esac

### Aliases ###
#alias r=rails
#alias v=vim
alias ls='ls -F'
alias ll='ls -l'

alias b='bundle'
alias bi='bundle install'
alias bu='bundle update'
alias bc='bundle clean'
alias be='bundle exec'
alias ber='bundle exec rails'
alias bs='bundle show'
alias clear2="echo -e '\026\033c'"
alias rm='trash'

bcd(){
  cd $(bs $1)
}

# cdコマンド実行後、lsを実行する
#function cd() {
#  builtin cd $@ && ls;
#}

# ------------------------------
# screen & ssh
# ------------------------------

# ステータスラインに各ウィンドウで打ったコマンドを表示
if [ "$TERM" = "screen" ]; then
	chpwd () { echo -n "_`dirs`\\" }
	preexec() {
		# see [zsh-workers:13180]
		# http://www.zsh.org/mla/workers/2000/msg03993.html
		emulate -L zsh
		local -a cmd; cmd=(${(z)2})
		case $cmd[1] in
			fg)
				if (( $#cmd == 1 )); then
					cmd=(builtin jobs -l %+)
				else
					cmd=(builtin jobs -l $cmd[2])
				fi
				;;
			%*) 
				cmd=(builtin jobs -l $cmd[1])
				;;
			cd)
				if (( $#cmd == 2)); then
					cmd[1]=$cmd[2]
				fi
				;&
			*)
				echo -n "k$cmd[1]:t\\"
				return
				;;
		esac

		local -A jt; jt=(${(kv)jobtexts})

		$cmd >>(read num rest
			cmd=(${(z)${(e):-\$jt$num}})
			echo -n "k$cmd[1]:t\\") 2>/dev/null
	}
	chpwd
fi

# ssh 
#function ssh_screen(){
# eval server=\${$#}
# screen -t $server ssh "$@"
#}
#if [ x$TERM = xscreen ]; then
#  alias ssh=ssh_screen
#fi

# ^ で cd .. 
#function cdup() {
#echo
#cd ..
#zle reset-prompt
#}
#zle -N cdup
#bindkey '^' cdup

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
if [[ -f ~/.rbenv/completions/rbenv.zsh ]]; then
  source ~/.rbenv/completions/rbenv.zsh
fi

# anyenv
#export PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(anyenv init - zsh)"

## pyenv
#if which pyenv > /dev/null; then eval "$(pyenv init - zsh)"; fi
## pyenv-virtualenv
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# goenv
#if which goenv > /dev/null; then eval "$(goenv init - zsh)"; fi

# Ctrl-sの端末ロックを無効にする
stty stop undef

# mosh
#compdef mosh=ssh

# brew
if which brew > /dev/null 2>&1; then
  . `brew --prefix`/etc/profile.d/z.sh
  alias ctags="`brew --prefix`/bin/ctags"

  # online help
  #unalias run-help
  #autoload run-help
  #HELPDIR=/usr/local/share/zsh/helpfiles
fi

case ${OSTYPE} in
  darwin*)
    ;;
  linux*)
    ;;
esac

# peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
      tac="tac"
  else
      tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
      eval $tac | \
      peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'

# grep For all non-ascii characters
function grep-mbchar() {
  ag "[\x80-\xFF]" $*
}

# direnv
eval "$(direnv hook zsh)"

function rmswp() {
  rm **/.*.swp
}

# clear console
alias clear2="echo -e '\026\033c'"

# hub
# eval "$(hub alias -s)"

# gcloud
if [[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]]; then
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi
if [[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]]; then
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

# ipython
alias ipython='python3 -m IPython'

# コピペ用設定
# Xサーバーと通信する
if test -e /mnt/c/WINDOWS/System32/wsl.exe; then
  LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
  export DISPLAY=$LOCAL_IP:0
fi

# ghq
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '' peco-src

##################
# Kyashの設定
##################

# SAML認証のprofile切替え
aws-profile-switch() {
  local profile="$(grep '\[' ~/.aws/credentials | sed -e 's/\[//' -e 's/\]//' | peco)"
  export AWS_PROFILE="$profile"
}

eval `ssh-agent`
ssh-add

ssm-start-session() {
  local arg="$*"
  local instance
  aws ssm describe-instance-information | jq -r '.InstanceInformationList[].InstanceId' > /tmp/ssm-instances
  instance=$(
    aws ec2 describe-instances \
    --instance-ids $(cat /tmp/ssm-instances) \
    --filters "Name=instance-state-name,Values=running" |
      jq -cr '
        .Reservations[].Instances[] |
          [
            .InstanceId,
            .NetworkInterfaces[0].PrivateIpAddress,
            (.Tags[] | select(.Key == "Product").Value),
            (.Tags[] | select(.Key == "Env").Value),
            (.Tags[] | select(.Key == "Name").Value)
          ] |
          @tsv
      ' | sort -bk 2 | peco --query "$arg"
  )

  test -z "$instance" && return
  echo "---> $instance"
  aws ssm start-session --target "$(echo $instance | awk '{print $1}')" --document-name AWS-StartInteractiveCommand --parameters command="cd ~; bash -l"
}

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

alias mmv='noglob zmv -W'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 以下のエラーを防ぐ
# <3>init: (4830) ERROR: UtilConnectUnix:467: connect failed 111
# https://github.com/microsoft/WSL/issues/7174#issuecomment-940163080
parentof() {
  pid=$(ps -p ${1:-$$} -o ppid=;)
  echo ${pid// /}
}

interop_pid=$$

while true ; do
  [[ -e /run/WSL/${interop_pid}_interop ]] && break
  interop_pid=$(parentof ${interop_pid})
  [[ ${interop_pid} == 1 ]] && break
done

if [[ ${interop_pid} == 1 ]] ; then
  echo "Failed to find a parent process with a working interop socket.  Interop is broken."
else
  export WSL_INTEROP=/run/WSL/${interop_pid}_interop
fi

# openのwsl版
# https://zenn.dev/kaityo256/articles/open_command_on_wsl
function open() {
    if [ $# != 1 ]; then
        explorer.exe .
    else
        if [ -e $1 ]; then
            cmd.exe /c start $(wslpath -w $1) 2> /dev/null
        else
            echo "open: $1 : No such file or directory" 
        fi
    fi
}

# atcoder
#alias acc++="g++ -std=gnu++17 -Wall -Wextra -O2 -DONLINE_JUDGE -DLOCAL -I/opt/boost/gcc/include -L/opt/boost/gcc/lib -I/opt/ac-library -o ./a.out"
# alias acc++="g++-12 -std=gnu++20 -O2 -DONLINE_JUDGE -DATCODER -Wall -Wextra -mtune=native -march=native -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib -o a.out -lgmpxx -lgmp -I/usr/include/eigen3"
# alias acc++="g++-12 -std=gnu++20 -O2 -DONLINE_JUDGE -DATCODER -DLOCAL -Wall -Wextra -mtune=native -march=native -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 -fsanitize=address -Wshadow -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib -o a.out -I/usr/include/eigen3"
alias acc++="g++-12 -std=gnu++20 -O2 -DONLINE_JUDGE -DATCODER -DLOCAL -Wall -Wextra -mtune=native -march=native -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 -Wshadow -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib -o a.out -I/usr/include/eigen3"
alias actest="acc++ main.cpp && oj t -S -c './a.out'"
alias acsubmit="acc submit main.cpp -- --yes --no-open"
alias actestrb="oj t -S -c 'ruby main.rb'"
alias acsubmitrb="acc submit main.rb -- --yes --no-open"
