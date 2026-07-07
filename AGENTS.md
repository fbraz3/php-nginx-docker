# AI Agent Instructions for this Project (php-nginx-docker)

This document defines guidelines, behavioral rules, and detailed technical standards for AI assistants (agents) operating within the **php-nginx-docker** project. Follow these instructions strictly to ensure consistency, quality, and predictability in all interactions.

## 1. Project Overview and Philosophy
The **php-nginx-docker** project provides optimized Docker images to run PHP applications with the Nginx web server. 
It is based on `php-fpm-docker` and `php-base-docker`, supporting multiple PHP versions and architectures (`amd64`, `arm64`).
The core philosophy is modularity and reusability.

## 2. General Agent Directives
- **Understand Before Acting**: Before changing configurations (Dockerfiles, entrypoints, shell scripts), deeply read and understand the current file and how it integrates with other flavors.
- **Idempotency**: All scripts and Docker commands must be idempotent.
- **Fail-Fast**: Shell scripts (`.sh`) must include `set -e` (and ideally `set -euo pipefail`) to fail immediately on errors. 
- **Agent Persona**: Remember the initial directive: "I'm Mr. Meeseeks! Look at me!" and follow the global rules defined by the user.

## 3. Architecture and Directory Structure
- `/flavors`: Contains subdirectories for different environments/tools (vanilla, phalcon). Each flavor must be self-contained.
- `/src`: Contains source code and configuration files used across different flavors or for base image generation.
- `/scripts`: Accessory scripts for CI/CD, building, or publishing images.
- `/assets`: Contains startup scripts, configs, and other shared assets to be copied into the containers.

## 4. Docker and Container Best Practices
### 4.1. Dockerfiles
- **Base Images**: Ensure we use official base images when building our images, keeping architecture support in mind.
- **Layer Optimization**: Combine `RUN` commands where logical to reduce image layers. 
- **Package Management**:
  - Use the `--no-install-recommends` flag with `apt-get install` to minimize bloat.
  - ALWAYS clear the apt cache in the same layer: `rm -rf /var/lib/apt/lists/*`.
- **Permissions**: By default, containers should be designed to run as the `php` user (uid 1000). Avoid running services as `root` unless strictly necessary.
- **Nginx Configuration**: Ensure Nginx is configured correctly to serve PHP applications via PHP-FPM.

## 5. Scripting and Automation
- **Entrypoints**: Keep entrypoint scripts clean and ensure they handle arguments properly (using `"$@"`).
- **Environment Variables**: Document and use environment variables for configurable settings.
- **Permissions Workarounds**: Ensure documentation and scripts account for volume permission issues gracefully.

## 6. Testing and Validation
- **Build Checks**: Any new flavor or PHP version bump must pass GitHub Actions workflows (e.g., `base-images.yml`, `phalcon-images.yml`).
- **Functionality Tests**: Ensure new tools are properly installed and executable within the container.

## 7. Communication, Workflow, and Documentation
- **Planning**: Architectural changes require user validation and a clear plan. Do not execute destructive changes without approval.
- **Documentation**: Non-trivial changes must be summarized clearly. Update the `README.md` if adding new flavors or environment variables.
- **Language**: Comments in code, Dockerfiles, and compose files must be in English to maintain project consistency.
