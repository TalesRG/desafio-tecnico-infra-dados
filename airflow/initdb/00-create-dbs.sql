-- Databases
CREATE DATABASE airflow_meta;
CREATE DATABASE superset_meta;
CREATE DATABASE analytics;

-- Roles/usuários
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'airflow_user') THEN
CREATE ROLE airflow_user LOGIN PASSWORD 'airflow_pass';
END IF;
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'superset_user') THEN
CREATE ROLE superset_user LOGIN PASSWORD 'superset_pass';
END IF;
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'analytics_user') THEN
CREATE ROLE analytics_user LOGIN PASSWORD 'analytics_pass';
END IF;
END $$;

ALTER DATABASE airflow_meta   OWNER TO airflow_user;
ALTER DATABASE superset_meta  OWNER TO superset_user;
ALTER DATABASE analytics      OWNER TO analytics_user;

\connect airflow_meta
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO airflow_user;

\connect superset_meta
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO superset_user;

\connect analytics
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO analytics_user;
