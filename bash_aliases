alias ll="ls -Gla"
alias la="ls -Gpa"
alias l="ls -Gp"

alias dev="push ~/dev/"
alias e2e="push ~/dev/e2e-test"
alias xena="push ~/dev/xena"
alias dotfiles="push ~/dotfiles"
alias splinter="push ~/dev/splinter"
alias bots="push ~/dev/intf-bots"

alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gdc="git diff --cached"
alias gco="git checkout"
alias cherry="git cherry-pick"

alias mdps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}\""
alias clearDocker="docker system prune --volumes"
alias rebuild="docker-compose up -d --force-recreate --build"
alias src="source ~/.bashrc"

alias searchHere="grep . --exclude-dir \"node_modules\" --exclude-dir \".git\" --color -rne"

alias ifmfa='awsmfa --identity-profile interfolio --target-profile interfolio-mfa -c $(op get totp '\''Amazon (interfolio)'\'')'
alias awslgn='awsmfa --identity-profile interfolio --target-profile intf-cicd-mfa && awsmfa --identity-profile interfolio --target-profile interfolio-mfa'
alias dkrlgn='aws --profile intf-cicd-mfa ecr get-login-password | docker login --username AWS --password-stdin 013320755112.dkr.ecr.us-east-1.amazonaws.com/interfolio'

function countRequires {
  files=$(searchHere "require\(.*\)$1\(.*\)")
  amount=$(echo "$files" | wc -l | xargs)
  echo "$1 is used in $amount require statements, searched recursively from $(pwd)"
  echo "$files"
}

function psql {
    if [ -z $2 ]; then
        docker exec -it postgres psql $1 postgres
    else
        docker exec -it postgres psql $1 $2
    fi
}

function enter {
  docker exec -it $1 bash
}

function push {
  pwd=$(pwd)
  if [ -z $1 ]; then
    if [ -f "/tmp/push" ]; then
      pushed=$(head -1 /tmp/push)
      cd $pushed
    else
      cd ~
    fi
  else
    cd $1
  fi
  echo $pwd > /tmp/push
}

function cdg {
  dir=$( ls -p | grep -e "/" | grep -e "$1" | head -1 )
  if [ -z $dir ]; then
    echo "No directories matching: $1"
  else
    push $dir
  fi
}

function root {
  rootdir=$(git rev-parse --show-toplevel)
  if [ -z rootdir ]; then
    echo "Not in a git project."
  else
    push $rootdir
  fi
}

function hist {
    history | grep -v "hist\s" | grep -e "$1"
}

function whoWrote {
  grep . -rnle "caseid-$1" | grep ".feature" | xargs git blame | grep -A2 "$1"
}

function skipThese {
  grep --include *.feature -rl -E "$1" . | xargs sed -i "" -E "s/($1)/\1 @$2-skip/g"
}

function vime {
  searchHere $1 | sed -E 's/(\.\/[a-zA-Z\/\-]+.*.js:[0-9]+)(:.*)/\1/g' | sed -E 's/:/|/g'
}
