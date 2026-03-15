from airflow.sdk import dag, task
from datetime import datetime

DBT_PROJECT = "/opt/airflow/dbt_project"

@dag(
    dag_id="aws_dbt_snowflake_project",
    start_date=datetime(2026,3,14),
    schedule="@daily",
    catchup=False,
    tags=["dbt","snowflake","airbnb"]
)

def airbnb_dbt_pipeline():

    @task.bash
    def dbt_bronze():
        return f"cd {DBT_PROJECT} && dbt run --select bronze --profiles-dir ."

    @task.bash
    def dbt_silver():
        return f"cd {DBT_PROJECT} && dbt run --select silver --profiles-dir ."

    @task.bash
    def dbt_snapshot():
        return f"cd {DBT_PROJECT} && dbt snapshot --profiles-dir ."

    @task.bash
    def dbt_gold():
        return f"cd {DBT_PROJECT} && dbt run --select gold --profiles-dir ."

    @task.bash
    def dbt_test():
        return f"cd {DBT_PROJECT} && dbt test --profiles-dir ."

    bronze = dbt_bronze()
    silver = dbt_silver()
    snapshot = dbt_snapshot()
    gold = dbt_gold()
    test = dbt_test()

    bronze >> silver >> snapshot >> gold >> test


airbnb_dbt_pipeline()