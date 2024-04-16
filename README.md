# QARK Docker Environment

## Introduction

This repository contains a Dockerized environment for [QARK](https://github.com/linkedin/qark) (Quick Android Review Kit), a tool used for static analysis of Android applications. QARK is designed to identify security flaws in Android apps and provide information about potential vulnerabilities. Since QARK is built for Python 2, which is not supported in newer environments, this Docker solution enables users to run QARK in a containerized setting without compatibility issues.

The Docker environment encapsulates all necessary dependencies and configurations, making it straightforward to deploy and use QARK regardless of the host system's configuration.

## Usage

### Setting Up the Environment

To use this Docker environment, you must have Docker and Docker Compose installed on your machine. Once installed, you can set up and run the QARK analysis with the following steps:

1. **Prepare the APK File:**
   - Rename your Android APK file to `app.apk`.
   - Place `app.apk` into the `apk` folder located in the root of this repository.

2. **Install Android SDK**
   ```bash
   $ unzip commandlinetools-linux-11076708_latest.zip
   ```
   ```bash
   $ cmdline-tools/bin
   ```
   ```bash
   $ ./sdkmanager --licenses --sdk_root=$(pwd)/cmdline-tools
   ```
   ```bash
   $ ./sdkmanager --install "platforms;android-21" "sources;android-21" "build-tools;21.1.2" --sdk_root=$(pwd)/cmdline-tools
   ```
   ```bash
   $ zip -r cmdline-tools.zip cmdline-tools
   ```


2. **Build the Docker Image:**
   ```bash
   $ docker-compose build
   ```

### Run the Environment

3. **Run QARK:**
   ```bash
   $ docker-compose run qark
   ```

This will execute QARK against the APK file named app.apk that you placed in the apk folder. After the analysis, QARK will output:

* **Exploits**: These will be saved in the exploit folder.
* **Report**: The detailed report will be placed in the report folder.

## Notice

QARK will analyze the application and provide a comprehensive report, along with any exploits, highlighting security vulnerabilities found within the app.

For further customization and advanced usage, please refer to the Docker Compose documentation and the [original QARK GitHub repository](https://github.com/linkedin/qark).

