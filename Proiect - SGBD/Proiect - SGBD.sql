alter session set NLS_DATE_FORMAT='DD-MM-YYYY';
set serveroutput on;
set echo off;
set verify off;

--LIBRARIE

create table LIBRARIE (cod_librarie number(3), nume varchar(25) not null, numar_angajati number(3) not null, PRIMARY KEY(cod_librarie));

insert into LIBRARIE values (1, 'Mihai Eminescu', 5);
insert into LIBRARIE values (2, 'Sophia', 6);
insert into LIBRARIE values (3, 'Herlitz', 7);
insert into LIBRARIE values (4, 'Themis', 6);
insert into LIBRARIE values (5, 'Daria', 5);
commit;
select * from LIBRARIE;

--LOCATIE

create table LOCATIE (cod_locatie number(3), cod_librarie number(3) not null, oras varchar(25) not null, adresa varchar(50) not null, PRIMARY KEY(cod_locatie), FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie));

insert into LOCATIE values(101, 1, 'Pitesti', 'Strada Victoriei 89');
insert into LOCATIE values(102, 2, 'Pitesti', 'Bulevardul I. C. Bratianu, Bloc B5');
insert into LOCATIE values(103, 3, 'Brasov', 'Strada Avram Iancu 37');
insert into LOCATIE values(104, 4, 'Bucuresti', 'Strada Biruintei 29');
insert into LOCATIE values(105, 5, 'Constanta', 'Bulevardul Tomis 51');
commit;
select * from LOCATIE;

--CLIENT

create table CLIENT (cod_client number(3), cod_librarie number(3) not null, nume varchar(25) not null, prenume varchar(25) not null, vechime date not null, PRIMARY KEY(cod_client),
FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie));

insert into CLIENT values(100, 1, 'Potcoveanu', 'Florin-Razvan', '20-12-2020');
insert into CLIENT values(101, 1, 'Nidelea', 'Gabriela-Andreea', '03-01-2021');
insert into CLIENT values(102, 1, 'Popescu', 'Mihnea-Valentin', '15-08-2020');
insert into CLIENT values(103, 2, 'Popa', 'Andrei-Marian', '07-04-2020');
insert into CLIENT values(104, 2, 'Ionescu', 'Stefan-Laurentiu', '04-04-2021');
insert into CLIENT values(105, 2, 'Stroe', 'Adrian', '13-12-2020');
insert into CLIENT values(106, 3, 'Iancu', 'Andrei-Cosmin', '17-11-2020');
insert into CLIENT values(107, 3, 'Velcea', 'Radu-Constantin', '29-11-2020');
insert into CLIENT values(108, 3, 'Dumitru', 'Ana-Maria', '05-11-2020');
insert into CLIENT values(109, 4, 'Stancu', 'Madalin-George', '28-10-2020');
insert into CLIENT values(110, 4, 'Comanescu', 'Ioana-Alexandra', '25-09-2020');
insert into CLIENT values(111, 4, 'Ghiordanescu', 'Raluca-Georgiana', '09-10-2020');
insert into CLIENT values(112, 5, 'Constanta', 'Antonia-Nicoleta', '30-10-2020');
insert into CLIENT values(113, 5, 'Brutaru', 'Bogdan-Alexandru', '02-10-2020');
insert into CLIENT values(114, 5, 'Cirstescu', 'Ionut-Adrian', '15-10-2020');
commit;
select * from CLIENT;

--JOB

create table JOB (cod_job number(3), nume_job varchar(15) not null, salaiu_minim number(7) not null, salariu_maxim number(7) not null, PRIMARY KEY(cod_job));

insert into JOB values(200, 'Sef', 10000, 15000);
insert into JOB values(201, 'Casier', 2000, 3500);
insert into JOB values(202, 'Ingrijitor', 1500, 2000);
insert into JOB values(203, 'Paznic', 1800, 2300);
insert into JOB values(204, 'Gestionar marfa', 1900, 2700);
commit;
select * from JOB;

--ANGAJAT

create table ANGAJAT (cod_angajat number(3), cod_librarie number(3), cod_job number(3), nume varchar(25), prenume varchar(25), salariu number(7), data_angajare date, numar_telefon varchar(10), PRIMARY KEY(cod_angajat), 
FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie), FOREIGN KEY(cod_job) REFERENCES JOB(cod_job));

