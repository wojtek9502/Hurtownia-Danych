begin
DBMS_EPG.create_dad(
dad_name => 'projekt',
path => '/projekt/*');
end;
/

---adres: http://127.0.0.1:8080//dad/projekt/<plik_psp>