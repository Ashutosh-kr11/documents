# React JS Installation via Bash Script

---

| Created By      | Created on   | Version | Last updated by   | Pre Reviewer   | L0 Reviewer | L1 Reviewer | L2 Reviewer |
|-----------------|--------------|---------|-------------------|----------------|-------------|-------------|-------------|
| Ashutosh Kumar  | 2025-07-18   | 1.0     | Ashutosh Kumar    |                |             |             |             |

---

## Table of Contents

1. [Overview](#overview)
2. [Purpose](#purpose)
3. [Prerequisites](#prerequisites)
4. [Key Features](#key-features)
5. [Installation Methods](#installation-methods)
    - [Generic Bash Script](#generic-bash-script)
    - [Script Parameters](#script-parameters)
    - [Supported Scenarios](#supported-scenarios)
    - [Installation Script](#installation-script)
6. [How to Use the Installation Script](#how-to-use-the-installation-script)
7. [Upgrade and Version Management](#upgrade-and-version-management)
8. [Troubleshooting](#troubleshooting)
9. [Best Practices](#best-practices)
10. [FAQ](#faq)
11. [References](#references)
12. [Contact Information](#contact-information)

---

## Overview

This documentation describes the process for installing React JS using a generic Bash script. The approach supports installation of multiple React versions, including upgrades and downgrades, and provides flexibility for automation and CI/CD pipelines.

---

## Purpose

- Automate the installation of React JS for different versions.
- Support upgrades and downgrades of React in existing projects.
- Provide a standardized, repeatable, and scriptable method for React setup.

---

## Prerequisites

- A Unix-like environment (Linux, macOS, WSL on Windows)
- Bash shell (`bash`)
- Node.js and npm installed (recommended latest LTS)
    - [Node.js Download](https://nodejs.org/en/download/)
- Network access to npm registry

---

## Key Features

- **Version Flexibility:** Install any specific React version.
- **Upgrade/Downgrade Support:** Handle upgrades or rollbacks to desired versions.
- **Project Agnostic:** Can be used in any project directory.
- **Idempotent:** Re-running the script with the same version will not cause issues.
- **CLI Parameters:** Accepts arguments for version and target directory.
- **Logging and Error Handling:** Outputs success and failure messages.

---

## Installation Methods

### Generic Bash Script

A robust, reusable Bash script can manage the installation, upgrade, or downgrade of React JS in any target project directory.

---

### Script Parameters

| Parameter             | Description                                         | Example                        |
|-----------------------|-----------------------------------------------------|--------------------------------|
| `-v` or `--version`   | React version to install (required)                 | `18.2.0`                       |
| `-d` or `--directory` | Target project directory (optional, default: `.`)   | `/home/user/my-app`            |
| `-u` or `--upgrade`   | Force upgrade/downgrade to specified version        | *(flag, no value required)*    |
| `-h` or `--help`      | Show help message                                   |                                |

---

### Supported Scenarios

- **Fresh Installation:** Install React in a new or existing project.
- **Upgrade:** Upgrade React to a newer version.
- **Downgrade:** Rollback React to an older version.
- **Reproducibility:** Ensures the same version is used across environments.

---

### [Installation Script](https://github.com/Ashutosh-kr11/documents/blob/main/reactjs_install.sh)

```bash
#!/bin/bash

set -e

usage() {
  echo "Usage: $0 -v <react_version> [-d <project_dir>] [-u]"
  echo "  -v, --version     React version to install (required)"
  echo "  -d, --directory   Target project directory (default: current directory)"
  echo "  -u, --upgrade     Force upgrade/downgrade to specified version"
  echo "  -h, --help        Show this help message"
  exit 1
}

REACT_VERSION=""
PROJECT_DIR="."
FORCE_UPGRADE=false

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -v|--version)
      REACT_VERSION="$2"
      shift; shift
      ;;
    -d|--directory)
      PROJECT_DIR="$2"
      shift; shift
      ;;
    -u|--upgrade)
      FORCE_UPGRADE=true
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
done

if [[ -z "$REACT_VERSION" ]]; then
  echo "Error: React version is required."
  usage
fi

cd "$PROJECT_DIR"

if [ ! -f package.json ]; then
  echo "Initializing npm project..."
  npm init -y
fi

if $FORCE_UPGRADE; then
  echo "Installing React@$REACT_VERSION (forced)..."
  npm install react@$REACT_VERSION react-dom@$REACT_VERSION --save --force
else
  echo "Installing/Updating React@$REACT_VERSION..."
  npm install react@$REACT_VERSION react-dom@$REACT_VERSION --save
fi

echo "React@$REACT_VERSION installation complete in $PROJECT_DIR"
```

---
## How to Use the Installation Script

### Step 1: Save and Make Executable
```bash
curl -O https://github.com/Ashutosh-kr11/documents/blob/main/reactjs_install.sh  # or copy-paste and save
chmod +x reactjs_install.sh
```
### Step 2: Run the Script
- For the latest React version:
```bash
sudo bash ./reactjs_install.sh -v 18.2.0
```
- For a specific version in a specific directory:
```bash
sudo bash ./reactjs_install.sh -v 17.0.2 -d /home/user/my-react-app
```
- Get help:
```bash
bash ./reactjs_install.sh -h
```
### Step 3: Verify Installation
In your project directory, check:
```bash
npm list react --depth=0
```
You should see the specified React version installed.

---

## Upgrade and Version Management

- To **upgrade** React, specify the new version with `-v` and use `-u` to force the upgrade if needed.
- To **downgrade**, specify an older version as the target.
- The script ensures `react` and `react-dom` are always aligned.
- Use version control (`git`) to track changes to `package.json` and `package-lock.json`.

---

## Troubleshooting

| Issue                           | Resolution                                           |
|----------------------------------|-----------------------------------------------------|
| Permission errors                | Use `sudo` if required, or adjust directory rights. |
| Node/npm not found               | Ensure Node.js and npm are installed and in PATH.   |
| Network issues                   | Check internet connection and npm registry status.  |
| Version conflicts or warnings    | Use `-u` to force the version, review npm logs.     |
| Existing project breakage        | Verify compatibility of other dependencies.         |

---

## Best Practices

- Always specify the React version explicitly for reproducibility.
- Use the script as part of CI/CD setup steps.
- Test upgrades in a separate branch/environment before production rollout.
- Keep Node.js and npm updated for best compatibility and security.
- Use `git` to manage project changes before running upgrades.

---

## FAQ

**Q: Can this script be used for new and existing projects?**  
A: Yes, it initializes npm if needed and works for both scenarios.

**Q: Does it install additional dependencies?**  
A: By default, it installs `react` and `react-dom`. You can extend the script for other packages.

**Q: How do I verify the installed version?**  
A: Run `npm list react` in the project directory.

**Q: Can it be integrated with CI/CD?**  
A: Yes, the script is suitable for automated pipelines.

---

## References

| Link                                                   | Description                      |
|--------------------------------------------------------|----------------------------------|
| [React JS Docs](https://react.dev/)                    | Official React documentation     |
| [npm Docs](https://docs.npmjs.com/)                    | npm official documentation       |
| [Node.js Download](https://nodejs.org/en/download/)    | Node.js downloads                |
| [React on npm](https://www.npmjs.com/package/react)    | React npm package                |

---

## Contact Information

| Name            | Email Address                         |
|-----------------|--------------------------------------|
| Ashutosh Kumar  | ashutosh.kumar.snaatak@mygurukulam.co|

---
