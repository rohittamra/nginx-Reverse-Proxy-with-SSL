# Linux Tweet App Deployment with NGINX and Let's Encrypt

## Objective
Deploy a simple web application (`linux_tweet_app`) in a Docker container on Azure, configure NGINX as a reverse proxy, and use the Let’s Encrypt agent to generate SSL/TLS certificates for your domain.

---

## Acrichtectural diagram
<img width="1730" height="325" alt="image" src="https://github.com/user-attachments/assets/e8bfe7ec-c139-4d1d-a6f5-b88a957c3ac8" />

## Prerequisites

### GitHub Secrets
Add the following secrets in your repository settings (`Settings → Secrets → Actions`):

| Secret Name             | Description |
|-------------------------|-------------|
| `AZURE_SUBSCRIPTION_ID` | Your Azure subscription ID. |
| `AZURE_CREDENTIALS`     | JSON output from creating an Azure service principal:  
| `AZURE_SSH_PASS`        | A password for the VM (or later create SSH key-based access). |
| `DOCKER_HUB_PASSWORD`   | Password for your Docker Hub account. |

---

## How to Run
1. Clone the repository:

```
bash
git clone <repo-url>
cd <repo-name>
```

2. Run the actions manually which will creeate below workflow

## Workflow:


1. **Terraform Provisioning**
   - Creates Azure infrastructure:
     - **Resource Group**
     - **Virtual Network (VNet)**
     - **Subnet**
     - **Network Interface (NIC)**
     - **Network Security Group (NSG)**
     - **Public IP**
     - **Linux VM**

2. **Docker Build & Push**
   - Dockerfile in the `application` folder builds the `linux_tweet_app` image.
   - Pushes the image to Docker Hub.

3. **Ansible Deployment**
   - Runs on the Azure VM.
   - Installs required packages:
     - Docker & Docker Compose
     - NGINX
     - Certbot (Let's Encrypt)
   - Copies `linux_tweet_app` deployment files.
   - Configures **NGINX** to:
     - Listen on **HTTP (80)** and **HTTPS (443)**.
     - Redirect HTTP → HTTPS.
   - Uses **Certbot** to generate SSL/TLS certificates for the domain.
   - Starts the application with Docker Compose.

4. **Domain & SSL**
   - The domain (e.g., here used in this example - `rohittamra.pro`) is configured in NGINX.
   - Certbot automatically obtains and deploys SSL/TLS certificates.
   - Future renewals handled by Certbot.

## Tools Used

### Terraform
- Creates the **Azure infrastructure**:
  - Linux VM
  - Virtual Network and Subnet
  - Public IP
  - Network Security Group (NSG)

### Ansible
- **Configures the VM**:
  - Installs Docker, Docker Compose, and NGINX
  - Copies the web application
  - Configures NGINX as a reverse proxy
  - Generates SSL/TLS certificates via Let’s Encrypt

### GitHub Actions
- **Automates deployment**:
  - Runs Terraform to provision Azure resources
  - Runs Ansible to configure the VM
  - Triggered automatically on `push` to the `main` branch

### Dockerfiles
- Defines the **application container** (`linux_tweet_app`)  
- Builds a reproducible environment for the app

### Docker Compose
- **Orchestrates containers**:
  - Runs the web application container
  - Ensures proper networking between NGINX and the app

### Certbot / Let’s Encrypt
- Provides **free SSL/TLS certificates** for the domain
- Ensures all HTTP requests are **redirected to HTTPS**
- Automatically renews certificates
