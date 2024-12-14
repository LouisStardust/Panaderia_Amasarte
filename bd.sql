CREATE DATABASE IF NOT EXISTS panaderia;
USE panaderia;
CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR(255) NOT NULL, 
password VARCHAR(255) NOT NULL,
dinero decimal (10,2) not null
);

INSERT INTO clientes (username, password,dinero) VALUES
('Valelu', '293120','120'),
('Luis', '150806','160'),

CREATE TABLE IF NOT EXISTS desarrolladores (
id_desarrollador INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL
);
INSERT INTO desarrolladores (username, password) VALUES
('Admin', 'Admin12'),
('proadmin' , 'pro12'),

CREATE TABLE IF NOT EXISTS productos(
id_producto INT auto_increment primary key not null,
nombre VARCHAR(255) NOT NULL,
precio DECIMAL(10, 2) NOT NULL, 
cantidad_stock INT NOT NULL ,
imagen varchar (255));
INSERT INTO productos (nombre, precio, cantidad_stock,imagen) VALUES
('Rosca de Reyes', 125.00, 100,'/imagenes/rosca.jpg'),
('Fruit Cake', '15.00', 60,'/imagenes/FruitCake.jpg'),
('Pannetone', 22.00, 90,'/imagenes/Pannetone.jpg');

CREATE TABLE IF NOT EXISTS carrito_compras (
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    producto varchar (100),
    cantidad INT NOT NULL,
    precio_unitario decimal (10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto));

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    detalles JSON NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente));