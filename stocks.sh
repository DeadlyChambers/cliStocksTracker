stocks () {
echo -e "${__cyan}-------------------------------"
echo -e "                STOCKS                 "
echo -e "${__cyan}-------------------------------"
echo -e "${__yellow}Edit the ~/usr/repos/cliStocksTracker/portfolio.ini to add/remove stocks${__normal}";
cur=$PWD
cd ~/usr/repos/cliStocksTracker
if [ ! -d ~/.venv/cli-stock ]
	then
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
export -f stocks