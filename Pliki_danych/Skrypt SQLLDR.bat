@echo podaj login do bazy
@set /p login=">> "

@echo podaj haslo do bazy
@set /p haslo=">> "

sqlldr userid=%login%/%haslo% control=dentysta.ctl
sqlldr userid=%login%/%haslo% control=przychodnia.ctl
sqlldr userid=%login%/%haslo% control=gabinet.ctl
sqlldr userid=%login%/%haslo% control=ubezpieczenie.ctl
sqlldr userid=%login%/%haslo% control=pacjent.ctl
sqlldr userid=%login%/%haslo% control=rok.ctl
sqlldr userid=%login%/%haslo% control=miesiac.ctl
sqlldr userid=%login%/%haslo% control=dzien.ctl
sqlldr userid=%login%/%haslo% control=zabieg.ctl

@pause
@exit

