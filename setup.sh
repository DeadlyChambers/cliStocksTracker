export red="\033[0;31m"
export green="\033[0;32m"
export yellow="\033[0;33m"
export magenta="\033[0;35m"
export cyan="\033[0;36m"
export normal="\033[0m"
export vers="v1.00"
export HOME2=~/../usr

update-bash() {
    echo -e "${cyan}-------------------------------"
    echo -e "-${vers}  Bashrc Version    @SO -"
    echo -e "${cyan}-------------------------------"
    echo -e "${yellow} Update bash scripts with  cp setup.sh ~/ubuntu-binds -fv"
    local cur=$PWD
    cd ~/repos/cliStocksTracker;
    cp setup.sh $HOME2/etc/profile.d/setup.sh -fv;
    funcs=$(declare -Fx | awk -vORS=', ' {'print $3'});
    echo -e "${cyan}${funcs}${normal}"
    cd $cur
}

stocks-update() {
    echo -e "${cyan}-------------------------------"
    echo -e "                STOCKS       @SO -"
    echo -e "${cyan}-------------------------------"
    echo -e "${yellow}Edit the ~/repos/cliStocksTracker/portfolio.ini to add/remove stocks${normal}";
    local cur=$PWD
    cd ~/repos/cliStocksTracker;
    git reset --hard;
    git pull;
    cp setup.sh $HOME2/etc/profile.d/setup.sh -fv;
    cd $cur
}
stocks () {
    echo -e "${cyan}-------------------------------"
    echo -e "                STOCKS       @SO -"
    echo -e "${cyan}-------------------------------"
    echo -e "${yellow}Edit the ~/repos/cliStocksTracker/portfolio.ini to add/remove stocks${normal}";
    local cur=$PWD
    cd ~/repos/cliStocksTracker
    local hard_update=1
    if [ ! -z "$1" ]
        then
            rm -rf ~/.venv/cli-stock
    fi
    if [ ! -d ~/.venv/cli-stock ]
        then
            python -m pip install --user virtualenv
            python -m venv ~/.venv/cli-stock
            py_dir=~/.venv/cli-stock/Scripts/activate
            [ ! -d $py_dir ] && py_dir=~/.venv/cli-stock/bin/activate
            source $py_dir
            python -m pip install -r requirements.txt
        else
            py_dir=~/.venv/cli-stock/Scripts/activate
            [ ! -d $py_dir ] && py_dir=~/.venv/cli-stock/bin/activate
            source $py_dir
    fi
    python cliStocksTracker.py
    deactivate
    cd $cur
}
export -f update-bash
export -f stocks-update
export -f stocks
update-bash
