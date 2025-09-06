DROP DATABASE IF EXISTS sog2_practica;
CREATE DATABASE IF NOT EXISTS sog2_practica;

CREATE TABLE IF NOT EXISTS sog2_practica.cliente (
    id INT PRIMARY KEY,
    genero ENUM('Masculino', 'Femenino') NOT NULL,
    edad INT NOT NULL
);

CREATE TABLE IF NOT EXISTS sog2_practica.categoria (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS sog2_practica.producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(64) NOT NULL,
    categoria INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (categoria) REFERENCES sog2_practica.categoria(id)
);

CREATE TABLE IF NOT EXISTS sog2_practica.metodo_pago (
    id INT PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS sog2_practica.region_envio (
    id INT PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS sog2_practica.orden (
    id INT PRIMARY KEY,
    fecha_compra DATE NOT NULL,
    cliente INT NOT NULL,
    metodo_pago INT NOT NULL,
    region_envio INT NOT NULL,
    FOREIGN KEY (cliente) REFERENCES sog2_practica.cliente(id),
    FOREIGN KEY (metodo_pago) REFERENCES sog2_practica.metodo_pago(id),
    FOREIGN KEY (region_envio) REFERENCES sog2_practica.region_envio(id)
);

CREATE TABLE IF NOT EXISTS sog2_practica.orden_producto (
    id INT PRIMARY KEY,
    total DECIMAL(10, 2) NOT NULL,
    orden INT NOT NULL,
    producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (orden) REFERENCES sog2_practica.orden(id),
    FOREIGN KEY (producto) REFERENCES sog2_practica.producto(id)
);