# Infraestrutura em Nuvem — AWS Academy

## Instância EC2

| Atributo | Valor |
|---|---|
| Instance ID | i-06b9cc0a1c277a92d |
| Nome | biblioteca-server |
| Tipo | t2.micro |
| AMI | Amazon Linux 2023 |
| Estado | Executando |
| IP Público | 13.222.188.141 |
| IP Privado | 172.31.30.53 |
| Par de Chaves | biblioteca-key |
| Região | us-east-1 (Norte da Virgínia) |
| VPC | vpc-0D0908f052fadb899 |
| Sub-rede | subnet-0f11290d56cb46ef0 |

## Banco de Dados

| Atributo | Valor |
|---|---|
| SGBD | MariaDB 10.5.29 |
| Instalação | Direto na instância EC2 |
| Database | streaming |
| Charset | latin1 / latin1_swedish_ci |
| Engine | InnoDB |

## Acesso SSH

```bash
ssh -i ~/Downloads/biblioteca-key.pem ec2-user@13.222.188.141
```

## Iniciar MariaDB

```bash
sudo mysql
```

## Verificar tabelas

```sql
USE streaming;
SHOW TABLES;
SHOW CREATE TABLE filmes;
SHOW CREATE TABLE visualizacoes;
```

## Diagrama ER (simplificado)

```
filmes                    visualizacoes               usuarios
+-------------+           +--------------------+      +-------------+
| id_filme PK |<----------| id_visualizacao PK |      | id_usuario  |
| titulo      |           | id_filme FK        |      | nome        |
| categoria   |           | id_usuario FK      |----->| email       |
| duracao_min |           | tempo_assistido    |      +-------------+
+-------------+           | data_visualizacao  |
                          +--------------------+
```
