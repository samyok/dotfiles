fish_vi_key_bindings

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

function portkill
   lsof -t -i:$argv | xargs kill -9
end

function hourskill
   docker container stop hours_mongo_{1,2,3}
end

function toico
    convert $argv -define icon:auto-resize=256,128,48,32,16 favicon.ico
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

alias nproc="sysctl -n hw.logicalcpu"
alias cls="clear";
alias ghc="gh copilot suggest"
alias gst="git status";
alias gtk="sh /usr/local/bin/gitkraken -p  .";
alias dbld="docker-compose build";
alias dup="docker-compose up -d";
alias ddwn="docker-compose down --remove-orphans";
alias dl="docker-compose logs -f";
alias dcrm="docker rm (docker ps -a -f status=exited -q)";
alias yrn="npx yarn@2";
alias gcp="git cherry-pick";
alias gc="git commit";
alias gcundo="git reset --soft HEAD~1";
alias gpr="gh pr checkout"
alias gd="git diff"
alias pro="gh pr view --web"
alias gopen="gh repo view --web"
alias gloc="cloc --vcs=git --exclude-dir=.vscode --exclude-ext=csv"
alias nextauth="wget https://gist.githubusercontent.com/samyok/07c316e5d3cedcea4c08940609eb4c64/raw/51d4e4ab19e7d6d904f1b74be9f28c9eac820221/%255B...nextauth%255D.js"
alias run="g++-12 main.cpp -o main; ./main"
alias acv="source ./venv/bin/activate.fish"
alias skim="open -a Skim.app"
alias ghot="git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -n 30"
alias ytdl="yt-dlp --cookies-from-browser chrome"

alias yd="yarn dev"
alias yb="yarn build"
alias venv="python3 -m venv venv"
alias vish="source ./venv/bin/activate.fish"

alias dev="cd ~/Developer"
alias hw="cd ~/Homework"

# for overwriting clang g++
alias g++="g++-13"

# aops prepare script for codewoot
alias prep="python3 ../../prepare.py"

# zip all the files in the src directory except the ones that end with "Test.java"
# and make all the files in the root of the zip file, not in a directory
alias submitjava="zip -rj submission.zip src -x \"src/*Test.java\""

alias cs221="cd ~/Documents/Stanford/CS221"
alias cs229="cd ~/Documents/Stanford/CS229"

# re-sync dotfiles folder
alias redot="stow --dir ~/dotfiles --target ~ ."

function wst
  webstorm "$(git rev-parse --show-toplevel)"
end


function pyc
  pycharm "$(git rev-parse --show-toplevel)"
end

function gcdate
  read -p "echo \"enter date: \"" newdate
  set fmtdate (gdate -d "$newdate")
  set -x GIT_AUTHOR_DATE "$fmtdate"
  set -x GIT_COMMITTER_DATE "$fmtdate"
  git commit $argv
end

function cleartunnels
  for tunnel in (cloudflared tunnel list --output json | jq -r '.[] | .id')
    echo "UUID: $tunnel"
    cloudflared tunnel delete "$tunnel"
  end
end

function chromeicon
  for sz in 16 32 64 72 128 256 512;
    convert "$argv[1].png" -resize "$szx$sz" "$argv[1]-$sz.png";
  end;
end;

function envsource
  for line in (cat $argv | grep -v '^#')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end

# alias for getting the advent of code input
function aoc
    open "https://adventofcode.com/2022/day/$argv#:~:text=puzzle%20input.-,Answer%3A,-%5BSubmit%5D"
    wget -O input --load-cookies ../../cookies.txt "https://adventofcode.com/2022/day/$argv/input"
end

function aoc-21
    wget -O input --load-cookies ../../cookies.txt "https://adventofcode.com/2021/day/$argv/input"
end

function mkaoc
  set day $argv[1]
  mkdir "day-$day"
  cd "day-$day"
  cp ~/Developer/samyolk/AdventOfCode/template.py "day-$day.py"
  touch input
  pycharm "day-$day.py"
  pycharm input
end

function runoc
  echo (set_color -o blue)"=> Running $argv[1].ml"(set_color normal)
  echo
  ocamlc -o "$argv[1].byte" "$argv[1].ml"
  "./$argv[1].byte"
  echo
end

# Setting PATH for Python 3.10
# The original version is saved in /Users/samyok/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"


# The next line updates PATH for the Google Cloud SDK.
 if [ -f '/Users/samyok/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/samyok/Downloads/google-cloud-sdk/path.fish.inc'; end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true
set PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true 
set PUPPETEER_EXECUTABLE_PATH (which chromium)

# opam configuration
source /Users/samyok/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

thefuck --alias | source

fish_vi_key_bindings

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
#    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
#end
# <<< conda initialize <<<
function cdact
    if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
        eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
    end
end
  export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
export FISH_WAKATIME_DISABLED=true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
pyenv init - | source

