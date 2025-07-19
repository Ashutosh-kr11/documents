# Python Dependency Management Tools: Poetry

---

| Created By      | Created on   | Version | Last updated by   | Pre Reviewer   | L0 Reviewer | L1 Reviewer | L2 Reviewer |
|-----------------|--------------|---------|-------------------|----------------|-------------|-------------|-------------|
| Ashutosh Kumar  | 2025-07-18   | 1.0     | Ashutosh Kumar    |                |             |             |             |

---

## Table of Contents

1. [Overview](#overview)
2. [Why Use Dependency Management in Python?](#why-use-dependency-management-in-python)
3. [Poetry](#poetry)
    - [What is Poetry?](#what-is-poetry)
    - [Key Features of Poetry](#key-features-of-poetry)
    - [Configuration: pyproject.toml](#configuration-pyprojecttoml)
    - [Typical Project Structure](#typical-project-structure)
4. [pip](#pip)
    - [What is pip?](#what-is-pip)
    - [How pip Works](#how-pip-works)
    - [Requirements Files](#requirements-files)
    - [Comparison Table: Poetry vs pip](#comparison-table-poetry-vs-pip)
5. [venv](#venv)
    - [What is venv?](#what-is-venv)
    - [How venv Works and Its Association](#how-venv-works-and-its-association)
6. [Installation and Setup](#installation-and-setup)
    - [Installing Poetry](#installing-poetry)
    - [Verifying Poetry Installation](#verifying-poetry-installation)
7. [Best Practices](#best-practices)
8. [Troubleshooting](#troubleshooting)
9. [FAQ](#faq)
10. [References](#references)
11. [Contact Information](#contact-information)

---

## Overview

Python projects often rely on external libraries and packages. Managing these dependencies, ensuring environment isolation, and supporting reproducible builds are essential for reliable software development. This documentation covers three foundational tools for these tasks: **Poetry**, **pip**, and **venv**.

---

## Why Use Dependency Management in Python?

Dependency management is the practice of specifying, installing, and maintaining the external libraries that a project depends on. It helps to:

- Avoid conflicts between packages required by different projects.
- Reproduce environments across different machines and teams.
- Ensure software stability by locking dependency versions.
- Simplify project setup and onboarding.

---

## Poetry

### What is Poetry?

Poetry is a complete tool for Python project dependency management, packaging, and configuration. It provides a unified command-line interface to manage dependencies, virtual environments, project metadata, and packaging—using the `pyproject.toml` configuration file.

#### Main Capabilities

- Defines dependencies and project metadata in a single place.
- Automatically creates and manages isolated virtual environments.
- Resolves and locks compatible dependency versions for reproducibility.
- Simplifies building and publishing Python packages.
- Separates development and production dependencies clearly.

---

### Key Features of Poetry

- **Unified configuration:** Uses `pyproject.toml` for all settings, including dependencies and metadata.
- **Automatic environment management:** Creates isolated virtual environments per project.
- **Reproducibility:** Generates a lock file (`poetry.lock`) to ensure consistent installs.
- **Integrated packaging:** Build and publish packages directly from the CLI.
- **Separation of concerns:** Distinguishes between development and runtime dependencies.

---

### Configuration: pyproject.toml

`pyproject.toml` is the central configuration file for Poetry-managed projects. It contains the project name, version, description, authors, dependencies, and build instructions.

**Example:**
```toml
[tool.poetry]
name = "sample-project"
version = "0.1.0"
description = "A sample Python project using Poetry"
authors = ["ashutosh ashutosh.kumar.snaatak@mygurukulam.co"]

[tool.poetry.dependencies]
python = "^3.8"
requests = "^2.25.1"

[tool.poetry.dev-dependencies]
pytest = "^6.2"
```

---

### Typical Project Structure

Poetry supports both flat and `src`-based layouts.

**Flat Layout:**
```
project-name/
├── project_name/
│   └── __init__.py
├── tests/
│   └── __init__.py
├── README.md
└── pyproject.toml
```

**src Layout:**
```
project-name/
├── src/
│   └── project_name/
│         └── __init__.py
├── tests/
│   └── __init__.py
├── README.md
└── pyproject.toml
```

---

## pip

### What is pip?

pip is the Python package installer. It is used to install and manage additional libraries and dependencies that are not included in the Python standard library.

#### Key Points

- Installs packages from the Python Package Index (PyPI) and other sources.
- Operates via the command line (`pip install package_name`).
- Does not manage virtual environments or project metadata directly.

---

### How pip Works

pip reads a list of package names and versions, usually from a `requirements.txt` file, and installs them into the currently active Python environment.

**Example `requirements.txt`:**
```
requests==2.25.1
numpy>=1.21.0
```
Install the listed packages:
```bash
pip install -r requirements.txt
```

---

### Requirements Files

The `requirements.txt` file lists dependencies for a project. pip does not resolve dependency conflicts automatically, so users are responsible for ensuring compatibility.

---

### Comparison Table: Poetry vs pip

| Feature                  | Poetry                      | pip                         |
|--------------------------|-----------------------------|-----------------------------|
| Dependency Management    | Yes                         | Yes                         |
| Virtual Environment      | Automatic (optional)        | No                          |
| Project Metadata         | Yes (`pyproject.toml`)      | No                          |
| Packaging & Publishing   | Yes                         | No                          |
| Lock File                | Yes (`poetry.lock`)         | No (possible with pip-tools)|
| Requirements File        | No (`pyproject.toml` used)  | Yes (`requirements.txt`)    |
| Source of Packages       | PyPI and custom             | PyPI and custom             |

---

## venv

### What is venv?

venv is a Python standard library module for creating lightweight, isolated Python environments. Each environment has its own Python interpreter and libraries, independent of other environments.

#### Key Points

- Ensures project isolation and avoids dependency conflicts.
- Each virtual environment can have its own dependencies and Python version.

---

### How venv Works and Its Association

- **Creating a virtual environment:**
  ```bash
  python -m venv env
  ```
- **Activating the environment:**
  ```bash
  source env/bin/activate
  ```
- **Deactivating the environment:**
  ```bash
  deactivate
  ```
- **Association:**  
  venv creates the context for an isolated Python environment. Tools like pip and Poetry can then be used inside this environment to install dependencies and manage packages without affecting system-wide Python or other projects.

---

## Installation and Setup

### Installing Poetry

#### Method 1: Using pipx (Recommended)
1. [Install pipx](https://pipx.pypa.io/stable/installation/)
2. Install Poetry:
   ```bash
   pipx install poetry
   ```

#### Method 2: Official Installer
- Visit [Poetry installer](https://github.com/python-poetry/install.python-poetry.org) and follow instructions for your operating system.

### Verifying Poetry Installation

After installation, check Poetry is available:
```bash
poetry --version
```

---

## Best Practices

- Use `pyproject.toml` as the single source of truth for dependencies.
- Separate development and runtime dependencies.
- Use the `src` layout for larger projects.
- Regularly update and audit dependencies.
- Document dependency usage and project setup steps.
- Use version constraints to balance stability and updates.

---

## Troubleshooting

| Problem                                  | Solution                                                               |
|-------------------------------------------|------------------------------------------------------------------------|
| Poetry command not found                  | Ensure Poetry’s installation path is in your PATH variable.             |
| Permission errors during install          | Use the `--user` flag or adjust system permissions.                     |
| Environment inconsistencies               | Remove and recreate the virtual environment.                            |
| Dependency conflicts or resolution errors | Review and adjust version constraints in `pyproject.toml` or requirements.txt |

---

## FAQ

**Q: Is Poetry open source?**  
A: Yes, Poetry is open source.

**Q: Does Poetry replace pip and venv?**  
A: Poetry uses pip and venv internally but provides additional features and a unified interface.

**Q: Can Poetry be used with existing projects?**  
A: Yes. Use `poetry init` in an existing project directory.

**Q: Where are dependencies managed?**  
A: In `pyproject.toml` for Poetry, and in `requirements.txt` for pip.

---

## References

| Link                                                                                                  | Description                                        |
|-------------------------------------------------------------------------------------------------------|----------------------------------------------------|
| [Poetry Documentation](https://python-poetry.org/docs/)                                               | Official Poetry documentation                      |
| [pipx Installation](https://pipx.pypa.io/stable/installation/)                                        | pipx official guide                                |
| [PEP 518: pyproject.toml](https://www.python.org/dev/peps/pep-0518/)                                  | pyproject.toml specification                       |
| [Real Python: Dependency Management](https://realpython.com/dependency-management-python-poetry/)      | Community guide                                    |

---

## Author Information

| Name               | Email Address         |
|--------------------|----------------------|
| Ashutosh Kumar | ashutosh.kumar.snaatak@mygurukulam.co  |

---