insert into ANGAJAT values(100, 1, 200, 'Dumitrescu', 'Florin-Andrei', 12500, '10-10-2019', '0728356891');
insert into ANGAJAT values(101, 1, 201, 'Mocanu', 'Matei', 2100, '17-12-2019', '0761827164');
insert into ANGAJAT values(102, 1, 203, 'Enache', 'Sebastian-Ionut', 2000, '04-01-2020', '0734823178');
insert into ANGAJAT values(103, 2, 200, 'Borcea', 'Antonio-Valentin', 15000, '02-07-2019', '0767524632');
insert into ANGAJAT values(104, 2, 201, 'Dumitru', 'Marian', 2700, '23-08-2019', NULL);
insert into ANGAJAT values(105, 2, 202, 'Arsene', 'Ramona', 1501, '11-09-2019', '0721387258');
insert into ANGAJAT values(106, 3, 200, 'Stanescu', 'Atodiresei', 13000, '27-02-2019', '0738726129');
insert into ANGAJAT values(107, 3, 201, 'Florea', 'Gabita-Maria', 3100, '21-03-2019', NULL);
insert into ANGAJAT values(108, 3, 204, 'Pasca', 'Gheorge', 2300, '24-03-2019', '0736296152');
insert into ANGAJAT values(109, 4, 200, 'Constantinescu', 'Eduard', 14200, '08-04-2019', '0743231252');
insert into ANGAJAT values(110, 4, 201, 'Mihaescu', 'Mihai', 3420, '10-04-2019', NULL);
insert into ANGAJAT values(111, 4, 202, 'Stan', 'Adda', 1600, '12-04-2019', '0775867898');
insert into ANGAJAT values(112, 5, 200, 'Barbu', 'Maria', 14000, '15-01-2019', '0787679388');
insert into ANGAJAT values(113, 5, 201, 'Costea', 'Marinela-Georgeta', 2050, '20-01-2019', '0732455243');
insert into ANGAJAT values(114, 5, 202, 'Paun', 'Aurel-Marcel', 1999, '22-01-2019', NULL);
commit;
select * from ANGAJAT;

--BONUS

create table BONUS (cod_bonus number(3), cod_angajat number(3), data_angajare date, vechime varchar(15), valoare number(5), recurenta varchar(15), PRIMARY KEY(cod_bonus),
FOREIGN KEY(cod_angajat) REFERENCES ANGAJAT(cod_angajat));

insert into BONUS values(900, 102, '04-01-2020', '1 an+', 300, '4 luni');
insert into BONUS values(901, 104, '23-08-2019', '1 an+', 300, '3 luni');
insert into BONUS values(902, 108, '24-03-2019', '2 ani+', 500, '4 luni');
insert into BONUS values(903, 111, '12-04-2019', '2 ani+', 400, '3 luni');
insert into BONUS values(904, 113, '20-01-2019', '2 ani+', 450, '4 luni');
commit;
select * from BONUS;

--OFERTA

create table OFERTA(cod_oferta number(3), dicount number(2) not null, valabilitate date not null, PRIMARY KEY(cod_oferta));

insert into OFERTA values(800, 10, '01-09-2021');
insert into OFERTA values(801, 20, '15-08-2021');
insert into OFERTA values(802, 25, '01-08-2021');
insert into OFERTA values(803, 30, '15-07-2021');
insert into OFERTA values(804, 40, '01-07-2021');
commit;
select * from OFERTA;

--BON

create table BON(cod_bon number(3), cod_angajat number(3) not null, cod_client number(3) not null, valoare number(5) not null, data date not null, PRIMARY KEY(cod_bon),
FOREIGN KEY(cod_angajat) REFERENCES ANGAJAT(cod_angajat), FOREIGN KEY(cod_client) REFERENCES CLIENT(cod_client));

insert into BON values(1, 101, 100, 1500, '01-01-2021');
insert into BON values(2, 104, 105, 750, '23-12-2020');
insert into BON values(3, 107, 107, 500, '04-12-2020');
insert into BON values(4, 110, 109, 600, '10-11-2020');
insert into BON values(5, 113, 113, 120, '07-03-2021');
commit;
select * from BON;

