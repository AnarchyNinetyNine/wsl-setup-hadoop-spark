#!/bin/bash

# Versions
SPARK_VERSION=3.5.5

# Download and install Spark
wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz
tar -xvzf spark-$SPARK_VERSION-bin-hadoop3.tgz
mv spark-$SPARK_VERSION-bin-hadoop3 $SPARK_HOME
rm spark-$SPARK_VERSION-bin-hadoop3.tgz

# Set Spark environment variables
echo 'export SPARK_HOME=$HOME/.spark/' >> ~/.bashrc
echo 'export PATH=$SPARK_HOME/bin:$SPARK_HOME/bin:$PATH' >> ~/.bashrc

# Apply changes
source ~/.bashrc

# Reload systemd and start services
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
