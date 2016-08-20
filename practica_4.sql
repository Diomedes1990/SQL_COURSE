
/*1)  Hacer un estore procedure que reciba dos par�metros [c�digo del empleado] y [opci�n] y dependiendo de la opci�n 1) lista 
c�digo del empleado, nombre y apellido en may�sculas,titulo y fecha de contrataci�n, email (estar� formado por primera letra del 
nombre + el apellido @ +primeras cinco letras del titulo + .com, ejemplo: Sara Davis, CEO, quedara: sdavis@ceo.com y la opci�n 2) 
ser� listar c�digo del empleado, nombre y apellido en may�sculas, nombre completo del supervisor y su email. El par�metro numero de supervisor
debe ser opcional*/

CREATE PROCEDURE ejercicio1
(
@opcion char(2),
@codigo_empleado varchar(1) = NULL
)

AS 

BEGIN
    --PARA MOSTRAR INFORMACION DE TODOS LOS EMPLEADOS 
	IF (@opcion = 'IE') 
	BEGIN
		SELECT EmployeeID AS "Codigo Empleado", 
		UPPER(FirstName) AS Nombre, 
		UPPER(LastName) AS Apellido, 
		Title AS Titulo, 
		CONVERT(varchar, HireDate,103)  AS "Fecha Contratacion",
		LOWER(LEFT(FirstName,1)+LastName+'@'+RTRIM(LEFT(Title,5))+'.com')  AS "E-mail" 
		FROM Employees  
	END

	--PARA MOSTRAR INFORMACION DE UN EMPLEADO Y DE SU SUPERVISOR
	IF (@opcion = 'IES') 
	BEGIN
		IF (ISNULL(@codigo_empleado,'')='')
		BEGIN
		RAISERROR('Por favor introdusca El Codigo Del Empleado',11,1)
		END
		SELECT emp1.EmployeeID AS "Codigo Empleado", 
		UPPER(emp1.FirstName) AS Nombre, 
		UPPER(emp1.LastName) AS Apellido,
		emp2.FirstName+' '+emp2.LastName AS "Nombre Supervisor", 
		LOWER(LEFT(emp2.FirstName,1)+emp2.LastName+'@'+RTRIM(LEFT(emp2.Title,5))+'.com')  AS "E-mail" 
		FROM Employees AS emp1
		INNER JOIN Employees AS emp2 ON emp1.ReportsTo = emp2.EmployeeID WHERE emp1.EmployeeID = CAST(@codigo_empleado AS INT) 
	END

END


/*2)  Hacer un store procedure que muestre las ventas por vendedor de un periodo, los par�metros ser�n fecha inicial y fecha final. El listado debe mostrar c�digo del empleado, nombre
completo, total de ordenes del periodo*/

CREATE PROCEDURE ejercicio2
(
@final_inicial date,
@fecha_final date
)

AS 

BEGIN
    --VALIDADOR DE FECHA NO ESTE EN BLANCO NI NULO	
	IF ((ISNULL(@final_inicial,'') = '') OR (ISNULL(@fecha_final,'') = '')) 
	BEGIN
	RAISERROR('Una De Las Fechas No Es Validad',11,1)
	END
	ELSE
	BEGIN
		SELECT emp.EmployeeID AS "Codigo Empleado", 
		emp.FirstName+''+emp.LastName AS "Nombre Completo",
		COUNT(ord.OrderID) AS "Total de Ordenes"    
		FROM Employees AS emp
		INNER JOIN Orders AS ord ON emp.EmployeeID = ord.EmployeeID
		WHERE ord.OrderDate BETWEEN @final_inicial AND @fecha_final
		GROUP BY emp.EmployeeID, emp.FirstName, emp.LastName 
	END

END