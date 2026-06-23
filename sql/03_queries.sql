USE streaming;

-- ------------------------------------------------------------
-- SELECT 1: JOIN com 2 Tabelas + GROUP BY
-- Conta o total de visualizações por filme
-- ------------------------------------------------------------
SELECT
    filmes.titulo,
    COUNT(*) AS total_visualizacoes
FROM visualizacoes
JOIN filmes ON visualizacoes.id_filme = filmes.id_filme
GROUP BY filmes.titulo;

-- Resultado esperado:
-- +--------------+--------------------+
-- | titulo       | total_visualizacoes|
-- +--------------+--------------------+
-- | Interestelar |                  2 |
-- | Titanic      |                  1 |
-- | Toy Story    |                  1 |
-- | Vingadores   |                  1 |
-- +--------------+--------------------+


-- ------------------------------------------------------------
-- SELECT 2: JOIN + GROUP BY + HAVING
-- Filmes com mais de 1 visualização
-- ------------------------------------------------------------
SELECT
    filmes.titulo,
    COUNT(*) AS total_visualizacoes
FROM visualizacoes
JOIN filmes ON visualizacoes.id_filme = filmes.id_filme
GROUP BY filmes.titulo
HAVING COUNT(*) > 1;

-- Resultado esperado:
-- +--------------+--------------------+
-- | titulo       | total_visualizacoes|
-- +--------------+--------------------+
-- | Interestelar |                  2 |
-- +--------------+--------------------+


-- ------------------------------------------------------------
-- SELECT 3: JOIN + GROUP BY + HAVING com Subselect
-- Filmes com total de visualizações acima da média geral
-- ------------------------------------------------------------
SELECT
    filmes.titulo,
    COUNT(*) AS total_visualizacoes
FROM visualizacoes
JOIN filmes ON visualizacoes.id_filme = filmes.id_filme
GROUP BY filmes.titulo
HAVING COUNT(*) > (
    SELECT AVG(qtd)
    FROM (
        SELECT COUNT(*) AS qtd
        FROM visualizacoes
        GROUP BY id_filme
    ) AS sub
);

-- Resultado esperado:
-- +--------------+--------------------+
-- | titulo       | total_visualizacoes|
-- +--------------+--------------------+
-- | Interestelar |                  2 |
-- +--------------+--------------------+