--CURIER

create table CURIER(cod_curier number(3), cost_livrare number(4), durata_livrare number(2) not null, adresa varchar(50) not null, PRIMARY KEY(cod_curier));

insert into CURIER values(500, 25, 2, 'Calea Dragasani 4');
insert into CURIER values(501, 15, 3, 'Strada Acvariului 20');
insert into CURIER values(502, NULL, 1, 'Strada Victoriei 17');
insert into CURIER values(503, 50, 4, 'Strada Stejarului 23');
insert into CURIER values(504, 100, 5, 'Strada Campului 10');
commit;
select * from CURIER;

--EDITURA

create table EDITURA(cod_editura number(3), nume varchar(25) not null, PRIMARY KEY(cod_editura));

insert into EDITURA values(700, 'Corint');
insert into EDITURA values(701, 'Carminis');
insert into EDITURA values(702, 'Paralela 45');
insert into EDITURA values(703, 'Arthur');
insert into EDITURA values(704, 'Humanitas');
commit;
select * from EDITURA;

--AUTOR

create table AUTOR(cod_autor number(3), nume varchar(25) not null, prenume varchar(25) not null, varsta number(2), PRIMARY KEY(cod_autor));

insert into AUTOR values(300, 'Bishop', 'Gary John', NULL);
insert into AUTOR values(301, 'Kiyosaki', 'Robert Toru', 74);
insert into AUTOR values(302, 'Manson', 'Mark', 37);
insert into AUTOR values(303, 'Voss', 'Christopher', 79);
insert into AUTOR values(304, 'Dutton', 'Kevin', 54);
commit;
select * from AUTOR;

--CARTE

create table CARTE(cod_carte number(3), cod_editura number(3) not null, cod_autor number(3) not null, cod_curier number(3), nume varchar(25) not null,
PRIMARY KEY(cod_carte), FOREIGN KEY (cod_editura) REFERENCES EDITURA(cod_editura), FOREIGN KEY (cod_autor) REFERENCES AUTOR(cod_autor), FOREIGN KEY (cod_curier) REFERENCES CURIER(cod_CURIER));

insert into CARTE values(100, 700, 300, NULL, 'Unf#ck yourself');
insert into CARTE values(101, 701, 301, NULL, 'Tata bogat tata sarac');
insert into CARTE values(102, 702, 302, 502, 'Arta subtila a nepasarii');
insert into CARTE values(103, 703, 303, 501, 'Arta negocierii');
insert into CARTE values(104, 704, 304, NULL, 'Arta manipularii');
commit;
select * from CARTE;

--I_SE_FACE

create table I_SE_FACE(cod_client number(3), cod_oferta number(3), tip_oferta varchar(15) not null, PRIMARY KEY(cod_client, cod_oferta),
FOREIGN KEY(cod_client) REFERENCES CLIENT(cod_client), FOREIGN KEY(cod_oferta) REFERENCES OFERTA(cod_oferta));

insert into I_SE_FACE values(100, 804, 'telefonica');
insert into I_SE_FACE values(102, 800, 'telefonica');
insert into I_SE_FACE values(103, 800, 'in magazin');
insert into I_SE_FACE values(104, 801, 'in magazin');
insert into I_SE_FACE values(106, 801, 'in magazin');
insert into I_SE_FACE values(107, 802, 'telefonica');
insert into I_SE_FACE values(110, 802, 'telefonica');
insert into I_SE_FACE values(111, 803, 'in magazin');
insert into I_SE_FACE values(113, 803, 'in magazin');
insert into I_SE_FACE values(114, 804, 'telefonica');
commit;
select * from I_SE_FACE;

--ARE

create table ARE(cod_librarie number(3), cod_client number(3), numar_produse number(2), PRIMARY KEY(cod_librarie, cod_client),
FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie), FOREIGN KEY(cod_client) REFERENCES CLIENT(cod_client));

