BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Local" (
	"id_local"	INTEGER,
	"nombre_local"	TEXT NOT NULL,
	"direccion"	TEXT NOT NULL,
	"telefono"	TEXT,
	PRIMARY KEY("id_local")
);
CREATE TABLE IF NOT EXISTS "EncargadoLocal" (
	"id_encargado"	INTEGER,
	"nombre_encargado"	TEXT NOT NULL,
	"apellido_encargado"	TEXT NOT NULL,
	"telefono"	TEXT,
	"id_local"	INTEGER,
	FOREIGN KEY("id_local") REFERENCES "Local"("id_local"),
	PRIMARY KEY("id_encargado")
);
CREATE TABLE IF NOT EXISTS "Repartidor" (
	"id_repartidor"	INTEGER,
	"nombre_repartidor"	TEXT NOT NULL,
	"apellido_repartidor"	TEXT NOT NULL,
	"telefono"	TEXT,
	PRIMARY KEY("id_repartidor")
);
CREATE TABLE IF NOT EXISTS "RutaPedidos" (
	"id_ruta"	INTEGER,
	"nombre_ruta"	TEXT NOT NULL,
	"id_repartidor"	INTEGER,
	FOREIGN KEY("id_repartidor") REFERENCES "Repartidor"("id_repartidor"),
	PRIMARY KEY("id_ruta")
);
CREATE TABLE IF NOT EXISTS "Producto" (
	"id_producto"	INTEGER,
	"nombre_producto"	TEXT NOT NULL,
	"descripcion"	TEXT,
	"id_tipo_producto"	INTEGER,
	FOREIGN KEY("id_tipo_producto") REFERENCES "TipoProducto"("id_tipo_producto"),
	PRIMARY KEY("id_producto")
);
CREATE TABLE IF NOT EXISTS "TipoProducto" (
	"id_tipo_producto"	INTEGER,
	"nombre_tipo_producto"	TEXT NOT NULL,
	PRIMARY KEY("id_tipo_producto")
);
CREATE TABLE IF NOT EXISTS "ProductoPrecios" (
	"id_producto_precio"	INTEGER,
	"id_producto"	INTEGER,
	"precio"	REAL NOT NULL,
	"fecha_actualizacion"	TEXT NOT NULL,
	FOREIGN KEY("id_producto") REFERENCES "Producto"("id_producto"),
	PRIMARY KEY("id_producto_precio")
);
CREATE TABLE IF NOT EXISTS "ComboProducto" (
	"id_combo_producto"	INTEGER,
	"nombre_combo_producto"	TEXT NOT NULL,
	"precio"	REAL NOT NULL,
	PRIMARY KEY("id_combo_producto")
);
CREATE TABLE IF NOT EXISTS "Pedido" (
	"id_pedido"	INTEGER,
	"fecha_pedido"	TEXT NOT NULL,
	"id_cliente"	INTEGER,
	"id_ruta"	INTEGER,
	FOREIGN KEY("id_cliente") REFERENCES "Cliente"("id_cliente"),
	FOREIGN KEY("id_ruta") REFERENCES "RutaPedidos"("id_ruta"),
	PRIMARY KEY("id_pedido")
);
CREATE TABLE IF NOT EXISTS "DetallePedido" (
	"id_detalle_pedido"	INTEGER,
	"id_pedido"	INTEGER,
	"id_producto"	INTEGER,
	"id_combo_producto"	INTEGER,
	"cantidad"	INTEGER NOT NULL,
	FOREIGN KEY("id_producto") REFERENCES "Producto"("id_producto"),
	FOREIGN KEY("id_combo_producto") REFERENCES "ComboProducto"("id_combo_producto"),
	FOREIGN KEY("id_pedido") REFERENCES "Pedido"("id_pedido"),
	PRIMARY KEY("id_detalle_pedido")
);
CREATE TABLE IF NOT EXISTS "Cliente" (
	"id_cliente"	INTEGER,
	"nombre_cliente"	TEXT NOT NULL,
	"apellido_cliente"	TEXT NOT NULL,
	"telefono"	TEXT,
	"id_ubicacion"	INTEGER,
	FOREIGN KEY("id_ubicacion") REFERENCES "Ubicacion"("id_ubicacion"),
	PRIMARY KEY("id_cliente")
);
CREATE TABLE IF NOT EXISTS "Ubicacion" (
	"id_ubicacion"	INTEGER,
	"nombre_ubicacion"	TEXT NOT NULL,
	"id_facultad"	INTEGER,
	"id_tipo_ubicacion"	INTEGER,
	FOREIGN KEY("id_facultad") REFERENCES "Facultad"("id_facultad"),
	FOREIGN KEY("id_tipo_ubicacion") REFERENCES "TipoUbicacion"("id_tipo_ubicacion"),
	PRIMARY KEY("id_ubicacion")
);
CREATE TABLE IF NOT EXISTS "Facultad" (
	"id_facultad"	INTEGER,
	"nombre_facultad"	TEXT NOT NULL,
	PRIMARY KEY("id_facultad")
);
CREATE TABLE IF NOT EXISTS "TipoUbicacion" (
	"id_tipo_ubicacion"	INTEGER,
	"nombre_tipo_ubicacion"	TEXT NOT NULL,
	PRIMARY KEY("id_tipo_ubicacion")
);
COMMIT;
