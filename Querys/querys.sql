1.1 Obtener los nombres de los prodcutos de la tienda
SELECT nombre FROM articulos ORDER BY nombre ASC

1.2 Obtener los nombres y los precios de los prodcutos de la tienda
SELECT nombre, precio FROM articulos ORDER BY precio,nombre ASC

1.3 Obtener el nombre de los productos cuyo precio sea menor o igual a 200
SELECT nombre FROM articulos WHERE precio <= 200 ORDER BY precio ASC

1.4 Obtener todos los datos de articulos cuyo precio este entre 60 y 120
SELECT * FROM articulos  WHERE precio >= 60 AND precio <= 120 ORDER BY precio ASC

1.5 Obtener el nombre y el precio de los articulos en pesetas
SELECT nombre, precio *166.386 AS precio_pesetas FROM articulos order by precio_pesetas ASC

1.6 Selecionar el precio medio de todos los articulos
SELECT ROUND(AVG(precio),2) FROM articulos 

1.7 Obtener el precio medio de los articulos cuyo código de fabricante sea 2
SELECT ROUND(AVG(precio),2) FROM articulos WHERE fabricante = 2

1.8 Obtener el numero de articulos cuyo precio sea mayor o igual a 180
SELECT COUNT(codigo) FROM articulos WHERE precio >= 180

1.9 Obtener el nombre y precio de los articulos cuyo precio sea mayor o igual a 180
ordenandolos descendentemente por precio y ascendentemente por nombre
SELECT nombre,precio FROM articulos WHERE precio >= 180 ORDER BY precio DESC, nombre ASC

1.10 Obtener un listado completo de articulos incluyendo por cada articulo los datos del articulo y de su fabricante
SELECT * FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo

1.11 Obtener un listado de articulos, incluyendo el nombre del articulo, el precio y el nombre de su fabricante
SELECT articulos.nombre AS articulo,
precio, 
fabricantes.nombre AS fabricante
FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo

1.12 Obtener el precio medio de los productos de cada fabricante, mostrando solo el codigo de fabricante
SELECT fabricantes.codigo, AVG(articulos.precio) AS precio
FROM fabricantes LEFT JOIN articulos ON fabricantes.codigo = articulos.fabricante   
GROUP BY fabricantes.codigo

1.13 Obtener el precio medio de los productos de cada fabricante mostrando el nombre del fabricante
SELECT fabricantes.nombre, 
AVG(articulos.precio) AS precio
FROM fabricantes LEFT JOIN articulos ON fabricantes.codigo = articulos.fabricante   
GROUP BY fabricantes.codigo

1.14 Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150
SELECT AVG(precio), fabricantes.nombre FROM fabricantes, articulos
WHERE fabricantes.codigo = articulos.codigo 
GROUP BY fabricantes.nombre 
HAVING AVG(precio) >= 150

1.15 Obtener el nombre y el precio del articulo más barato
SELECT nombre, precio FRom articulos 
WHERE precio =( SELECT MIN(precio) from articulos)

1.16 Obtener una lista con el nombre y precio de los articulos mas caros de cada proveedor(incluyendo el nombre del proveedor)
SELECT articulos.nombre, precio, fabricantes.nombre FROM articulos 
INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo
WHERE precio IN (SELECT MAX(precio) FROM articulos GROUP BY fabricante)

1.17 Añadir un nuevo producto: Altavoces de 70€  (del fabricante 2)
INSERT INTO articulos(codigo,nombre,precio,fabricante)
VALUES (11,'Altavoces', 70 ,2)

1.18 Cambiar el nombre del producto 8 a ’Impresora Laser’
UPDATE articulos 
SET nombre = 'Impresora Laser'
WHERE codigo = 8

1.19 Aplicar un descuento del 10 % (multiplicar el precio por 0’9) a todos los productos
UPDATE articulos SET precio = precio * 0.9

1.20 Aplicar descuento de 10€ a los productos mayor o igual que 120
UPDATE articulos SET precio = precio - 10
WHERE precio >= 120
