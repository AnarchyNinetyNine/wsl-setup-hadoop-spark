# 🚀 WSL Hadoop + Spark Setup

Welcome to the **WSL Hadoop + Spark Setup** repository! This project provides streamlined, production-ready shell scripts to install and configure **Apache Hadoop** and **Apache Spark** on **Windows Subsystem for Linux (WSL)**. Designed for developers and data engineers, it enables seamless setup of a local distributed data processing environment for testing, development, or learning.

---

## 🎯 Features

- **Automated Installation**: One-click scripts to install and configure Hadoop and Spark.
- **Environment Setup**: Configures **OpenJDK 11**, environment variables, and `JAVA_HOME`.
- **Systemd Integration**: Runs Hadoop HDFS and YARN as systemd services for easy management.
- **Lightweight**: Optimized for WSL, minimizing resource usage.
- **Version Support**: Installs **Hadoop 3.3.6** and **Spark 3.5.5** with compatibility in mind.
- **Extensible**: Easily customizable for advanced configurations.

---

## 📋 Prerequisites

- **WSL 2** installed on a Windows 10/11 system.
- A Linux distribution (e.g., Ubuntu 20.04 or later) configured in WSL.
- Internet connection for downloading dependencies.
- Basic familiarity with Linux command-line operations.

---

## 📦 What's Included

- **`setup_essentials.sh`**: Installs **OpenJDK 11**, configures `JAVA_HOME`, and updates environment variables in `~/.bashrc`.
- **`install_hadoop_spark.sh`**: Downloads, extracts, and configures **Hadoop 3.3.6** and **Spark 3.5.5**, including systemd service setup for Hadoop HDFS and YARN.

---

## 🛠️ Installation Guide

Follow these steps to set up your Hadoop and Spark environment on WSL.

### 1. Clone the Repository

```bash
git clone https://github.com/AnarchyNinetyNine/wsl-setup-hadoop-spark.git
cd wsl-setup-hadoop-spark
```

### 2. Install Java

If Java is not already installed, run:

```bash
chmod +x setup_essentials.sh
./setup_essentials.sh
```

This script:
- Installs **OpenJDK 11**.
- Sets `JAVA_HOME` and updates `~/.bashrc` with required environment variables.

### 3. Install Hadoop and Spark

```bash
chmod +x install_hadoop_spark.sh
./install_hadoop_spark.sh
```

This script:
- Downloads **Hadoop 3.3.6** and **Spark 3.5.5**.
- Extracts and moves them to hidden directories in your home folder (`~/.hadoop` and `~/.spark`).
- Configures environment variables in `~/.bashrc`.
- Sets up systemd services for Hadoop HDFS and YARN.

### 4. Verify Installation

Confirm that Hadoop and Spark are installed correctly:

```bash
hadoop version
spark-shell --version
```

Expected output:
- Hadoop: `Hadoop 3.3.6`
- Spark: `Spark 3.5.5`

---

## 🏃‍♂️ Managing Hadoop and Spark Services

Hadoop HDFS and YARN are configured as systemd services for easy management.

### 1. Start Services

To start Hadoop HDFS and YARN:

```bash
sudo systemctl start hadoop-hdfs
sudo systemctl start hadoop-yarn
```

### 2. Enable Services on Boot

To ensure services start automatically on system boot:

```bash
sudo systemctl enable hadoop-hdfs
sudo systemctl enable hadoop-yarn
```

### 3. Check Service Status

Verify that services are running:

```bash
sudo systemctl status hadoop-hdfs
sudo systemctl status hadoop-yarn
```

### 4. Stop Services (Optional)

To stop the services:

```bash
sudo systemctl stop hadoop-hdfs
sudo systemctl stop hadoop-yarn
```

---

## 🔍 Troubleshooting

- **Java not found**: Ensure `JAVA_HOME` is set correctly in `~/.bashrc`. Run `source ~/.bashrc` after running `setup_essentials.sh`.
- **Hadoop/Spark command not found**: Verify that `~/.bashrc` includes the correct paths for Hadoop and Spark binaries.
- **Systemd issues**: Ensure you have sufficient permissions (`sudo`) and that WSL supports systemd (enable it in `/etc/wsl.conf` if needed).
- **Port conflicts**: Check for port conflicts on default Hadoop ports (e.g., 9000, 9870) using `netstat -tuln`.

For additional help, refer to the [Apache Hadoop documentation](https://hadoop.apache.org/docs/stable/) or [Apache Spark documentation](https://spark.apache.org/docs/latest/).

---

## 🛠️ Customizing the Setup

- **Hadoop Configuration**: Modify Hadoop settings in `~/.hadoop/etc/hadoop/` (e.g., `core-site.xml`, `hdfs-site.xml`).
- **Spark Configuration**: Adjust Spark settings in `~/.spark/conf/` (e.g., `spark-defaults.conf`).
- **Scaling**: Extend the setup for multi-node clusters by updating configurations and replicating the setup on additional WSL instances.

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m "Add YourFeature"`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

Please ensure your code follows the repository's coding standards and includes appropriate documentation.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Acknowledgments

- [Apache Hadoop](https://hadoop.apache.org/) and [Apache Spark](https://spark.apache.org/) communities for their incredible tools.
- The WSL team for enabling Linux environments on Windows.

---

## 📬 Contact

For questions, suggestions, or issues, please open an issue on the [GitHub repository](https://github.com/AnarchyNinetyNine/wsl-setup-hadoop-spark/issues) or contact the maintainer at [your-email@example.com].

Happy data processing! 🚀
