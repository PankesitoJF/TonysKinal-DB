Use DBTonysKinal2020;

/*1;Vista de la consulta No.1*/ 
create view vw_consulta1 as SELECT Apellidos_Empleado FROM Empleados;

/*2;Vista de la consulta No.2*/
create view vw_consulta2 as SELECT id_cat_empleado,1.02*salario,1.02*bonificacion FROM tbl_comisiones; 

/*3;Vista de la consulta No.3*/
create view vw_consulta3 as SELECT nombre_empleado, YEAR(fecha_contratacion) FROM tbl_empleados;

/*4;Vista de la consulta No.4*/
create view vw_consulta4 as SELECT edad_empleado FROM tbl_empleados; 

/*5;Vista de la consulta No.5*/
create view vw_consulta5 as SELECT edad_empleado, COUNT(edad_empleado) FROM tbl_empleados GROUP BY edad_empleado; 

/*6;Vista de la consulta No.6*/
create view vw_consulta6 as  SELECT departamento, AVG(edad_empleado) FROM tbl_empleados,tbl_departamento GROUP BY departamento;

/*7;Vista de la consulta No.7*/
create view vw_consulta7 as SELECT * FROM tbl_comisiones WHERE salario>35000; 

/*8;Vista de la consulta No.8*/
create view vw_consulta8 as SELECT * FROM tbl_empleados WHERE id_empleado= 5; 

/*9;Vista de la consulta No.9*/
create view vw_consulta9 as SELECT * FROM tbl_empleados WHERE departamento<> "Informatica"; 

/*10;Vista de la consulta No.10*/
create view vw_consulta10 as SELECT * FROM tbl_empleados WHERE fecha_contratacion>='2018-01-01' AND fecha_contratacion<'2018-12-31';

/*11;Vista de la consulta No.11*/
create view vw_consulta11 as SELECT * FROM tbl_categoria_empleado WHERE categoria_empleado<>'empleado';

/*12;Vista de la consulta No.12*/
create view vw_consulta12 as SELECT * FROM tbl_empleados WHERE fecha_contratacion BETWEEN '2017-01-01' AND '2019-12-31';  

/*13;Vista de la consulta No.13*/
create view vw_consulta13 as SELECT * FROM tbl_comisiones WHERE salario NOT BETWEEN 35000 AND 40000;

/*14;Vista de la consulta No.14*/
create view vw_consulta14 as SELECT * FROM tbl_categoria_empleado WHERE categoria_empleado IN (1,2); 

/*15;Vista de la consulta No.15*/
create view vw_consulta15 as SELECT * FROM tbl_empleados WHERE nombre_empleado LIKE 'Jose %';

/*16;Vista de la consulta No.16*/
create view vw_consulta16 as SELECT * FROM tbl_empleados join tbl_categoria_empleado WHERE categoria_empleado='administrativo' AND edad_empleado>35;

/*17;Vista de la consulta No.17*/
create view vw_consulta17 as SELECT * FROM tbl_departamento WHERE NOT departamento='Contabilidad';

/*18;Vista de la consulta No.18*/
create view vw_consulta18 as SELECT nombre_empleado,edad_empleado FROM tbl_empleados ORDER BY edad_empleado;

/*19;Vista de la consulta No.19*/
create view vw_consulta19 as SELECT nombre_empleado,edad_empleado FROM tbl_empleados ORDER BY nombre_empleado DESC; 

/*20;Vista de la consulta No.20*/
create view vw_consulta20 as SELECT nombre_empleado,categoria_empleado FROM tbl_empleados, tbl_categoria_empleado
WHERE empleados.categoria=id_cat_empleado.id_departamento;

/*21;Vista de la consulta No.21*/
create view vw_consulta21 as SELECT seccion,id_departamento FROM nombre_oficina, oficinas
WHERE nombre_oficina.oficina=oficinas.oficina AND region='centro';  