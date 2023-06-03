-- Tabla Local
CREATE TABLE Local (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Tabla EncargadoLocal
CREATE TABLE EncargadoLocal (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  local_id INTEGER,
  FOREIGN KEY (local_id) REFERENCES Local (id)
);

-- Tabla Repartidor
CREATE TABLE Repartidor (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  telefono TEXT,
  local_id INTEGER,
  FOREIGN KEY (local_id) REFERENCES Local (id)
);

-- Tabla RutaPedidos
CREATE TABLE RutaPedidos (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  repartidor_id INTEGER,
  FOREIGN KEY (repartidor_id) REFERENCES Repartidor (id)
);

-- Tabla Producto
CREATE TABLE Producto (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  tipo_producto_id INTEGER,
  FOREIGN KEY (tipo_producto_id) REFERENCES TipoProducto (id)
);

-- Tabla TipoProducto
CREATE TABLE TipoProducto (
  id INTEGER PRIMARY KEY,
  nombre TEXT
);

-- Tabla ProductoPrecios
CREATE TABLE ProductoPrecios (
  id INTEGER PRIMARY KEY,
  producto_id INTEGER,
  precio REAL,
  FOREIGN KEY (producto_id) REFERENCES Producto (id)
);

-- Tabla ComboProducto
CREATE TABLE ComboProducto (
  id INTEGER PRIMARY KEY,
  nombre TEXT
);

-- Tabla ProductoCombo
CREATE TABLE ProductoCombo (
  id INTEGER PRIMARY KEY,
  combo_id INTEGER,
  producto_id INTEGER,
  FOREIGN KEY (combo_id) REFERENCES ComboProducto (id),
  FOREIGN KEY (producto_id) REFERENCES Producto (id)
);

-- Tabla Pedido
CREATE TABLE Pedido (
  id INTEGER PRIMARY KEY,
  cliente_id INTEGER,
  ruta_id INTEGER,
  fecha TEXT,
  FOREIGN KEY (cliente_id) REFERENCES Cliente (id),
  FOREIGN KEY (ruta_id) REFERENCES RutaPedidos (id)
);

-- Tabla DetallePedido
CREATE TABLE DetallePedido (
  id INTEGER PRIMARY KEY,
  pedido_id INTEGER,
  producto_id INTEGER,
  cantidad INTEGER,
  FOREIGN KEY (pedido_id) REFERENCES Pedido (id),
  FOREIGN KEY (producto_id) REFERENCES Producto (id)
);

-- Tabla Cliente
CREATE TABLE Cliente (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  ubicacion_id INTEGER,
  FOREIGN KEY (ubicacion_id) REFERENCES Ubicacion (id)
);

-- Tabla Ubicacion
CREATE TABLE Ubicacion (
  id INTEGER PRIMARY KEY,
  nombre TEXT,
  facultad_id INTEGER,
  tipo_ubicacion_id INTEGER,
  FOREIGN KEY (facultad_id) REFERENCES Facultad (id),
  FOREIGN KEY (tipo_ubicacion_id) REFERENCES TipoUbicacion (id)
);

-- Tabla Facultad
CREATE TABLE Facultad (
  id INTEGER PRIMARY KEY,
  nombre TEXT
);

-- Tabla TipoUbicacion
CREATE TABLE TipoUbicacion (
  id INTEGER PRIMARY KEY,
  nombre TEXT
);
