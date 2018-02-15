
# Daniel Tapia Nava A01022285
# Bases de datos avanzadas
# indexes:
# 1 - "index_1" - orderLineNumber
# 2 - "index_2" -(quantityOrdered, orderLineNumber)
# 3 - "index_3" -(orderLineNumber, quantityOrdered)

#CREATE INDEX index_1 ON orderdetails (orderLineNumber);
#CREATE INDEX index_2 ON orderdetails (quantityOrdered, orderLineNumber);
#CREATE INDEX index_3 ON orderdetails (orderLineNumber, quantityOrdered);

EXPLAIN format=json
SELECT *
FROM orderdetails force index(index_4)
WHERE orderLineNumber = 1 and quantityOrdered > 50;


EXPLAIN format=json
SELECT productCode
FROM orderdetails force index(index_4)
WHERE orderLineNumber = 1 and quantityOrdered > 50;


EXPLAIN format=json
SELECT orderLineNumber, count(*)
FROM orderdetails force index(index_4)
WHERE orderLineNumber = 1 and quantityOrdered > 50;