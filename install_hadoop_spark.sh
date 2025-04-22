#!/bin/bash

# Versions
HADOOP_VERSION=3.3.6
SPARK_VERSION=3.5.5
HADOOP_HOME=$HOME/.hadoop
SPARK_HOME=$HOME/.spark

# Download and install Hadoop
wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
tar -xvzf hadoop-$HADOOP_VERSION.tar.gz
mv hadoop-$HADOOP_VERSION $HADOOP_HOME
rm hadoop-$HADOOP_VERSION.tar.gz

# Set Hadoop environment variables
echo 'export HADOOP_HOME=$HOME/hadoop' >> ~/.bashrc
echo 'export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH' >> ~/.bashrc

# Download and install Spark
wget https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz
tar -xvzf spark-$SPARK_VERSION-bin-hadoop3.tgz
mv spark-$SPARK_VERSION-bin-hadoop3 $SPARK_HOME
rm spark-$SPARK_VERSION-bin-hadoop3.tgz

# Set Spark environment variables
echo 'export SPARK_HOME=$HOME/spark' >> ~/.bashrc
echo 'export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH' >> ~/.bashrc
echo 'export PYSPARK_PYTHON=python3' >> ~/.bashrc

# Apply changes
source ~/.bashrc
