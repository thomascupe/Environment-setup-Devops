# DevOps Environment Setup

## Environment
- Host OS: Windows with WSL2 and Ubuntu
- Package manager: APT (`apt` / `apt-get`); Snap may be used for Helm if available
- Container runtime: Docker Desktop with WSL integration
- Local Kubernetes: Minikube using the Docker driver
- Workspace: `~/devops-setup`

## Tools to install and verify
Git, Visual Studio Code with the WSL extension, Docker, Docker Compose, Minikube,
kubectl, Helm, AWS CLI, Azure CLI, Node.js/npm, jq, Terraform, and Ansible.
AI-assisted tools are optional.

## Setup procedure
1. Verify WSL2 is enabled and Ubuntu is using WSL version 2.
2. Update Ubuntu with `sudo apt update && sudo apt upgrade -y`.
3. Install Git and configure `user.name` and `user.email`.
4. Install VS Code on Windows and enable its WSL extension.
5. Install Docker Desktop on Windows and enable WSL integration for Ubuntu.
6. Install Minikube, kubectl, and Helm; start the cluster with
   `minikube start --driver=docker`.
7. Install AWS CLI, Azure CLI, Node.js/npm, jq, Terraform, and Ansible.
8. Run `bash verify-tools.sh` to create `tooling-verification-report.txt`.
9. Run `minikube status` and `kubectl get nodes` and capture a screenshot
   showing the node in `Ready` state.

## Verification commands
```bash
git --version
docker --version
docker compose version
minikube version
kubectl version --client
helm version
aws --version
az --version
node --version
npm --version
jq --version
terraform --version
ansible --version
minikube status
kubectl get nodes
```

## Troubleshooting notes
- If Ubuntu is not running, use PowerShell: `wsl --status`, `wsl --list --verbose`,
  and `wsl --update`. Confirm Ubuntu is version 2.
- If `code .` fails, install the VS Code WSL extension and reopen the Ubuntu terminal.
- If Docker commands fail, start Docker Desktop and enable WSL integration for Ubuntu.
- If Minikube cannot start, check `docker info`, then try `minikube delete` followed
  by `minikube start --driver=docker` (deleting a cluster removes its local cluster data).
- If a command is not found after installation, reopen the terminal or run
  `hash -r`, then check the tool's official installation instructions.
- On an 8 GB RAM system, run one local Kubernetes node and avoid starting unnecessary
  containers simultaneously.

## Security
- Never commit cloud credentials, access tokens, private SSH keys, `.env` secrets,
  or kubeconfig credentials to Git.
- Use least-privilege permissions. Do not run untrusted scripts as root.
- Review all generated verification output before sharing it; redact usernames,
  hostnames, internal paths, account identifiers, and any sensitive information.

## Submission checklist
- [ ] Environment configuration file (`.bashrc` snippet or `devcontainer.json`)
- [ ] `tooling-verification-report.txt` generated on your machine
- [ ] Screenshot showing `minikube status` and `kubectl get nodes` with node `Ready`
- [ ] Completed README with actual installation outcomes and troubleshooting steps

> Update this README with the versions actually installed and the problems you
> personally encountered. Do not claim a tool is installed unless verification passes.
> ## Git and Visual Studio Code Verification

### Git
- Verified using `git --version`.
- Configured Git username and email.
- Initialized the `devops-setup` Git repository and checked its status.
- Evidence: `evidence/git-verification.png`

### Visual Studio Code
- Installed Visual Studio Code on Windows.
- Enabled the WSL extension for Ubuntu integration.
- Opened the `devops-setup` project using `code .`.
- Verified Git integration in the integrated terminal.
- Evidence: `evidence/vscode-verification.png`

Screenshots were captured from the local development environment after verification.
## Git Version Control and Commit History

The project is maintained in a local Git repository.

### Version Control Verification
- Repository initialized using `git init`.
- Git username and email configured.
- Project files staged and committed.
- Commit history verified using `git log --oneline --graph --decorate --all`.

### Commit History
The repository contains commits documenting the initial DevOps environment setup, installation documentation, and verification evidence.


