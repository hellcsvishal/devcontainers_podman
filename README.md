# Podman-based Dev Environment (AMD ROCm)

## What this is
- Long-running Podman containers
- Host-based editing (Neovim)
- Container-based runtime & dependencies
- AMD GPU (ROCm) support
- Same container for multiple repos

## Containers
- devenv   → generic dev
- pytorch  → PyTorch + ROCm
- llvm     → LLVM / compiler work

## Mounted directories
- ~/personal/github → /workspace/github
- ~/work/contrib    → /workspace/contrib

## Usage

Build images:
```bash
podman build -f images/Containerfile.devenv -t dev-devenv .
podman build -f images/Containerfile.pytorch -t dev-pytorch .
podman build -f images/Containerfile.llvm -t dev-llvm .

