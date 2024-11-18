CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    senha VARCHAR2(100) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dispositivos (
    dispositivo_id INT PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    tipo VARCHAR2(50) NOT NULL,
    descricao VARCHAR2(255),
    status VARCHAR2(20) DEFAULT 'Desligado',
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

CREATE TABLE consumo_energia (
    consumo_id INT PRIMARY KEY,
    dispositivo_id INT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    consumo_kwh DECIMAL(10, 2),
    custo DECIMAL(10, 2),
    FOREIGN KEY (dispositivo_id) REFERENCES dispositivos(dispositivo_id)
);

CREATE TABLE dicas_energia (
    dica_id INT PRIMARY KEY,
    titulo VARCHAR2(100) NOT NULL,
    descricao VARCHAR2(255) NOT NULL,
    tipo_dica VARCHAR2(50),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE relatorios_uso (
    relatorio_id INT PRIMARY KEY,
    usuario_id INT,
    data_inicio TIMESTAMP,
    data_fim TIMESTAMP,
    total_consumo DECIMAL(10, 2),
    total_custo DECIMAL(10, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

CREATE SEQUENCE seq_usuario_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_dispositivo_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_consumo_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_dica_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_relatorio_id START WITH 1 INCREMENT BY 1;

INSERT INTO usuarios (usuario_id, nome, email, senha)
VALUES (seq_usuario_id.NEXTVAL, 'João Silva', 'joao.silva@email.com', 'senha123');

INSERT INTO usuarios (usuario_id, nome, email, senha)
VALUES (seq_usuario_id.NEXTVAL, 'Maria Oliveira', 'maria.oliveira@email.com', 'senha123');

INSERT INTO dispositivos (dispositivo_id, nome, tipo, descricao, usuario_id)
VALUES (seq_dispositivo_id.NEXTVAL, 'Ar-condicionado', 'Ar-condicionado', 'Ar-condicionado no quarto', 1);

INSERT INTO dispositivos (dispositivo_id, nome, tipo, descricao, usuario_id)
VALUES (seq_dispositivo_id.NEXTVAL, 'Lâmpada LED', 'Iluminação', 'Lâmpada LED na sala', 2);

INSERT INTO consumo_energia (consumo_id, dispositivo_id, consumo_kwh, custo)
VALUES (seq_consumo_id.NEXTVAL, 1, 5.3, 3.75);

INSERT INTO consumo_energia (consumo_id, dispositivo_id, consumo_kwh, custo)
VALUES (seq_consumo_id.NEXTVAL, 2, 1.2, 0.80);

INSERT INTO dicas_energia (dica_id, titulo, descricao, tipo_dica)
VALUES (seq_dica_id.NEXTVAL, 'Economize no Ar-condicionado', 'Mantenha a temperatura do ar-condicionado em 24°C.', 'Temperatura');

INSERT INTO dicas_energia (dica_id, titulo, descricao, tipo_dica)
VALUES (seq_dica_id.NEXTVAL, 'Desligue as lâmpadas quando não precisar', 'Desligue as lâmpadas ao sair de um ambiente para economizar energia.', 'Iluminação');

INSERT INTO relatorios_uso (relatorio_id, usuario_id, data_inicio, data_fim, total_consumo, total_custo)
VALUES (seq_relatorio_id.NEXTVAL, 1, TO_TIMESTAMP('2024-11-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-07 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 15.2, 10.70);

INSERT INTO relatorios_uso (relatorio_id, usuario_id, data_inicio, data_fim, total_consumo, total_custo)
VALUES (seq_relatorio_id.NEXTVAL, 2, TO_TIMESTAMP('2024-11-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-07 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 5.5, 4.30);

SELECT nome, tipo, status FROM dispositivos;

SELECT d.nome, c.consumo_kwh, c.custo, c.data
FROM consumo_energia c
JOIN dispositivos d ON c.dispositivo_id = d.dispositivo_id;

SELECT titulo, descricao FROM dicas_energia;

SELECT r.data_inicio, r.data_fim, r.total_consumo, r.total_custo
FROM relatorios_uso r
WHERE r.usuario_id = 1;
