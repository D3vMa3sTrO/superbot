#TSHAKE_cli
طريقه تنصيب سورس TSHAKE

افتح ترمنال جديد وخلي🔧👇

sudo apt-get update

عوفه مفتوح وفتح ترمنال لاخ وخلي 👇

sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev

وراهه 👇

git clone https://github.com/moodlIMyIl/TSHAKE.git

وراهه👇

cd TSHAKE

وراهه👇

chmod +x launch.sh

وراهه👇

./launch.sh install

وراهه👇

./launch.sh

بعدها يطلب رقم ودخل ررقم ومبروك عليك البوت🐸🍃

بعدها افتح ترمنال جديد واكتب 👇

sudo service redis-server start

ودوس انتر وسوي رن من جديد من ملف launch.sh

by ;- @lIMyIl
by :- @li_XxX_il
by :- @h_k_a
by :- @li_XxX_il
by :- @Aram_omar22
```
### One command
To install everything in one command (useful for VPS deployment) on Debian-based distros, use:
```sh
#https://github.com/yagop/telegram-bot/wiki/Installation
sudo apt-get update; sudo apt-get upgrade -y --force-yes; sudo apt-get dist-upgrade -y --force-yes; sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev libjansson* libpython-dev make unzip git redis-server g++ autoconf -y --force-yes && git clone https://github.com/moodlIMyIl/TSHAKE && cd TSHAKE && chmod +x launch.sh && ./launch.sh install && ./launch.sh
```

* * *

### Realm configuration

After you run the bot for first time, send it `!id`. Get your ID and stop the bot.

Open ./data/config.lua and add your ID to the "sudo_users" section in the following format:
```
  sudo_users = {
    0,
    YourID
  }
```
**Creating a LOG SuperGroup**
	-For GBan Log

	1. Create a group using the `!creategroup` command.
	2. Add two members or bots, then use `#super` to convert to a SuperSroup.
	3.and use `#modadd` to add groups to lists 
    4. Use the `#addlog` command and your ***LOG SuperGroup(s)*** will be set.
	# Note: you can set multiple Log SuperGroups


* * *
