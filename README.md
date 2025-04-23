# 🚀 WSL Hadoop + Spark Setup

This repository provides easy-to-use shell scripts to install and configure **Apache Hadoop** and **Apache Spark** on **WSL (Windows Subsystem for Linux)**. It includes everything you need to get started with distributed data processing locally.

---

## 📦 What's Included

- `setup_essentials.sh`: Installs **OpenJDK 11** and sets `JAVA_HOME`.
- `install_hadoop_spark.sh`: Downloads, extracts, and configures **Hadoop 3.3.6** and **Spark 3.5.5**.

---

## 🛠️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/AnarchyNinetyNine/wsl-setup-hadoop-spark.git
cd wsl-setup-hadoop-spark
```

### 2. Run the Java Installer

If you don’t already have Java installed, run:

```bash
./setup_essentials.sh
```
This installs OpenJDK 11 and updates your ~/.bashrc with the required environment variables.

### 3. Install Hadoop and Spark

```bash
./install_hadoop_spark.sh
```

This will:

- Download Hadoop and Spark
- Extract and move them to hidden folders in your home directory
- Append environment variables to your ~/.bashrc

### 5. Verify Installation

```bash
hadoop version
spark-shell --version
```

