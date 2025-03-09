-- Crear la tabla de permisos
CREATE TABLE permission (
    id SERIAL PRIMARY KEY,
    permission VARCHAR(255) NOT NULL UNIQUE
);

-- Crear la tabla de roles
CREATE TABLE role (
    id SERIAL PRIMARY KEY,
    role VARCHAR(255) NOT NULL
);

-- Crear la tabla de relación entre roles y permisos
CREATE TABLE role_permission (
    role_ide INT NOT NULL,
    premission_id INT NOT NULL,
    PRIMARY KEY (role_ide, premission_id),
    FOREIGN KEY (role_ide) REFERENCES role(id),
    FOREIGN KEY (premission_id) REFERENCES permission(id)
);

-- Crear la tabla de usuarios
CREATE TABLE app_user (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    profile_id BIGINT,
    password VARCHAR(255) NOT NULL,
    is_enabled BOOLEAN NOT NULL,
    account_non_expired BOOLEAN NOT NULL,
    account_non_locked BOOLEAN NOT NULL,
    credentials_non_expired BOOLEAN NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

-- Crear la tabla de relación entre usuarios y roles
CREATE TABLE user_roles (
    user_id BIGINT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES app_user(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- Insertar permisos
INSERT INTO permission (id, permission) VALUES (1, 'CREATE');
INSERT INTO permission (id, permission) VALUES (2, 'READ');
INSERT INTO permission (id, permission) VALUES (3, 'UPDATE');
INSERT INTO permission (id, permission) VALUES (4, 'DELETE');
INSERT INTO permission (id, permission) VALUES (5, 'REFACTOR');

-- Insertar roles
INSERT INTO role (id, role) VALUES (1, 'ADMIN');
INSERT INTO role (id, role) VALUES (2, 'USER');
INSERT INTO role (id, role) VALUES (3, 'NON_USER');
INSERT INTO role (id, role) VALUES (4, 'DEVELOPER');

-- Asignar permisos a roles
INSERT INTO role_permission (role_ide, premission_id) VALUES (1, 1);
INSERT INTO role_permission (role_ide, premission_id) VALUES (1, 2);
INSERT INTO role_permission (role_ide, premission_id) VALUES (1, 3);
INSERT INTO role_permission (role_ide, premission_id) VALUES (1, 4);
INSERT INTO role_permission (role_ide, premission_id) VALUES (1, 5);

INSERT INTO role_permission (role_ide, premission_id) VALUES (2, 1);
INSERT INTO role_permission (role_ide, premission_id) VALUES (2, 2);

INSERT INTO role_permission (role_ide, premission_id) VALUES (4, 1);
INSERT INTO role_permission (role_ide, premission_id) VALUES (4, 2);
INSERT INTO role_permission (role_ide, premission_id) VALUES (4, 3);
INSERT INTO role_permission (role_ide, premission_id) VALUES (4, 4);
INSERT INTO role_permission (role_ide, premission_id) VALUES (4, 5);

INSERT INTO role_permission (role_ide, premission_id) VALUES (3, 1);


-- vista para obtener los permisos segun el rol

CREATE VIEW role_permissions_view AS
SELECT 
    r.role AS role_name,  
    p.permission AS permission_name
FROM 
    role r
JOIN 
    role_permission rp ON r.id = rp.role_ide
JOIN 
    permission p ON rp.premission_id = p.id;
