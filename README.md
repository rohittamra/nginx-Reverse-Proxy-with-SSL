# Linux Tweet App Deployment with NGINX and Let's Encrypt

## Objective
Deploy a simple web application (`linux_tweet_app`) in a Docker container on Azure, configure NGINX as a reverse proxy, and use the Let’s Encrypt agent to generate SSL/TLS certificates for your domain.

---

## Acrichtectural diagram
<img width="7000" height="1380" alt="image" src="https://github.com/user-attachments/assets/e21dae77-6341-4777-ab87-fb2968c2aac5" />

## Prerequisites

### GitHub Secrets
Add the following secrets in your repository settings (`Settings → Secrets → Actions`):

| Secret Name             | Description |
|-------------------------|-------------|
| `AZURE_SUBSCRIPTION_ID` | Your Azure subscription ID. |
| `AZURE_CREDENTIALS`     | JSON output from creating an Azure service principal:  
```bash
az ad sp create-for-rbac --name "linux-tweet-terraform" \
    --role="Contributor" \
    --scopes="/subscriptions/<subscription id>" \
    --sdk-auth
``` |
| `AZURE_SSH_PASS`        | A password for the VM (or later create SSH key-based access). |
| `DOCKER_HUB_PASSWORD`   | Password for your Docker Hub account. |

---

## How to Run
1. Clone the repository:

```bash
git clone <repo-url>
cd <repo-name>