insert into ARE values(1, 100, 20);
insert into ARE values(1, 101, 18);
insert into ARE values(2, 104, 5);
insert into ARE values(2, 105, 10);
insert into ARE values(3, 107, 13);
insert into ARE values(3, 108, 7);
insert into ARE values(4, 110, 15);
insert into ARE values(4, 111, 3);
insert into ARE values(5, 112, 11);
insert into ARE values(5, 114, 9);
commit;
select * from ARE;

--VINDE

create table VINDE(cod_librarie number(3), cod_carte number(3), stoc_librarie number(3), pret_librarie number(3), PRIMARY KEY(cod_librarie, cod_carte),
FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie), FOREIGN KEY(cod_carte) REFERENCES CARTE(cod_carte));

insert into VINDE values(1, 100, 50, 65);
insert into VINDE values(1, 101, 100, 100);
insert into VINDE values(1, 102, 40, 50);
insert into VINDE values(1, 103, 60, 75);
insert into VINDE values(1, 104, 25, 40);
insert into VINDE values(2, 100, 30, 60);
insert into VINDE values(2, 101, 75, 90);
insert into VINDE values(2, 102, NULL, NULL);
insert into VINDE values(2, 103, 50, 70);
insert into VINDE values(2, 104, NULL, NULL);
insert into VINDE values(3, 100, NULL, NULL);
insert into VINDE values(3, 101, 42, 70);
insert into VINDE values(3, 102, NULL, NULL);
insert into VINDE values(3, 103, NULL, NULL);
insert into VINDE values(3, 104, 27, 50);
insert into VINDE values(4, 100, 23, 70);
insert into VINDE values(4, 101, 50, 99);
insert into VINDE values(4, 102, 38, 48);
insert into VINDE values(4, 103, 63, 72);
insert into VINDE values(4, 104, NULL, NULL);
insert into VINDE values(5, 100, 62, 67);
insert into VINDE values(5, 101, NULL, NULL);
insert into VINDE values(5, 102, 24, 55);
insert into VINDE values(5, 103, NULL, NULL);
insert into VINDE values(5, 104, 45, 50);
commit;
select * from VINDE;



-- CERINTA 6

/*

    Formulati în  limbaj  natural o problema pe care sa o rezolvati folosind un subprogram stocat care sa utilizeze doua tipuri 
    de colectie studiate.
    Apelati subprogramul.
    
    Afisati salariile si datele de angajare unui anumit job din toate librariile cu un cod primit ca input de la user.

*/


CREATE OR REPLACE 
    PROCEDURE subprogram_1 (cod_1 angajat.cod_job%TYPE)
    IS 
        TYPE tablou_imbricat IS TABLE OF angajat.salariu%TYPE;
        tablou tablou_imbricat;
        TYPE tablou_indexat IS TABLE OF angajat.data_angajare%TYPE INDEX BY PLS_INTEGER;
        tablou_2 tablou_indexat;
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Job-ul cu codul ' || cod_1 || ' are salariile : ');
        
        SELECT salariu 
        BULK COLLECT INTO tablou
        FROM angajat
        WHERE cod_job = cod_1; 
        
        SELECT data_angajare
        BULK COLLECT INTO tablou_2
        FROM angajat
        WHERE cod_job = cod_1; 
            
        FOR i in tablou.first .. tablou.last loop
            DBMS_OUTPUT.PUT_LINE('Salariu ' || tablou(i) || ' si data angajarii ' || tablou_2(i));
        END LOOP;
END subprogram_1; 
/

DECLARE
    cod_aux angajat.cod_job%TYPE := &cod_aux;
BEGIN
    subprogram_1(cod_aux);
END; 
/

DROP PROCEDURE subprogram_1;


-- CERINTA 7

/*

    Formulati în  limbaj  natural o problema pe care sa o rezolvati folosind un subprogram stocat care sa utilizeze un tip de cursor studiat.
    Apelati subprogramul.

    Afisati cate bonuri a eliberat fiecare librarie, valoarea tuturor bonurilor si valoarea medie a unui bon.

*/


