# Skrypt co wysyła automatycznie webhook po zbanowaniu osoby na serwerze.

# Potrzebne skrypty:
```
- EasyAdmin
```


# Tutaj wklejacie swój webhook:

```
linijka: 10
local banroom = "https://discord.com/api/webhooks/914233832130113536/"
```


# Tutaj możecie zmienić trigger od waszego EasyAdmina/vMenu:

```
RegisterServerEvent("EasyAdmin:banPlayer")
AddEventHandler('EasyAdmin:banPlayer', function(playerId,reason,expires,username)
```
