# Dockerized ServiceNow-CLI

## Introduction

This repository aims to provide a minimal and reproducible development environment for building custom Next Experience components for ServiceNow. This Docker setup ensures that all dependencies are managed within the container, eliminating the need for manual installations on the host system.

## Why

- **Node / NPM Compatibility:** Newer versions of Node and NPM may fail to install the ServiceNow CLI.
- **Security / Host integrity:** Running "*.run"-installers directly on the host seemed sus.

## How to Install

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/grafdigital/servicenow_cli_docker.git
   cd servicenow_cli_docker
   ```

2. **Download ServiceNow CLI:**
   - Visit the [ServiceNow Store](https://store.servicenow.com/store/app/ee71f36a1ba46a50a85b16db234bcbd4) and download the ServiceNow CLI binary.
   - Copy the ZIP file next to the Dockerfile and rename it to `sncli.zip`.

3. **Build the Docker Image:**
   ```bash
   docker-compose build
   ```

4. **Run the Docker Container:**
   ```bash
   docker-compose run --rm dev
   ```

5. **Inside the Docker Container:**
   - Enter a password to protect your stored credentials:
     ```bash
     Unlock keyring:
     ```
   - Configure the ServiceNow CLI profile:
     ```bash
     snc configure profile set
     ```
     **Note:** The `ui-component` extension only supports Basic-Auth.
   - Verify the installation:
     ```bash
     snc ui-component --help
     ```

## How to Use

1. **Run the Docker Container:**
   ```bash
   docker-compose run -p127.0.0.1:8081:8081 --rm dev
   ```

2. **Start Building:**
   - Refer to the [ServiceNow documentation](https://www.servicenow.com/docs/bundle/yokohama-application-development/page/build/components/concept/custom-components.html) for instructions on how to create custom UI components.
   - If you want to edit files directly inside the Docker container, you can use the `screen` terminal multiplexer and `vim` editor.
   - Alternatively, you can use any IDE you prefer just use the `~/data` folder which is mounted on the host.

2. **Locally test your compoment:**
   ```bash
   snc ui-component --host 0.0.0.0
   ```
   You can open a webbrowser on your host system and access the component preview via http://127.0.0.1:8081

## Caveats

- The installation scripts automatically accept the Terms of Service of the ServiceNow CLI. By building the container, you agree to these terms. **Please review them before proceeding**.
- The Node.js version used in this setup is outdated. Consider updating it if required.
- The container will locally store credentials for what is probably an admin account to a ServiceNow instance. Make sure to keep these credentials safe and at the minimum use a secure passphrase for container keyring.
- If you encounter this error message:
  ```
  Error retrieving credentials
  ```
  You've probably entered the wrong keyring password and you need to restart the Docker container to resolve the issue.


## Disclaimer

This is not an official ServiceNow product.
It is provided as-is without any warranty.

## License

This project is licensed under the [AGPL](https://www.gnu.org/licenses/agpl-3.0.en.html).
