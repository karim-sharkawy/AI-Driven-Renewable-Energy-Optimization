Branching Strategy

Keep the branching strategy intentionally simple.

Main Branches
main

Production-ready stable code.

Rules:

Always deployable
Protected branch
Pull requests only
No direct commits

develop

Primary integration branch.

Rules:

Feature branches merge here first
Used for testing combined changes
Periodically merged into main
Long-Lived Feature Branches
feature/rl-core

Core RL development branch.

Contains:

Environments
Agents
Training loops
Evaluation logic
feature/mlops-platform

Infrastructure and MLOps branch.

Contains:

CI/CD
Docker
MLflow
SQL integration
Pipelines
feature/research-lab

Advanced experimentation branch.

Contains:

Hyperparameter optimization
Distributed training
Advanced RL algorithms
Benchmarking