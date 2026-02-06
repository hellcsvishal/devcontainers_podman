# Podman-based Dev Environment (AMD ROCm)

## What this is
- Long-running Podman containers
- Container-based runtime & dependencies
- AMD GPU (ROCm) support

## Containers
- devenv   → generic dev
- pytorch  → PyTorch + ROCm
- llvm     → LLVM / compiler work

## Mounted directories
- "$HOME/personal/github" → "container:$HOME/personal/github"
- "$HOME/work/contrib" → "container:$HOME/work/contrib"
- "$HOME/work/project" → "container:$HOME/work/project"

## Usage

Build images:
```bash
podman build -f images/Containerfile.devenv -t dev-devenv .
podman build -f images/Containerfile.pytorch -t dev-pytorch .
podman build -f images/Containerfile.llvm -t dev-llvm .
```

> NOTE: We only install the things that are necessary like vim, zsh, oh-my-zsh, git, curl, wget, tmux, and wheel.
> Everything else can be installed using [trench](https://github.com/PyDevC/trench)
