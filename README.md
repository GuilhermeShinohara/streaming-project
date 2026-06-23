# 🎬 Sistema de Streaming — Banco de Dados em Nuvem (AWS)

> Projeto integrado das disciplinas **Serviços em Nuvem** e **Tópicos em Banco de Dados**  
> Universidade Presbiteriana Mackenzie — 2026.01  
> Professor: Jamilson Bispo dos Santos

---

## 📋 Descrição

Sistema de streaming de filmes com banco de dados **MariaDB 10.5** hospedado em instância **EC2 (Amazon Linux 2023, t2.micro)** provisionada via AWS Academy. O projeto contempla criação de tabelas, inserção de dados, consultas SQL avançadas e dashboards gerados com Python.

---

## 🏗️ Arquitetura

```
AWS Academy
└── EC2 (t2.micro — Amazon Linux 2023)
    └── MariaDB 10.5
        └── Database: streaming
            ├── filmes
            ├── usuarios
            └── visualizacoes
```

---

## 📁 Estrutura do Repositório

```
streaming-project/
├── README.md
├── sql/
│   ├── 01_create_tables.sql      # DDL — criação das tabelas
│   ├── 02_insert_data.sql        # DML — inserção de dados
│   └── 03_queries.sql            # Consultas obrigatórias (JOIN, GROUP BY, HAVING, Subselect)
├── dashboard/
│   └── dashboard.py              # Geração dos gráficos com matplotlib
└── docs/
    └── infrastructure.md         # Detalhes da infraestrutura AWS
```

---

## 🗄️ Banco de Dados

### Tabelas

| Tabela | Descrição |
|---|---|
| `filmes` | Catálogo de filmes (título, categoria, duração) |
| `usuarios` | Cadastro de usuários da plataforma |
| `visualizacoes` | Registro de visualizações (relaciona usuário e filme) |

### Dados de exemplo

**filmes:**
| id | titulo | categoria | duracao_min |
|---|---|---|---|
| 1 | Interestelar | Ficção | 169 |
| 2 | Titanic | Romance | 195 |
| 3 | Vingadores | Ação | 143 |
| 4 | Toy Story | Animação | 81 |

---

## 📊 Consultas SQL

| # | Tipo | Descrição |
|---|---|---|
| 1 | JOIN + GROUP BY | Total de visualizações por filme |
| 2 | JOIN + GROUP BY + HAVING | Filmes com mais de 1 visualização |
| 3 | JOIN + Subselect | Filmes acima da média de visualizações |

---

## 📈 Dashboards

Gerados via Python (matplotlib) diretamente na instância EC2:

- **Gráfico de barras** — Visualizações por filme
- **Gráfico de pizza** — Distribuição percentual de visualizações

---

## ✅ Checklist de Requisitos

| Requisito | Disciplina | Status |
|---|---|---|
| Instância EC2 com banco de dados (MariaDB) | Nuvem | ✅ |
| SHOW CREATE TABLE filmes | Nuvem + BD | ✅ |
| SHOW CREATE TABLE visualizacoes | Nuvem + BD | ✅ |
| INSERT de dados (filmes, usuarios, visualizacoes) | Nuvem + BD | ✅ |
| SELECT JOIN com 2 tabelas + GROUP BY | Nuvem + BD | ✅ |
| SELECT JOIN + GROUP BY + HAVING | Nuvem + BD | ✅ |
| SELECT com subselect | Nuvem + BD | ✅ |
| Dashboard Python — gráfico de barras | Tópicos BD | ✅ |
| Dashboard Python — gráfico de pizza | Tópicos BD | ✅ |
| Tabelas originais (não de aula) | Ambas | ✅ |
| Dashboards das próprias tabelas (não do AWS) | Ambas | ✅ |

---

## 🚀 Como Reproduzir

### 1. Pré-requisitos
- Conta AWS Academy ativa
- Par de chaves `.pem` configurado
- Python 3 com `matplotlib` e `mysql-connector-python`

### 2. Conectar na EC2
```bash
ssh -i ~/Downloads/biblioteca-key.pem ec2-user@<IP_PUBLICO>
```

### 3. Acessar o MariaDB
```bash
sudo mysql
```
```sql
USE streaming;
```

### 4. Executar os scripts SQL
```bash
# Na EC2, via MySQL CLI:
source /home/ec2-user/sql/01_create_tables.sql
source /home/ec2-user/sql/02_insert_data.sql
source /home/ec2-user/sql/03_queries.sql
```

### 5. Gerar os dashboards
```bash
python3 dashboard/dashboard.py
```

---

## 👤 Integrantes

| Nome | RA |
|---|---|
| Guilherme Shinohara | 10439165 |

---

*Universidade Presbiteriana Mackenzie — Sistemas de Informação — 2026.01*