CREATE OR REPLACE 
    PROCEDURE subprogram_2
    IS
        cod angajat.cod_librarie%TYPE;
        nr NUMBER(2);
        val NUMBER(5);
        CURSOR c IS
            SELECT angajat.cod_librarie, COUNT(bon.cod_bon), SUM(bon.valoare)
            FROM angajat, bon, librarie
            WHERE angajat.cod_angajat = bon.cod_angajat AND angajat.cod_librarie = librarie.cod_librarie
            GROUP BY angajat.cod_librarie;
    BEGIN
        OPEN C;
        LOOP
            FETCH c INTO cod, nr, val;
            EXIT WHEN c%NOTFOUND;
            IF nr = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Libraria cu codul ' || cod || ' nu a eliberat bonuri.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Libraria cu codul ' || cod || ' a eliberat ' || nr || ' bonuri cu valoarea ' || val || 
                ' si valoarea medie a unui bon este ' || val / nr);
        END IF;
        END LOOP;
        CLOSE c;
END subprogram_2;
/


BEGIN
    subprogram_2;
END;
/


DROP PROCEDURE subprogram_2;


-- CERINTA 8

/*

     Formulati în  limbaj  natural o problema pe care sa o rezolvati folosind un subprogram stocat de tip functie care sa utilizeze
     într-o singura comanda SQL 3 dintre tabelele definite. Tratati toate exceptiile care pot aparea. 
     
     Apelati subprogramul astfel încât sa evidentiati toate cazurile tratate.
     
     In cazul in care clientul a primit o oferta, afisati valoarea bonului corespunzator aplicant reducerea. 
     In cazul in care clientul nu a primit o oferta afisati un mesaj corespunzator.

*/



CREATE OR REPLACE
    FUNCTION functie_1(cod_c client.cod_client%TYPE)
    RETURN NUMBER
    IS 
        valoare_1 bon.valoare%TYPE;
        reducere oferta.dicount%TYPE;
    BEGIN
        SELECT bon.valoare
        INTO valoare_1
        FROM bon, i_se_face, oferta
        WHERE bon.cod_client = cod_c AND cod_c = i_se_face.cod_client AND i_se_face.cod_oferta = oferta.cod_oferta;
        
        SELECT oferta.dicount
        INTO reducere
        FROM bon, i_se_face, oferta
        WHERE bon.cod_client = cod_c AND cod_c = i_se_face.cod_client AND i_se_face.cod_oferta = oferta.cod_oferta;
        
        RETURN valoare_1 - ( valoare_1 * (reducere * 0.01) );
        
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Clientul cu codul ' || cod_c || ' nu beneficiaza de reducere.');
END functie_1;
/
      

DECLARE
    cod client.cod_client%TYPE;
    CURSOR c_2 IS
        SELECT cod_client
        FROM client;
BEGIN
    OPEN c_2;
    LOOP
        FETCH c_2 INTO cod;
        EXIT WHEN c_2%NOTFOUND;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Clientul cu codul ' || cod || ' beneficiaza de reducere si plateste: ' || functie_1(cod));
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT('');
        END;
    END LOOP;
    CLOSE c_2;
END;
/

DROP FUNCTION functie_1;

-- CERINTA 9

/*

    Formulati în  limbaj  natural o problema pe care sa o rezolvati folosind un subprogram stocat de tip procedura care sa 
    utilizeze într-o singura comanda SQL 5 dintre tabelele definite. Tratati toate exceptiile care pot aparea, 
    incluzand exceptiile NO_DATA_FOUND si TOO_MANY_ROWS. Apelati subprogramul astfel încat sa evidentiati toate cazurile tratate

    Afisati locatia librariei care are carti ce sunt livrate de catre un curier dat.
*/


CREATE OR REPLACE 
    PROCEDURE subprogram_3(cod_c curier.cod_curier%TYPE)
    IS
        adr locatie.adresa%TYPE;
    BEGIN
        SELECT locatie.adresa
        INTO adr
        FROM locatie, librarie, vinde, carte, curier
        WHERE curier.cod_curier = cod_c AND curier.cod_curier = carte.cod_curier AND
              carte.cod_carte = vinde.cod_carte AND vinde.cod_librarie = librarie.cod_librarie AND 
              librarie.cod_librarie = locatie.cod_librarie;
        
        DBMS_OUTPUT.PUT_LINE('Adresa librariei la care livreaza curierul ' || cod_c || ' este : ' || adr);
        
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Curierul ' || cod_c || ' nu livreaza la nicio librarie');
            WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Curierul ' || cod_c || ' livreaza la mai multe librarii');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Alta eroare!');
