/*1.- Hacer un reporte que muestre el c�digo del empleado, nombre, supervisor (reportsto),
y la cantidad de ordenes por mes que el empleado ha
realizado por a�o (1996,1997,1998)*/

SELECT emp.empid AS "Codigo del Empleado", emp.FirstName AS Nombre ,emp2.FirstName AS "Supervisor",
	SUM(CASE WHEN YEAR(ord.OrderDate) = 1996 then 1 END ) as "1996",
	SUM(CASE WHEN YEAR(ord.OrderDate) = 1997 then 1 END ) as "1997",
	SUM(CASE WHEN YEAR(ord.OrderDate) = 1998 then 1 END ) as "1998",
	COUNT(ord.OrderDate) AS "Cantidad de Ordenes" FROM HR.Employees AS emp
	INNER JOIN SALES.Orders AS ord ON emp.empid = ord.empid
	INNER JOIN HR.Employees AS emp2 ON emp.mgrid = emp2.empid
WHERE YEAR(ord.OrderDate) IN (1996,1997,1998)
GROUP BY emp.empid, emp.FirstName, emp.mgrid, emp2.FirstName


/*2) -Hacer una consulta que liste c�digo, nombre, apellido del empleado y el numero y fecha de cada
orden que se han realizado. Al final el result set debe verse as�:*/

SELECT
	HR.Employees.empid AS 'Nombre',
	HR.Employees.firstname as 'Apellido',
	HR.Employees.lastname as 'Empleado',
	Orders.orderid AS 'Numero de Orden',
	Orders.orderdate as 'Fecha'
FROM
	SALES.Orders
	INNER JOIN HR.Employees 
ON Orders.empid=hr.Employees.empid


/*3) Crear un informe que muestra el ID del pedido, el nombre de la empresa que realiz� el pedido ,
y el nombre y apellido del trabajador asociado .
Mostrar s�lo los pedidos realizados a 1 de enero de 1998, que se enviaron despu�s de que fueran necesarios .
Ordenar por Nombre de la empresa. El result set debe verse as�.*/

SELECT
	Orders.orderid AS 'Numero de Orden',
	Sales.Customers.companyname AS 'Nombre Empresa',
	HR.Employees.firstname as 'Empleado Asociado'
FROM
SALES.Orders
INNER JOIN Sales.Customers ON Orders.custid=Sales.Customers.custid
INNER JOIN HR.Employees ON ORDERS.empid=HR.Employees.empid
where orderdate > '1998-01-01' and Orders.shippeddate > Orders.requireddate 
Order by
Sales.Customers.companyname



/*4) Cree un reporte que muestre el n�mero de empleados y clientes de cada ciudad que tiene empleados
en ella. El result set debe ser parecido a este:*/


SELECT q1.numEmployees, q2.numCompanies, q1.City , q2.City   FROM 
(SELECT COUNT(emp.City) AS numEmployees, emp.City AS City  FROM Hr.Employees AS emp GROUP BY emp.City)AS q1
INNER  JOIN 
(SELECT  COUNT(cus.City) AS numCompanies, cus.City AS City  FROM SALES.Customers AS cus GROUP BY cus.City)AS q2
ON q1.City = q2.City ORDER BY q2.numCompanies DESC


/*5) Cree un reporte que muestre en un solo result set, el nombre de contacto y numero de tel�fono de
todos los empleados, clientes y suplidores.*/


SELECT CAST(Hr.Employees.FirstName AS varchar)+SPACE(1)+CAST(Hr.Employees.LastName AS varchar) AS ContactName, Hr.Employees.phone AS Phone FROM HR.Employees
UNION
SELECT Sales.Customers.contactname, Sales.Customers.phone FROM SALES.Customers
UNION
SELECT Production.Suppliers.contactname, Production.Suppliers.phone FROM Production.Suppliers

