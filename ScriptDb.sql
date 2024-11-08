-- La base de datos fue creada con Render, la documentación está en el archivo de documentación del proyecto

CREATE SCHEMA parcial3;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE parcial3.elementos (
    guid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre VARCHAR(255) NOT NULL,
    simbolo VARCHAR(255) NOT NULL,
    numero_atomico INT NOT NULL,
    configuracion_electronica VARCHAR(255) NOT NULL
);

CREATE TABLE parcial3.compuestos (
    guid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre VARCHAR(255) NOT NULL,
    formula VARCHAR(255) NOT NULL,
    masa_molar FLOAT NOT NULL,
    estado_agregacion VARCHAR(255) NOT NULL
);

CREATE TABLE ELEMENTOS_POR_COMPUESTO (
    guid_elemento UUID NOT NULL,
    guid_compuesto UUID NOT NULL,
    cantidad INT NOT NULL,
    formula_quimica VARCHAR(255) NOT NULL,

    PRIMARY KEY (guid_elemento, guid_compuesto),
    FOREIGN KEY (guid_elemento) REFERENCES ELEMENTOS(guid),
    FOREIGN KEY (guid_compuesto) REFERENCES COMPUESTOS(guid)
);

-- Insertar más elementos en la tabla 'elementos'
INSERT INTO parcial3.elementos (nombre, simbolo, numero_atomico, configuracion_electronica) VALUES
    ('Hidrógeno', 'H', 1, '1s1'),
    ('Helio', 'He', 2, '1s2'),
    ('Oxígeno', 'O', 8, '1s2 2s2 2p4'),
    ('Carbono', 'C', 6, '1s2 2s2 2p2'),
    ('Nitrógeno', 'N', 7, '1s2 2s2 2p3'),
    ('Sodio', 'Na', 11, '1s2 2s2 2p6 3s1'),
    ('Cloro', 'Cl', 17, '1s2 2s2 2p6 3s2 3p5'),
    ('Azufre', 'S', 16, '1s2 2s2 2p6 3s2 3p4'),
    ('Calcio', 'Ca', 20, '1s2 2s2 2p6 3s2 3p6 4s2'),
    ('Hierro', 'Fe', 26, '1s2 2s2 2p6 3s2 3p6 3d6 4s2'),
    ('Cobre', 'Cu', 29, '1s2 2s2 2p6 3s2 3p6 3d10 4s1'),
    ('Aluminio', 'Al', 13, '1s2 2s2 2p6 3s2 3p1');

-- Insertar más compuestos en la tabla 'compuestos'
INSERT INTO parcial3.compuestos (nombre, formula, masa_molar, estado_agregacion) VALUES
    ('Agua', 'H2O', 18.015, 'líquido'),
    ('Dióxido de Carbono', 'CO2', 44.01, 'gas'),
    ('Metano', 'CH4', 16.04, 'gas'),
    ('Amoníaco', 'NH3', 17.031, 'gas'),
    ('Cloruro de Sodio', 'NaCl', 58.44, 'sólido'),
    ('Sulfato de Calcio', 'CaSO4', 136.14, 'sólido'),
    ('Hidróxido de Sodio', 'NaOH', 39.997, 'sólido'),
    ('Sulfato de Cobre (II)', 'CuSO4', 159.609, 'sólido'),
    ('Óxido de Aluminio', 'Al2O3', 101.96, 'sólido'),
    ('Dióxido de Azufre', 'SO2', 64.07, 'gas');


-- Insertar las relaciones entre elementos y compuestos en la tabla 'ELEMENTOS_POR_COMPUESTO'
-- Para H2O (Agua)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'H'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'H2O'), 2, 'H2O'),
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'H2O'), 1, 'H2O');

-- Para CO2 (Dióxido de Carbono)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'C'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CO2'), 1, 'CO2'),
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CO2'), 2, 'CO2');

-- Para NaCl (Cloruro de Sodio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Na'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaCl'), 1, 'NaCl'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Cl'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaCl'), 1, 'NaCl');

-- Para CaSO4 (Sulfato de Calcio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Ca'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CaSO4'), 1, 'CaSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'S'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CaSO4'), 1, 'CaSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CaSO4'), 4, 'CaSO4');

-- Para NaOH (Hidróxido de Sodio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Na'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaOH'), 1, 'NaOH'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaOH'), 1, 'NaOH'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'H'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaOH'), 1, 'NaOH');

-- Para CuSO4 (Sulfato de Cobre II)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Cu'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CuSO4'), 1, 'CuSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'S'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CuSO4'), 1, 'CuSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CuSO4'), 4, 'CuSO4');

-- Para Al2O3 (Óxido de Aluminio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Al'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'Al2O3'), 2, 'Al2O3'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'Al2O3'), 3, 'Al2O3');

-- Para SO2 (Dióxido de Azufre)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'S'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'SO2'), 1, 'SO2'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'SO2'), 2, 'SO2');


SELECT
    c.nombre AS compuesto_nombre,
    c.formula AS compuesto_formula,
    e.nombre AS elemento_nombre,
    epc.cantidad AS cantidad_elementos
FROM
    parcial3.elementos_por_compuesto epc
        JOIN
    parcial3.elementos e ON epc.guid_elemento = e.guid
        JOIN
    parcial3.compuestos c ON epc.guid_compuesto = c.guid
ORDER BY
    c.nombre, e.nombre;




    Teniendo en cuenta esta estructura, necesito que me des los códigos de todos los archivos para poder realizar la siguiente actividad.

Ten en cuenta que esta es mi base de datos:

-- La base de datos fue creada con Render, la documentación está en el archivo de documentación del proyecto