END subprogram_3;
/

DECLARE
    cod_c curier.cod_curier%TYPE;
    CURSOR c_3 IS
        SELECT cod_curier
        FROM curier;
BEGIN
    OPEN c_3;
    LOOP
        FETCH c_3 INTO cod_c;
        EXIT WHEN c_3%NOTFOUND;
        subprogram_3(cod_c);
    END LOOP;
    CLOSE c_3;
END;
/

-- AM ADAUGAT ACESTE 2 LINII TEMPORAR IN TABEL DEOARECE AVEAM DOAR CAZURI CARE IMI INTRAU PE EXCEPTII.

insert into CARTE values(105, 704, 304, 500, 'Sapiens');
insert into VINDE values(5, 105, 20, 10);

delete from vinde where cod_carte = 105;
delete from carte where cod_carte = 105;

DROP PROCEDURE subprogram_3;


-- CERINTA 10

/*

    Definiti un trigger de tip LMD la nivel de comand?. Declansati trigger-ul.

    Creati un trigger de timp LMD care permite modificarea inregistrarilor din tabela VIDNE
    doar de luni pana vineri intre orele 8 - 20.

*/


CREATE OR REPLACE TRIGGER trigger_1 
    BEFORE INSERT OR UPDATE OR DELETE ON vinde
BEGIN
    IF (TO_CHAR(SYSDATE,'D') = 1 OR TO_CHAR(SYSDATE,'D') = 7) OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 20) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nu se poate modifica stocul librariilor in afara programului de munca!'); 
    END IF; 
END; 
/

UPDATE vinde
SET stoc_librarie = 20
WHERE cod_librarie = 1 and cod_carte = 100;

DROP TRIGGER trigger_1;


-- CERINTA 11

/*

    Definiti un trigger de tip LMD la nivel de linie. Declansati trigger-ul.

    Creati un trigger de tip LMD care nu permite modificarea vechimiii unui client la o data mai recenta decat cea precedenta.

*/


CREATE OR REPLACE TRIGGER trigger_2
    BEFORE UPDATE OF vechime ON client
    FOR EACH ROW
BEGIN
    IF( SYSDATE - :NEW.vechime < SYSDATE - :OLD.vechime) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Noua vechime a unui client nu poate fi mai mica decat vechimea precedenta!');
    END IF;
END;
/


UPDATE client
SET vechime = '21-12-2020'
WHERE cod_client = 100;

DROP TRIGGER trigger_2;


-- CERINTA 12

/*

    Definiti un trigger de tip LDD. Declansati trigger-ul.
    
    Creati un trigger care tine evidenta modificarilor de tip LDD facute asupra tabelei ANGAJAT ( User, Comanda, Data);
    Stocati modificarile intr-un tabel auxiliar.
    

*/

CREATE TABLE logs (nume_user         VARCHAR2(25),
                   modificare        VARCHAR2(25),
                   tabela_modificare VARCHAR2(25),
                   data_modificarii  DATE);

CREATE OR REPLACE TRIGGER trigger_3
    AFTER CREATE OR DROP OR ALTER ON DATABASE
