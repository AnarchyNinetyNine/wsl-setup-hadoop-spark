#!/bin/bash

# Versions
HADOOP_VERSION=3.3.6
SPARK_VERSION=3.5.5
HADOOP_HOME=$HOME/.hadoop
SPARK_HOME=$HOME/.spark

# Download and install Hadoop
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6-src.tar.gz
tar -xvzf hadoop-$HADOOP_VERSION.tar.gz
mv hadoop-$HADOOP_VERSION $HADOOP_HOME
rm hadoop-$HADOOP_VERSION.tar.gz

# Set Hadoop environment variables
echo 'export HADOOP_HOME=$HOME/hadoop' >> ~/.bashrc
echo 'export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH' >> ~/.bashrc

# Download and install Spark
wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz
tar -xvzf spark-$SPARK_VERSION-bin-hadoop3.tgz
mv spark-$SPARK_VERSION-bin-hadoop3 $SPARK_HOME
rm spark-$SPARK_VERSION-bin-hadoop3.tgz

# Set Spark environment variables
echo 'export SPARK_HOME=$SPARK_HOME/spark-3.5.5-bin-hadoop3/' >> ~/.bashrc
echo 'export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH' >> ~/.bashrc
echo 'export PYSPARK_PYTHON=python3' >> ~/.bashrc

# Apply changes
source ~/.bashrc

# Create systemd service for HDFS
sudo tee /etc/systemd/system/hadoop-hdfs.service > /dev/null <<EOF
[Unit]
Description=Hadoop HDFS Service
After=network.target

[Service]
Type=oneshot
ExecStart=$HADOOP_HOME/sbin/start-dfs.sh
ExecStop=$HADOOP_HOME/sbin/stop-dfs.sh
RemainAfterExit=true
User=$USER

[Install]
WantedBy=multi-user.target
EOF

# Create systemd service for YARN
sudo tee /etc/systemd/system/hadoop-yarn.service > /dev/null <<EOF
[Unit]
Description=Hadoop YARN Service
After=network.target hadoop-hdfs.service

[Service]
Type=forking
ExecStart=$HADOOP_HOME/sbin/start-yarn.sh
ExecStop=$HADOOP_HOME/sbin/stop-yarn.sh
User=$USER

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start services
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
