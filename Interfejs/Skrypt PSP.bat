@echo podaj login do bazy
@set /p login=">> "

@echo podaj haslo do bazy
@set /p haslo=">> "

loadpsp -replace -user %login%/%haslo% "psp\interfejs_start.psp"
loadpsp -replace -user %login%/%haslo% "psp\wyswietl_tabele.psp"
loadpsp -replace -user %login%/%haslo% "psp\wyswietl_zapytanie.psp"

pause