BEGIN
    INSERT INTO logs
    VALUES(SYS.LOGIN_USER, SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/

CREATE TABLE aux AS SELECT salariu FROM angajat;

DROP TABLE aux;

SELECT * FROM logs;

DROP TRIGGER trigger_3;

DROP TABLE logs;


-- CERINTA 13

/*

    Definiti un pachet care sa contina toate obiectele definite în cadrul proiectului.

*/

CREATE OR REPLACE PACKAGE pachet AS
    PROCEDURE subprogram_1 (cod_1 angajat.cod_job%TYPE);
    PROCEDURE subprogram_2;
    FUNCTION functie_1(cod_c client.cod_client%TYPE)
        RETURN NUMBER;
    PROCEDURE subprogram_3(cod_c curier.cod_curier%TYPE);
END pachet;
/


CREATE OR REPLACE PACKAGE BODY pachet AS

    PROCEDURE subprogram_1 (cod_1 angajat.cod_job%TYPE)
    IS 
        TYPE tablou_imbricat IS TABLE OF angajat.salariu%TYPE;
        tablou tablou_imbricat;
        TYPE tablou_indexat IS TABLE OF angajat.data_angajare%TYPE INDEX BY PLS_INTEGER;
        tablou_2 tablou_indexat;
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Job-ul cu codul ' || cod_1 || ' are salariile : ');
        
        SELECT salariu 
        BULK COLLECT INTO tablou
        FROM angajat
        WHERE cod_job = cod_1; 
        
        SELECT data_angajare
        BULK COLLECT INTO tablou_2
        FROM angajat
        WHERE cod_job = cod_1; 
            
        FOR i in tablou.first .. tablou.last loop
            DBMS_OUTPUT.PUT_LINE('Salariu ' || tablou(i) || ' si data angajarii ' || tablou_2(i));
        END LOOP;
    END subprogram_1; 
    
    PROCEDURE subprogram_2
    IS
        cod angajat.cod_librarie%TYPE;
        nr NUMBER(2);
        val NUMBER(5);
        CURSOR c IS
            SELECT angajat.cod_librarie, COUNT(bon.cod_bon), SUM(bon.valoare)
            FROM angajat, bon, librarie
            WHERE angajat.cod_angajat = bon.cod_angajat AND angajat.cod_librarie = librarie.cod_librarie
            GROUP BY angajat.cod_librarie;
    BEGIN
        OPEN C;
        LOOP
            FETCH c INTO cod, nr, val;
            EXIT WHEN c%NOTFOUND;
            IF nr = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Libraria cu codul ' || cod || ' nu a eliberat bonuri.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Libraria cu codul ' || cod || ' a eliberat ' || nr || ' bonuri cu valoarea ' || val || 
                ' si valoarea medie a unui bon este ' || val / nr);
        END IF;
        END LOOP;
        CLOSE c;
    END subprogram_2;
    
    FUNCTION functie_1(cod_c client.cod_client%TYPE)
    RETURN NUMBER
    IS 
        valoare_1 bon.valoare%TYPE;
        reducere oferta.dicount%TYPE;
    BEGIN
        SELECT bon.valoare
        INTO valoare_1
        FROM bon, i_se_face, oferta
        WHERE bon.cod_client = cod_c AND cod_c = i_se_face.cod_client AND i_se_face.cod_oferta = oferta.cod_oferta;
        
        SELECT oferta.dicount
        INTO reducere
        FROM bon, i_se_face, oferta
        WHERE bon.cod_client = cod_c AND cod_c = i_se_face.cod_client AND i_se_face.cod_oferta = oferta.cod_oferta;
        
        RETURN valoare_1 - ( valoare_1 * (reducere * 0.01) );
        
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Clientul cu codul ' || cod_c || ' nu beneficiaza de reducere.');
    END functie_1;
    
    PROCEDURE subprogram_3(cod_c curier.cod_curier%TYPE)
    IS
        adr locatie.adresa%TYPE;
    BEGIN
        SELECT locatie.adresa
        INTO adr
        FROM locatie, librarie, vinde, carte, curier
        WHERE curier.cod_curier = cod_c AND curier.cod_curier = carte.cod_curier AND
              carte.cod_carte = vinde.cod_carte AND vinde.cod_librarie = librarie.cod_librarie AND 
              librarie.cod_librarie = locatie.cod_librarie;
        
        DBMS_OUTPUT.PUT_LINE('Adresa librariei la care livreaza curierul ' || cod_c || ' este : ' || adr);
        
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Curierul ' || cod_c || ' nu livreaza la nicio librarie');
            WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Curierul ' || cod_c || ' livreaza la mai multe librarii');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Alta eroare!');
    END;
    
END pachet;
/


EXECUTE pachet.subprogram_1(200);
EXECUTE pachet.subprogram_2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Valoare bon dupa discount: ' || pachet.functie_1(100));
    DBMS_OUTPUT.PUT_LINE('Valoare : ' || pachet.functie_1(101));
    EXCEPTION 
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT('');
END;
/
EXECUTE pachet.subprogram_3(501);

DROP PACKAGE pachet;

