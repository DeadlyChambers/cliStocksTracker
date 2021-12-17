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
    cur=$PWD
    cd ~/repos/cliStocksTracker;
    cp setup.sh $HOME2/etc/profile.d -fv;
    cd $PWD
}
update-bash
stocks-update() {
    echo -e "${cyan}-------------------------------"
    echo -e "                STOCKS       @SO -"
    echo -e "${cyan}-------------------------------"
    echo -e "${yellow}Edit the ~/repos/cliStocksTracker/portfolio.ini to add/remove stocks${normal}";
    cur=$PWD
    cd ~/repos/cliStocksTracker;
    git pull;
    cd $PWD

}
stocks () {
    echo -e "${cyan}-------------------------------"
    echo -e "                STOCKS       @SO -"
    echo -e "${cyan}-------------------------------"
    echo -e "${yellow}Edit the ~/repos/cliStocksTracker/portfolio.ini to add/remove stocks${normal}";
    cur=$PWD
    cd ~/repos/cliStocksTracker
    if [ ! -d ~/.venv/cli-stock ]
        then
            python -m pip install --user virtualenv
            python -m venv ~/.venv/cli-stock
            source ~/.venv/cli-stock/Scripts/activate
            python -m pip install -r requirements.txt
        else
            source ~/.venv/cli-stock/Scripts/activate
    fi
    if [ ! -z "$1" ]
        then
            python cliStocksTracker.py
        else
            python cliStocksTracker.py -ti 1h -tp 1mo
    fi
    deactivate
    cd $cur
}
export -f update-bash
export -f stocks-update
export -f stocks