import os
import pandas as pd 
import snowflake.connector
import sys
##os.system("dbt run")

ctx = snowflake.connector.connect(
    user='u698108',
    password='shan1993tanuV!',
    account='pi60078.ap-south-1.aws',
    warehouse='COMPUTE_WH',
    database='pract',
    schema='TEST',
    ROLE='ACCOUNTADMIN'
    )
##cur = ctx.cursor()
##query = 'SELECT * FROM PRACT.TEST.PROCESS_AUDIT'
##cur.execute(query)
##data = pd.DataFrame.from_records(iter(cur), columns=[x[0] for x in cur.description])
##print (data["ID"])
##cur.close()

##items = ["one", "two", "three"]
it= range(0,5)
for item in it:
    with open("models/{}_model.sql".format(item), "w") as f:
        f.write("{{ config(materialized='ephemeral')}}")
        f.write("{{ samplemacro(%d) }}"%(item))
        f.close()
os.system("dbt run")