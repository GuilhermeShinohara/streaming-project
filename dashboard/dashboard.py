"""
Sistema de Streaming — Dashboard
Universidade Presbiteriana Mackenzie — 2026.01
Disciplina: Tópicos em Banco de Dados
Professor: Jamilson Bispo dos Santos

Gera gráficos de barras e pizza com base nos dados
do banco MariaDB hospedado na instância EC2.
"""

import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')  # modo sem interface gráfica (EC2 sem display)

# ----------------------------------------------------------------
# Dados extraídos do banco streaming (visualizacoes JOIN filmes)
# ----------------------------------------------------------------
filmes = ['Interestelar', 'Titanic', 'Toy Story', 'Vingadores']
visualizacoes = [2, 1, 1, 1]

# ----------------------------------------------------------------
# Gráfico de Barras — Visualizações por Filme
# ----------------------------------------------------------------
fig, ax = plt.subplots(figsize=(8, 5))

ax.bar(filmes, visualizacoes, color='steelblue', edgecolor='white')
ax.set_title('Visualizações por Filme', fontsize=14, fontweight='bold')
ax.set_xlabel('Filme')
ax.set_ylabel('Quantidade')
ax.set_ylim(0, max(visualizacoes) + 0.5)
ax.yaxis.set_major_locator(plt.MaxNLocator(integer=True))

plt.tight_layout()
plt.savefig('grafico_barras.png', dpi=150)
plt.close()
print("✅ grafico_barras.png gerado com sucesso.")

# ----------------------------------------------------------------
# Gráfico de Pizza — Distribuição de Visualizações
# ----------------------------------------------------------------
cores = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728']

fig, ax = plt.subplots(figsize=(7, 7))

wedges, texts, autotexts = ax.pie(
    visualizacoes,
    labels=filmes,
    autopct='%1.1f%%',
    colors=cores,
    startangle=90
)

ax.set_title('Distribuição de Visualizações', fontsize=14, fontweight='bold')

plt.tight_layout()
plt.savefig('grafico_pizza.png', dpi=150)
plt.close()
print("✅ grafico_pizza.png gerado com sucesso.")

# ----------------------------------------------------------------
# Opcional: conectar diretamente ao MariaDB para dados dinâmicos
# Descomente e configure as credenciais se necessário
# ----------------------------------------------------------------
# import mysql.connector
#
# conn = mysql.connector.connect(
#     host='localhost',
#     user='root',
#     password='',
#     database='streaming'
# )
# cursor = conn.cursor()
# cursor.execute("""
#     SELECT filmes.titulo, COUNT(*) AS total
#     FROM visualizacoes
#     JOIN filmes ON visualizacoes.id_filme = filmes.id_filme
#     GROUP BY filmes.titulo
# """)
# rows = cursor.fetchall()
# filmes = [r[0] for r in rows]
# visualizacoes = [r[1] for r in rows]
# cursor.close()
# conn.close()
