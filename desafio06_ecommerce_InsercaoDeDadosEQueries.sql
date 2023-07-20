-- Inserção de dados e queries

use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
        VALUES('John', 'D.', 'Doe', '12345678901', '123 Main Street, Anytown, CA 91234'),
    ('Jane', 'S.', 'Smith', '98765432109', '456 Elm Street, Anytown, CA 91234'),
    ('Mary', 'M.', 'Jones', '09876543219', '789 Oak Street, Anytown, CA 91234'),
    ('Peter', 'B.', 'Williams', '87654321987', '101 Pine Street, Anytown, CA 91234'),
    ('Susan', 'A.', 'Brown', '76543219876', '202 Maple Street, Anytown, CA 91234'),
    ('David', 'C.', 'Green', '65432198765', '303 Elm Street, Anytown, CA 91234'),
    ('Michael', 'D.', 'Black', '54321987654', '404 Oak Street, Anytown, CA 91234'),
    ('Sarah', 'E.', 'White', '43219876543', '505 Pine Street, Anytown, CA 91234'),
    ('John', 'F.', 'Gray', '32198765432', '606 Maple Street, Anytown, CA 91234'),
    ('Jane', 'G.', 'Pink', '21987654321', '707 Elm Street, Anytown, CA 91234');
    
-- idProduct, Pname, classification_kids boolean,category('Eletrônico','Vestimanta','Brinquedos','Alimentos','Móveis'), avaliação, size
INSERT INTO product (Pname, classification_kids, category, avaliação, size) VALUES
        ('Toy Car', 'Yes', 'Toys', 5, 'Small'),
    ('Ball', 'Yes', 'Toys', 4, 'Medium'),
    ('Doll', 'Yes', 'Toys', 3, 'Large'),
    ('Book', 'No', 'Books', 2, 'Small'),
    ('Magazine', 'No', 'Books', 1, 'Medium'),
    ('Notebook', 'No', 'Books', 0, 'Large'),
    ('Computer', 'No', 'Electronics', 5, 'Small'),
    ('Phone', 'No', 'Electronics', 4, 'Medium'),
    ('Tablet', 'No', 'Electronics', 3, 'Large'),
    ('TV', 'No', 'Electronics', 2, 'Small');


SELECT * FROM clients;

SELECT * FROM product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUE
    (1, default, 'This is a pending order.', 10.00, 0),
    (2, 'Shipped', 'This is a shipped order.', 20.00, 1),
    (3, 'Confirmado', 'This is a completed order.', 30.00, 1),
    (4, 'Cancelled', 'This is a cancelled order.', 40.00, 0),
    (5, 'Refunded', 'This is a refunded order.', 50.00, 0),
    (6, default, 'This is another pending order.', 60.00, 1),
    (7, 'Shipped', 'This is another shipped order.', 70.00, 1),
    (8, 'Confirmado', 'This is another completed order.', 80.00, 1),
    (9, 'Cancelled', 'This is another cancelled order.', 90.00, 0),
    (10, 'Refunded', 'This is another refunded order.', 100.00, 0);

SELECT * FROM orders;
DELETE FROM orders WHERE idOrderClient in (1,2,3,4,5,6,7,8,9,10);


INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
        (1,1,2,null),
        (2,2,1,null),
        (3,3,1,null);

desc productOrder;
        
INSERT INTO productStorage (storageLocation,quantity) VALUES
        ('Minas Gerais',1000),
        ('Rio de Janeiro', 500),
        ('São Paulo', 17000),
        ('Brasília', 2500);
        
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
        (1,2,'RJ'),
        (2,6,'MG');
        
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
        ('Almeida e Filhos', 123456789123456, '21985474'),
        ('Joao da Silva', 123456789654321, '219854584'),
        ('Palmeiras Eletronicos',987654321123456, '21975474');
        
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
        (1,1,500),
        (1,2,400),
        (2,4,633),
        (3,3,5),
        (2,5,10);
        
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
        (1,6,80),
        (2,7,10);
        
SELECT * FROM productSeller;

SELECT * FROM clients c, orders o WHERE c.idClient = idOrderClient;

SELECT Fname,Lname, idOrder, orderStatus FROM clients c, orders o WHERE c.idClient = idOrderClient;

SELECT concat(Fname,' ',Lname) AS Client, idOrder AS Request, orderStatus AS STATUS FROM clients c, orders o WHERE c.idClient = idOrderClient;

SELECT count(*) FROM clients c, orders o
            WHERE c.idClient = idOrderClient;
            
SELECT * FROM clients LEFT OUTER JOIN orders ON idClient = idOrderClient;

SELECT * FROM clients c INNER JOIN orders o ON c.idClient = o.idOrderClient
                INNER JOIN productOrder p ON p.idPOorder = o.idOrder;
                    