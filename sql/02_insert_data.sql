-- ============================================================
-- Sistema de Streaming — DML (INSERT)
-- Universidade Presbiteriana Mackenzie — 2026.01
-- ============================================================

USE streaming;

-- ------------------------------------------------------------
-- Filmes
-- ------------------------------------------------------------
INSERT INTO filmes (titulo, categoria, duracao_min) VALUES
  ('Interestelar', 'Ficcao',   169),
  ('Titanic',      'Romance',  195),
  ('Vingadores',   'Acao',     143),
  ('Toy Story',    'Animacao',  81);

-- ------------------------------------------------------------
-- Usuários
-- ------------------------------------------------------------
INSERT INTO usuarios (nome, email) VALUES
  ('Alice',   'alice@email.com'),
  ('Bruno',   'bruno@email.com'),
  ('Carla',   'carla@email.com');

-- ------------------------------------------------------------
-- Visualizações
-- ------------------------------------------------------------
INSERT INTO visualizacoes (id_usuario, id_filme, tempo_assistido, data_visualizacao) VALUES
  (1, 1, 169, '2026-05-20'),  -- Alice assistiu Interestelar completo
  (1, 3, 120, '2026-05-21'),  -- Alice assistiu Vingadores parcialmente
  (2, 2, 195, '2026-05-21'),  -- Bruno assistiu Titanic completo
  (3, 4,  81, '2026-05-22'),  -- Carla assistiu Toy Story completo
  (3, 1, 150, '2026-05-22');  -- Carla assistiu Interestelar parcialmente

-- ------------------------------------------------------------
-- Verificação
-- ------------------------------------------------------------
SELECT * FROM filmes;
SELECT * FROM usuarios;
SELECT * FROM visualizacoes;
