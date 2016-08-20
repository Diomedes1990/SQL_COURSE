--use TSQL2012

--select * 
--from 
--Sales.Orders 
--where empid in (select empid from HR.Employees where title like '%Sales%');

--declare @edad int = 12;

--if (@edad>=18)
--begin
--	print 'Es mayor de edad'
--end	
--else
--	print 'Es menor' 
	
	--	Ejemplos WHEN
	declare @edad int = 18;
	
	select 
	Case @edad
	when 18 then 'Es mayor de Edad'
	when 15 then 'Es menor '
	else 'valor no definido'
	end as VALID_EDAD
	
	--Select 
	--	Case  
	--	when @edad 
		
		
	DECLARE @CONTADOR INT =1
	
	WHILE (@CONTADOR <10)
	BEGIN
	select * from HR.EMPLOYEES WHERE empid = @CONTADOR;
	
		PRINT @CONTADOR
		SET @CONTADOR = @CONTADOR + 1
	END
	
	