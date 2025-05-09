CREATE DATABASE IF NOT EXISTS tienda_online;
USE tienda_online;

CREATE TABLE t_usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    email VARCHAR(200),
    password VARCHAR(200),
    rol INT(11),
    imagen VARCHAR(255),
    PRIMARY KEY (id_usuario)
);

CREATE TABLE t_categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (id_categoria)
);

CREATE TABLE t_productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    id_categoria INT(11),
    nombre VARCHAR(100),
    precio FLOAT(100,2),
    stock INT(10),
    oferta VARCHAR(20),
    fecha DATE,
    imagen VARCHAR(255),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES t_categorias(id_categoria)
);

CREATE TABLE t_pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    ciudad VARCHAR(100),
    direccion VARCHAR(200),
    costo FLOAT(100,2),
    estado VARCHAR(20),
    fecha DATE,
    hora TIME,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_usuario) REFERENCES t_usuarios(id_usuario)
);

CREATE TABLE t_lineapedidos (
    id_lineapedido INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT(11),
    unidades INT(10),
    PRIMARY KEY (id_lineapedido),
    FOREIGN KEY (id_pedido) REFERENCES t_pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES t_productos(id_producto)
);


