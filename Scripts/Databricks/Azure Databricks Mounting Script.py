# Databricks notebook source
# Last Updated:** Monday, 23rd September 2024 1:10 AM

# Initial Unmounting if existing mount exists
dbutils.fs.unmount("/mnt/olist_data")

# Mount the data to the path specified under configs.
configs = {"fs.azure.account.auth.type": "OAuth",
"fs.azure.account.oauth.provider.type": "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
"fs.azure.account.oauth2.client.id": "insertyourclientidhere",
"fs.azure.account.oauth2.client.secret": 'insertyoursecrethere',
"fs.azure.account.oauth2.client.endpoint": "yourendpointURLhere"}

dbutils.fs.mount(
    source = "abfss://olist-zeta@olistzeta.dfs.core.windows.net", # {container}@{storage_name}
    mount_point = "/mnt/olist_data",
    extra_configs = configs
)

# Show Path Info
dbutils.fs.ls("/mnt/olist_data")

# Show Path of all Files
dbutils.fs.ls("/mnt/olist_data/olist-raw-data/")