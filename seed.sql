INSERT INTO
    autores (nombre, pais)
VALUES (
        'Gabriel García Márquez',
        'Colombia'
    ),
    ('Mario Vargas Llosa', 'Perú'),
    ('Isabel Allende', 'Chile'),
    (
        'J. K. Rowling',
        'Reino Unido'
    ),
    ('Stephen King', 'EE.UU.');

INSERT INTO
    editoriales (nombre, pais)
VALUES ('Planeta', 'España'),
    (
        'Penguin Random House',
        'EE.UU.'
    ),
    ('Santillana', 'México');

INSERT INTO
    libros (
        titulo,
        isbn,
        precio,
        stock,
        autor_id,
        editorial_id
    )
VALUES (
        'Cien Años de Soledad',
        'ISBN001',
        45.00,
        20,
        1,
        1
    ),
    (
        'La Ciudad y los Perros',
        'ISBN002',
        35.00,
        15,
        2,
        1
    ),
    (
        'La Casa de los Espíritus',
        'ISBN003',
        40.00,
        10,
        3,
        2
    ),
    (
        'Harry Potter y la Piedra Filosofal',
        'ISBN004',
        50.00,
        30,
        4,
        2
    ),
    (
        'Harry Potter y la Cámara Secreta',
        'ISBN005',
        55.00,
        25,
        4,
        2
    ),
    (
        'It',
        'ISBN006',
        60.00,
        12,
        5,
        3
    ),
    (
        'Carrie',
        'ISBN007',
        38.00,
        18,
        5,
        3
    ),
    (
        'El Amor en los Tiempos del Cólera',
        'ISBN008',
        42.00,
        8,
        1,
        1
    ),
    (
        'Conversación en la Catedral',
        'ISBN009',
        36.00,
        6,
        2,
        1
    ),
    (
        'Paula',
        'ISBN010',
        32.00,
        14,
        3,
        2
    );

INSERT INTO
    clientes (nombre, correo, telefono)
VALUES (
        'Juan Pérez',
        'juanp@example.com',
        '987654321'
    ),
    (
        'María López',
        'marial@example.com',
        '912345678'
    ),
    (
        'Carlos Ramírez',
        'carlosr@example.com',
        '976543210'
    ),
    (
        'Ana Torres',
        'anat@example.com',
        '945678123'
    ),
    (
        'Luis Fernández',
        'luisf@example.com',
        '934567812'
    );

-- Ventas + detalle
INSERT INTO ventas (fecha, cliente_id) VALUES ('2025-10-01', 1);

INSERT INTO
    detalle_venta (venta_id, libro_id, cantidad)
VALUES (1, 1, 2),
    (1, 4, 1);

INSERT INTO ventas (fecha, cliente_id) VALUES ('2025-10-02', 2);

INSERT INTO
    detalle_venta (venta_id, libro_id, cantidad)
VALUES (2, 2, 1),
    (2, 6, 2);

INSERT INTO ventas (fecha, cliente_id) VALUES ('2025-10-03', 3);

INSERT INTO
    detalle_venta (venta_id, libro_id, cantidad)
VALUES (3, 5, 1),
    (3, 7, 1),
    (3, 3, 1);

--Extra inserciones para la vista extra:
INSERT INTO
    libros (
        titulo,
        isbn,
        precio,
        stock,
        autor_id,
        editorial_id
    )
VALUES (
        'El Resplandor',
        'ISBN011',
        58.00,
        22,
        5,
        3
    ),
    (
        'La Sombra del Viento',
        'ISBN012',
        47.00,
        30,
        3,
        2
    ),
    (
        'Los Miserables',
        'ISBN013',
        65.00,
        10,
        2,
        1
    ),
    (
        'Don Quijote de la Mancha',
        'ISBN014',
        55.00,
        12,
        2,
        1
    ),
    (
        'Cuentos de Eva Luna',
        'ISBN015',
        38.00,
        0,
        3,
        3
    ),
    (
        'Harry Potter y el Príncipe Mestizo',
        'ISBN016',
        57.00,
        18,
        4,
        2
    ),
    (
        'Harry Potter y el Prisionero de Azkaban',
        'ISBN017',
        52.00,
        8,
        4,
        2
    ),
    (
        'Misery',
        'ISBN018',
        60.00,
        5,
        5,
        3
    ),
    (
        'El Visitante',
        'ISBN019',
        62.00,
        0,
        5,
        3
    ),
    (
        'El Otoño del Patriarca',
        'ISBN020',
        45.00,
        14,
        1,
        1
    ),
    (
        'Travesuras de la Niña Mala',
        'ISBN021',
        48.00,
        11,
        2,
        1
    ),
    (
        'La Tía Julia y el Escribidor',
        'ISBN022',
        44.00,
        13,
        2,
        1
    ),
    (
        'Del Amor y Otros Demonios',
        'ISBN023',
        40.00,
        7,
        1,
        1
    ),
    (
        'El Juego del Ángel',
        'ISBN024',
        49.00,
        9,
        3,
        2
    ),
    (
        'Doctor Sueño',
        'ISBN025',
        59.00,
        0,
        5,
        3
    );