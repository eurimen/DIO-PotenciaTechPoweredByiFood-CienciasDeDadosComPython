--Criação Banco de Dados juntamente com suas tabelas
-- Criação do Banco de Dados
CREATE DATABASE ecommerce;

-- Conectando no Banco
USE ecommerce;

-- Criar tabela Cliente

CREATE TABLE clients(
        idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
        );
        

desc clients;


-- Criar Tabela Produto
CREATE TABLE product(
        idProduct int auto_increment primary key,
        Pname varchar(10),
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        avaliação float default 0,
        size varchar(10)
        );
        
desc product;        

-- Criar Tabela Pagamento
CREATE TABLE payments(
        idclient int,
        idPayment int,
        typePayment enum('Boleto','Cartão','Dois cartões'),
        limitAvailable float,
        primary key(idClient, id_payment)
        );

-- Criar Tabela Pedido
CREATE TABLE orders(
        idOrder int auto_increment primary key,
        idOrderClient int,
        orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        constraint fk_order_client foreign key (idOrderClient) references clients(idClient)
        );
 
 desc orders;       
        
-- Criar Tabela Estoque
CREATE TABLE productStorage(
       idProdStorage int auto_increment primary key,
       storageLocation varchar(255),
       quantity int default 0
       );
       
desc productStorage;       
       
-- Criar Tabela Fornecedor
CREATE TABLE supplier(
        idSupplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
        );
        
desc supplier;        
        
-- Criar Tabela Vendedor
CREATE TABLE seller(
        idSeller int auto_increment primary key,
        SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(11),
        location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
        );
        
desc seller;
        
-- Criar Tabela Produtos Vendidos
CREATE TABLE productSeller(
        idPseller int,
        idPproduct int,
        prodQuantity int default 1,
        primary key (idPseller, idPproduct),
        constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
        constraint fk_product_product foreign key (idPproduct) references product(idProduct)
        );
        
desc productSeller;
        
-- Criar Tabela ProductOrder
CREATE TABLE productOrder(
        idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum('Disponível','Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
        constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
        );
        
desc productOrder;
        
-- Cirar tabela Localização do Estoque
CREATE TABLE storageLocation(
        idLproduct int,
        idLstorage int,
        location varchar(255) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
        constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
        );
        
desc storageLocation;
        
-- Criar Tabela Suprimentos Produtos
CREATE TABLE productSupplier(
        idPsSupplier int,
        idPsProduct int,
        quantity int not null,
        primary key (idPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
        constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
        );
        
desc productSupplier;

show tables;

SHOW DATABASES;

USE information_schema;

SHOW TABLES;

DESC table_constraints;