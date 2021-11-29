export red="\033[0;31m"
export green="\033[0;32m"
export yellow="\033[0;33m"
export magenta="\033[0;35m"
export cyan="\033[0;36m"
export normal="\033[0m"
vers="v1.00"
echo -e "${cyan}-------------------------------"
		echo -e "-${vers}  Bashrc Version    @SO -"
		echo -e "${cyan}-------------------------------"
if [ ! -d $HOME2/etc/profile.d ]
	then 
		mkdir -p $HOME2/etc/profile.d	
fi
#NOTE:
#Any .sh scripts under ~/../usr/etc/profile.d will be brought into your profile
for i in $HOME2/etc/profile.d/*.sh; do
  if [ -r "$i" ]; then
	 if [ "$PS1" ]; then
	   . "$i"
	 else
	   . "$i" >/dev/null
	 fi
  fi
done
# Turn on checkwinsize
#  shopt -s checkwinsize


##Setting up a usr/bin, this folder will allow you simply drop binaries
##in the ~/../usr/bin folder, and it will just work. 
if [ ! -d $HOME2/bin ]
	then 
		mkdir -p $HOME2/bin
fi
case ":$PATH:" in
  *:$HOME2/bin:*);;
  *) export PATH="$HOME2/bin:$PATH";;
esac
