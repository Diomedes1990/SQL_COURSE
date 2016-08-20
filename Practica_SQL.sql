use TSQL2012

--1. -El departamento de recursos humanos solicita un reporte de todos losempleados que tenga una “a” en su apellido.
SELECT * FROM HR.Employees where lastname LIKE'%a%'

--2.- otro donde los empleados tengan una “e” y una “s” en su apellido y que sunombre empiece con “S”
SELECT * FROM HR.Employees where lastname LIKE'%e%' AND lastname LIKE'%s%' AND firstname LIKE'S%'

--3.- Realice una consulta a la tabla empleado donde use los operadores AND y OR (EXplique)
SELECT * FROM HR.Employees WHERE (CITY = 'Seattle' AND title = 'CEO') OR (country = 'USA' AND address = '7890 - 20th Ave. E., Apt. 2A')


--ESTRUCTURAS DE CONTROL

--1.- Cree un script que evalúe dos números cuales quiera y diga cual es el mayor

DECLARE @Num1 int 
DECLARE @Num2 int

SET @Num1 = 20
SET @Num2 = 30

IF(@Num1 > @Num2)
	BEGIN
		PRINT 'El numero mayor: ' + CONVERT(varchar, @Num1) 
	END

ELSE
	BEGIN
	
		PRINT 'El numero mayor: ' + CONVERT(varchar, @Num2) 
	END


--2.- Cree un script sql que evalúe si un numero es par o impar

DECLARE @Valor INT = 7


IF((@Valor % 2) = 0)
	BEGIN
		PRINT 'ES PAR'
	END

ELSE
	BEGIN
		PRINT'ES IMPAR'
	END


--3.- Cree un script transact sql que convierta grados Celsius a grados fahrenheit
DECLARE @VALORCELCIUS FLOAT = 2
DECLARE @VALORFAREN FLOAT

	set @VALORFAREN = @VALORCELCIUS * 1.8 + 32 
	print @VALORFAREN
	
	
	
--5.- Cree un script que imprima las tablas de multiplicar del 1 al 12

DECLARE @INDEX INT = 0
DECLARE @TABLA INT = 1

WHILE(@TABLA <= 12)
BEGIN

	WHILE(@INDEX <= 12)
		BEGIN

		PRINT CONVERT(varchar, @TABLA) + ' X ' +  CONVERT(varchar, @INDEX) + ' = ' +  CONVERT(varchar, @TABLA * @INDEX)
			SET @INDEX =  @INDEX + 1
		END
		
SET @INDEX = 0
SET @TABLA =  @TABLA + 1

END


--6.- Hacer un script que permita escribir los primeros 100 números pares.

DECLARE @NUMERO INT = 0

WHILE(@NUMERO <= 100 * 2)
BEGIN

	IF((@NUMERO % 2) = 0)
		BEGIN
			PRINT @NUMERO
		END
		
SET @NUMERO = @NUMERO + 1

END

--7.- calcular el factorial de N (N!=1·2·3·...·N).
DECLARE @NUMERO_FACTORIAL INT = 1
DECLARE @INDEX2 INT = 5

WHILE(@INDEX2 > 0)
	BEGIN
		SET @NUMERO_FACTORIAL = @INDEX2 * @NUMERO_FACTORIAL
		SET @INDEX2 = @INDEX2 - 1
	END

PRINT @NUMERO_FACTORIAL


--8.- haga un escript que evalúe el día de la semana y de el mensaje “NO
--laborable” si el sábado o domingo y “Laborable” en caso contrario (use
--instrucción case)


SET LANGUAGE Spanish

SELECT CASE 
	WHEN (DATENAME(dw, GETDATE())) = 'Sabado' OR  (DATENAME(dw, GETDATE())) = 'Domingo' THEN 'No Laborable'
		ELSE 'Laborable' 
		END
