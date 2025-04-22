#!/bin/bash

# Run a quick update
sudo apt update -y

# Java (required for Hadoop and Spark)
sudo apt install openjdk-11-jdk -y

# Set JAVA_HOME
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc

# Apply changes
source ~/.bashrc
