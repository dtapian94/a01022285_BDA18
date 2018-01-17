Daniel Tapia Nava A01022285

1) Muestra producto pro "product line"


delimiter $$ 
create procedure show_products(
IN linea_producto varchar(50))
BEGIN 
	declare line varchar(50);
    
    set line = concat(linea_producto, "%");
    select * from products
    where productLine like line;
END$$
delimiter ;



2) Muestra cuantos clientes inicia su nombre con "una letra"

CREATE PROCEDURE clients_by_letter
(
	IN letter VARCHAR(1)
)
BEGIN
	SELECT *
    FROM customers
    WHERE customerName like concat(letter, '%');
END$$

CREATE PROCEDURE product_max_min_values()
BEGIN
    SELECT MAX(MSRP), MIN(MSRP) FROM products;
END$$



3) Muestra el productor mas caro y el mas barato 

CREATE PROCEDURE product_max_min()
BEGIN
    SELECT *
    FROM products
    WHERE MSRP = (SELECT MAX(MSRP) FROM products) OR MSRP = (SELECT MIN(MSRP) FROM products)
    ORDER BY MSRP DESC;
END$$

delimiter ; 