CREATE SCHEMA parcial3;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE parcial3.elementos (
    guid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre VARCHAR(255) NOT NULL,
    simbolo VARCHAR(255) NOT NULL,
    numero_atomico INT NOT NULL,
    configuracion_electronica VARCHAR(255) NOT NULL
);

CREATE TABLE parcial3.compuestos (
    guid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre VARCHAR(255) NOT NULL,
    formula VARCHAR(255) NOT NULL,
    masa_molar FLOAT NOT NULL,
    estado_agregacion VARCHAR(255) NOT NULL
);

CREATE TABLE ELEMENTOS_POR_COMPUESTO (
    guid_elemento UUID NOT NULL,
    guid_compuesto UUID NOT NULL,
    cantidad INT NOT NULL,
    formula_quimica VARCHAR(255) NOT NULL,

    PRIMARY KEY (guid_elemento, guid_compuesto),
    FOREIGN KEY (guid_elemento) REFERENCES ELEMENTOS(guid),
    FOREIGN KEY (guid_compuesto) REFERENCES COMPUESTOS(guid)
);

-- Insertar más elementos en la tabla 'elementos'
INSERT INTO parcial3.elementos (nombre, simbolo, numero_atomico, configuracion_electronica) VALUES
    ('Hidrógeno', 'H', 1, '1s1'),
    ('Helio', 'He', 2, '1s2'),
    ('Oxígeno', 'O', 8, '1s2 2s2 2p4'),
    ('Carbono', 'C', 6, '1s2 2s2 2p2'),
    ('Nitrógeno', 'N', 7, '1s2 2s2 2p3'),
    ('Sodio', 'Na', 11, '1s2 2s2 2p6 3s1'),
    ('Cloro', 'Cl', 17, '1s2 2s2 2p6 3s2 3p5'),
    ('Azufre', 'S', 16, '1s2 2s2 2p6 3s2 3p4'),
    ('Calcio', 'Ca', 20, '1s2 2s2 2p6 3s2 3p6 4s2'),
    ('Hierro', 'Fe', 26, '1s2 2s2 2p6 3s2 3p6 3d6 4s2'),
    ('Cobre', 'Cu', 29, '1s2 2s2 2p6 3s2 3p6 3d10 4s1'),
    ('Aluminio', 'Al', 13, '1s2 2s2 2p6 3s2 3p1');

-- Insertar más compuestos en la tabla 'compuestos'
INSERT INTO parcial3.compuestos (nombre, formula, masa_molar, estado_agregacion) VALUES
    ('Agua', 'H2O', 18.015, 'líquido'),
    ('Dióxido de Carbono', 'CO2', 44.01, 'gas'),
    ('Metano', 'CH4', 16.04, 'gas'),
    ('Amoníaco', 'NH3', 17.031, 'gas'),
    ('Cloruro de Sodio', 'NaCl', 58.44, 'sólido'),
    ('Sulfato de Calcio', 'CaSO4', 136.14, 'sólido'),
    ('Hidróxido de Sodio', 'NaOH', 39.997, 'sólido'),
    ('Sulfato de Cobre (II)', 'CuSO4', 159.609, 'sólido'),
    ('Óxido de Aluminio', 'Al2O3', 101.96, 'sólido'),
    ('Dióxido de Azufre', 'SO2', 64.07, 'gas');


-- Insertar las relaciones entre elementos y compuestos en la tabla 'ELEMENTOS_POR_COMPUESTO'
-- Para H2O (Agua)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'H'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'H2O'), 2, 'H2O'),
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'H2O'), 1, 'H2O');

-- Para CO2 (Dióxido de Carbono)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'C'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CO2'), 1, 'CO2'),
   ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CO2'), 2, 'CO2');

-- Para NaCl (Cloruro de Sodio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Na'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaCl'), 1, 'NaCl'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Cl'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaCl'), 1, 'NaCl');

-- Para CaSO4 (Sulfato de Calcio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Ca'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CaSO4'), 1, 'CaSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'S'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CaSO4'), 1, 'CaSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CaSO4'), 4, 'CaSO4');

-- Para NaOH (Hidróxido de Sodio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Na'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaOH'), 1, 'NaOH'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaOH'), 1, 'NaOH'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'H'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'NaOH'), 1, 'NaOH');

-- Para CuSO4 (Sulfato de Cobre II)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Cu'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CuSO4'), 1, 'CuSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'S'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CuSO4'), 1, 'CuSO4'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'CuSO4'), 4, 'CuSO4');

-- Para Al2O3 (Óxido de Aluminio)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'Al'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'Al2O3'), 2, 'Al2O3'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'Al2O3'), 3, 'Al2O3');

-- Para SO2 (Dióxido de Azufre)
INSERT INTO ELEMENTOS_POR_COMPUESTO (guid_elemento, guid_compuesto, cantidad, formula_quimica) VALUES
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'S'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'SO2'), 1, 'SO2'),
    ((SELECT guid FROM parcial3.elementos WHERE simbolo = 'O'), (SELECT guid FROM parcial3.compuestos WHERE formula = 'SO2'), 2, 'SO2');


SELECT
    c.nombre AS compuesto_nombre,
    c.formula AS compuesto_formula,
    e.nombre AS elemento_nombre,
    epc.cantidad AS cantidad_elementos
FROM
    parcial3.elementos_por_compuesto epc
        JOIN
    parcial3.elementos e ON epc.guid_elemento = e.guid
        JOIN
    parcial3.compuestos c ON epc.guid_compuesto = c.guid
ORDER BY
    c.nombre, e.nombre;