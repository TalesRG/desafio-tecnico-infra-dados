# README — Subindo o Apache Airflow com Docker Compose

Este guia explica, de forma direta, como iniciar um ambiente **Apache Airflow** via **Docker Compose** a partir da pasta do projeto.

## ✅ Pré-requisitos

- **Docker** instalado e em execução
- **Docker Compose** (já vem no Docker Desktop; no Linux, `docker compose` CLI)
- Porta **8080** livre na sua máquina

---

## ▶️ Passo a passo (modo rápido)

1) Entre na pasta do projeto:

```bash
cd airflow
```

2) Faça a inicialização do Airflow (cria metadados, usuário admin etc.):

```bash
docker compose up airflow-init
```

3) Inicie todos os serviços:

```bash
docker compose up
```

4) Acesse a interface web do Airflow:

- **URL:** http://localhost:8080/

---

## 🔐 Credenciais padrão (se o compose as criar)

- **Usuário:** `airflow`
- **Senha:** `airflow`

> Se não existir usuário, você pode criar via CLI dentro do webserver:
> ```bash
> docker compose exec airflow-webserver airflow users create >   --username airflow --password airflow >   --firstname Admin --lastname User >   --role Admin --email admin@example.com
> ```

---

## 📂 Estrutura esperada (exemplo)

```
airflow/
├─ docker-compose.yml
├─ .env                 # (opcional) contém AIRFLOW_UID
├─ dags/                # suas DAGs
├─ logs/                # logs gerados
└─ plugins/             # plugins opcionais
```

---

## 🧰 Comandos úteis

Parar os serviços (Ctrl+C fecha os logs, mas os contêineres continuam em background se você iniciou com `-d`):

```bash
docker compose down
```

Subir em modo “detached” (background):

```bash
docker compose up -d
```

Ver logs do webserver:

```bash
docker compose logs -f airflow-webserver
```

Recriar tudo do zero (cuidado: apaga volumes):

```bash
docker compose down -v
docker compose up airflow-init
docker compose up
```

---

## ✅ Pronto!

Com isso, seu Airflow deve estar acessível em **http://localhost:8080/** e pronto para rodar suas DAGs.
