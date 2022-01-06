stocks () {
local repo_dir=/mnt/c/Users/deadl/source/repos/cliStocksTracker/
echo -e "${BCyan}-------------------------------"
echo -e "            ${BRed}STOCKS${BCyan}                 "
echo -e "-------------------------------"
echo -e "${Yellow}Edit the ${repo_dir}portfolio.ini to add/remove stocks${White}";
cur=$PWD
cd $repo_dir
sudo cp stocks-wsl.sh /etc/profile.d/stocks-wsl.sh -f
[ ! -d ~/.venv/cli-stock ] && python3 -m venv ~/.venv/cli-stock
py_dir=~/.venv/cli-stock/Scripts/activate
[ ! -d $py_dir ] && py_dir=~/.venv/cli-stock/bin/activate
source $py_dir
python3 -m pip install -q -r requirements-wsl.txt

if [ ! -z "$1" ]
    then
        echo -e "${BGreen}Fetching Stocks${White}"
        python3 cliStocksTracker.py
    else
        python3 cliStocksTracker.py -ti 1h -tp 1mo
fi
deactivate
cd $cur
}

export -f stocks