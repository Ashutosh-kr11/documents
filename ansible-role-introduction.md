# Ansible Role Introduction

---

| Created By      | Created on   | Version | Last updated by   | Pre Reviewer   | L0 Reviewer | L1 Reviewer | L2 Reviewer |
|-----------------|--------------|---------|-------------------|----------------|-------------|-------------|-------------|
| Ashutosh Kumar  | 2025-07-18   | 1.0     | Ashutosh Kumar    |                |             |             |             |

---

## Table of Contents

1. [Overview](#overview)
2. [Why Use Ansible Roles?](#why-use-ansible-roles)
3. [What is an Ansible Role?](#what-is-an-ansible-role)
4. [Key Features of Ansible Roles](#key-features-of-ansible-roles)
5. [References](#references)
6. [Contact Information](#contact-information)

---

## Overview

Ansible is an open-source automation tool for configuration management, application deployment, and task automation. In Ansible, **roles** are a method of automatically loading certain variables, tasks, handlers, and other Ansible artifacts based on a known file structure. Roles help organize playbooks and enable reusable and modular automation code.

---

## Why Use Ansible Roles?

- **Modularity**: Roles promote the reuse of automation tasks by breaking complex playbooks into smaller, modular components.
- **Organization**: By separating tasks, variables, handlers, and files into standardized directories, roles improve the maintainability and readability of automation code.
- **Scalability**: Roles allow automation code to scale across multiple projects and environments by enabling role sharing and distribution.
- **Collaboration**: Standardized structures make it easier for teams to collaborate, as contributors can quickly understand and extend existing automation.

---

## What is an Ansible Role?

An **Ansible role** is a collection of Ansible content (tasks, handlers, variables, files, templates, and modules) structured in a predefined way. Roles allow users to group related automation content and easily reuse or share it. Each role is designed to perform a specific function, such as installing a service, configuring a system, or deploying an application.

**Structure of an Ansible Role:**
```
roles/
  └── myrole/
      ├── tasks/
      ├── handlers/
      ├── files/
      ├── templates/
      ├── vars/
      ├── defaults/
      ├── meta/
      └── README.md
```
- `tasks/`: Main list of tasks to be executed by the role.
- `handlers/`: Handlers triggered by task notifications.
- `files/`: Files that can be deployed by the role.
- `templates/`: Jinja2 templates used by the role.
- `vars/`: Variables defined for the role.
- `defaults/`: Default variables for the role.
- `meta/`: Metadata about the role, including dependencies.

---

## Key Features of Ansible Roles

- **Reusable**: Roles can be used across different playbooks and projects.
- **Distributable**: Roles can be shared via Ansible Galaxy or version control systems.
- **Encapsulation**: Each role encapsulates all necessary automation logic for a specific function.
- **Standardized Structure**: Adopts a fixed directory layout, making it easy to understand and extend.
- **Variable Management**: Supports default and override mechanisms for variables.
- **Dependency Handling**: Roles can specify dependencies on other roles for complex automation scenarios.

---

## References

- [Ansible Roles Documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)
- [Ansible Galaxy Roles](https://galaxy.ansible.com/docs/contributing/creating_role.html)
- [Ansible Official Documentation](https://docs.ansible.com/ansible/latest/index.html)

---

## Contact Information

| Name            | Email Address                         |
|-----------------|--------------------------------------|
| Ashutosh Kumar  | ashutosh.kumar.snaatak@mygurukulam.co|

---