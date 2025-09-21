# 🥬 inpol-checker

This checks [Inpol](https://inpol.mazowieckie.pl)'s slots for you, uses Telegram bot for notification when slot is found.
Each pass includes checking all three offices. The script clicks all active dates. 
If there are signs of the existence of unoccupied slots (I don't know the exact xpath of the slots), it sends a message to the telegram bot.
After checking, the script waits for a time interval, which may jitter randomly.

## 🌽 Native Run

> The script requires installed chromedriver (`brew install chromedriver` on mac)

1. Make the copy of .env.example
```
cp .env .env.example
```

2. Update values in the .env

```
EMAIL= (required) - login at inpol
PASSWORD= (required) - password at inpol
CASE_ID= (required) - case id at inpol, can be obtained from url at case's page
MONTHS_TO_CHECK= (optional) - count of months to check for enabled dates, default: `5`
LOG_LEVEL= (optional) - log level, one of standard DEBUG, INFO, etc.., default: `INFO`
TELEGRAM_TOKEN= (optional) - telegram bot's token, create new bot with [@BotFather](https://t.me/BotFather), send initial message in advance
TELEGRAM_CHAT_ID= (optional) - your chat id, obtain it with [@get_id_bot](https://t.me/get_id_bot)
PROXY_SERVER= (optional) - path to http proxy, e.g. http://login:pass@address:port
SLEEP_INTERVAL= (optional) - Sleep interval, default: `15m`
SLEEP_INTERVAL_JITTER= (optional) - Sleep interval jitter, default: `3m`
```

3. Install pipenv if you haven't already:

```shell
pip install pipenv
```

4. Install pipenv dependencies:

```shell
pipenv install
```

5. Run the script:

```shell
pipenv run start
```

## 🥥 Run in Docker

1. Make the copy of .env.example

```
cp .env .env.example
```

2. Update values in the .env

```
EMAIL= (required) - login at inpol
PASSWORD= (required) - password at inpol
CASE_ID= (required) - case id at inpol, can be obtained from url at case's page
MONTHS_TO_CHECK= (optional) - count of months to check for enabled dates, default: `5`
LOG_LEVEL= (optional) - log level, one of standard DEBUG, INFO, etc.., default: `INFO`
TELEGRAM_TOKEN= (optional) - telegram bot's token, create new bot with [@BotFather](https://t.me/BotFather), send initial message in advance
TELEGRAM_CHAT_ID= (optional) - your chat id, obtain it with [@get_id_bot](https://t.me/get_id_bot)
PROXY_SERVER= (optional) - path to http proxy, e.g. http://login:pass@address:port
SLEEP_INTERVAL= (optional) - Sleep interval, default: `15m`
SLEEP_INTERVAL_JITTER= (optional) - Sleep interval jitter, default: `3m`
```

3. Run with docker compose:

```shell
docker compose up --remove-orphans
```

4. Connect to VNC viewer (optional)

`localhost:5900` with password `password`.

## 🫑 TODO

- [ ] add anticaptcha

## 🥒 Similar projects

- https://github.com/apopelyshev/inpol-bot 
- https://github.com/nerf-qh/inpol-reservation
- https://github.com/bademux/inpol-bot
- https://github.com/nickovchinnikov/inpol.mazowieckie_appointment_pl

##  🧅 License

```
 ███▄ ▄███▓ ██▓▄▄▄█████▓
▓██▒▀█▀ ██▒▓██▒▓  ██▒ ▓▒
▓██    ▓██░▒██▒▒ ▓██░ ▒░
▒██    ▒██ ░██░░ ▓██▓ ░ 
▒██▒   ░██▒░██░  ▒██▒ ░ 
░ ▒░   ░  ░░▓    ▒ ░░   
░  ░      ░ ▒ ░    ░    
░      ░    ▒ ░  ░      
       ░    ░           
```
