# 4IT446 - Řízení kvality softwaru
## Automatizované testování eshopu czc.cz
```
robot -d Reports Tests/**/*.robot
```
_spuštění kouknrétního tagu_
```
robot -i Smoke -d Reports Tests/**/*.robot
```

```
robot --help
```

[jenkins](http://147.32.72.31:8080)
Uživatel: admin
Heslo: Heslo123



### Vývojové prostředí (zatím nevím jak tam dostat podporu Selenium2Library):
- Web Storm (ultimate verze zdarma, stačí si jen zažádat o studentský účet)
- Po instalaci stačí otevřít projekt
- poté CTRL + ALT + S
- Plugins -> Browse repositories...
- A nainstalovat si následující pluginy: IntelliBot, Robot Framework Support, Robot Plugin, .ignore
- Restartovat ideu
- Dát si kafe a začít makat