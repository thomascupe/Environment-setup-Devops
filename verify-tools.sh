#!/usr/bin/env bash
# DevOps tooling verification report generator
# Run from Ubuntu/WSL2: bash verify-tools.sh

set +e
OUT="${1:-tooling-verification-report.txt}"

{
  echo "DevOps Tooling Verification Report"
  echo "Generated: $(date -Is 2>/dev/null || date)"
  echo "Host: $(hostname)"
  echo "OS:"
  cat /etc/os-release 2>/dev/null | grep -E '^(PRETTY_NAME|VERSION_ID)='
  echo
  echo "System resources:"
  free -h 2>/dev/null
  df -h / 2>/dev/null
  echo
  echo "Tool versions:"
  for cmd in git code docker minikube kubectl helm aws az node npm jq terraform ansible; do
    echo
    echo ">>> $cmd"
    if ! command -v "$cmd" >/dev/null 2>&1; then
      echo "NOT FOUND"
      continue
    fi
    case "$cmd" in
      git) git --version ;;
      code) code --version 2>&1 | head -n 2 ;;
      docker) docker --version; docker compose version ;;
      minikube) minikube version ;;
      kubectl) kubectl version --client 2>&1 ;;
      helm) helm version --short ;;
      aws) aws --version ;;
      az) az version 2>&1 | head -n 8 ;;
      node) node --version; npm --version ;;
      npm) npm --version ;;
      jq) jq --version ;;
      terraform) terraform --version | head -n 2 ;;
      ansible) ansible --version | head -n 2 ;;
    esac
  done
  echo
  echo "Git configuration:"
  git config --global --get user.name 2>/dev/null || echo "Git user.name not configured"
  git config --global --get user.email 2>/dev/null || echo "Git user.email not configured"
  echo
  echo "Docker status:"
  docker info --format 'Docker server: {{.ServerVersion}}' 2>&1
  echo
  echo "Minikube status:"
  minikube status 2>&1
  echo
  echo "Kubernetes nodes:"
  kubectl get nodes -o wide 2>&1
  echo
  echo "Kubernetes system pods:"
  kubectl get pods -A 2>&1
} > "$OUT"

echo "Report saved to: $OUT"
echo "Review the report for NOT FOUND or connection errors before submitting."
