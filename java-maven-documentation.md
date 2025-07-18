# Java Maven Documentation

---

| Created By      | Created on   | Version | Last updated by   | Pre Reviewer   | L0 Reviewer | L1 Reviewer | L2 Reviewer |
|-----------------|--------------|---------|-------------------|----------------|-------------|-------------|-------------|
| Ashutosh Kumar  | 2025-07-18   | 1.0     | Ashutosh Kumar    |                |             |             |             |

---

## Table of Contents

1. [Overview](#overview)
2. [Why Use Maven?](#why-use-maven)
3. [What is Maven?](#what-is-maven)
4. [Key Features of Maven](#key-features-of-maven)
5. [Maven Repositories](#maven-repositories)
    - [Local Repository](#local-repository)
    - [Remote Repository](#remote-repository)
    - [Repository Lookup Flow](#repository-lookup-flow)
6. [Maven Project Lifecycle](#maven-project-lifecycle)
    - [Lifecycle Phases](#lifecycle-phases)
    - [Common Lifecycle Commands](#common-lifecycle-commands)
7. [Project Structure](#project-structure)
8. [Configuration: pom.xml](#configuration-pomxml)
9. [Maven Plugins](#maven-plugins)
10. [Best Practices](#best-practices)
11. [Troubleshooting](#troubleshooting)
12. [FAQ](#faq)
13. [References](#references)
14. [Contact Information](#contact-information)

---

## Overview

Maven is a build automation and dependency management tool for Java projects. It provides a standardized way to manage a project's build lifecycle, dependencies, and documentation, ensuring consistent builds and easier collaboration.

---

## Why Use Maven?

- Ensures consistent and repeatable builds across environments
- Automates dependency resolution and management
- Enforces a standard project structure
- Handles compilation, testing, packaging, and deployment
- Integrates with CI/CD, code analysis, and reporting tools

---

## What is Maven?

Maven is an open-source build automation tool for Java and related projects. It uses an XML file (`pom.xml`) to describe the project structure, dependencies, and build steps. Maven handles downloading required libraries from repositories, running build phases, and managing the entire project lifecycle.

---

## Key Features of Maven

- **Dependency Management:** Automatic download and conflict resolution for project libraries.
- **Standard Directory Layout:** Promotes a consistent project structure.
- **Build Lifecycle:** Well-defined phases for compiling, testing, packaging, and deploying code.
- **Extensible With Plugins:** Broad ecosystem for tasks like code quality checks, deployment, and documentation.
- **Multi-module Support:** Manage related projects together.
- **Repository Management:** Uses both local and remote repositories for storing and sharing artifacts.

---

## Maven Repositories

Maven uses repositories to store and retrieve dependencies and plugins. There are two main types of repositories:

### Local Repository

- A directory on the developer’s machine (default: `~/.m2/repository`).
- Stores all artifacts (JARs, plugins, etc.) downloaded by Maven for offline use.
- Maven first checks the local repository for dependencies before querying remote repositories.

### Remote Repository

- Hosted on remote servers (e.g., Maven Central, private Nexus/Artifactory).
- Used for downloading dependencies not available locally.
- Can be public (e.g., [Maven Central](https://search.maven.org/)) or private for internal company use.
- Organizations may set up custom remote repositories for sharing proprietary or internal artifacts.

### Repository Lookup Flow

1. **Check Local Repository:** Maven first searches the local repository for the requested dependency.
2. **Query Remote Repository:** If not found locally, Maven queries configured remote repositories.
3. **Cache Locally:** Downloaded artifacts are stored in the local repository for future builds.

---

## Maven Project Lifecycle

Maven organizes the build process into a set of well-defined phases, known as the **build lifecycle**. Each lifecycle consists of a sequence of phases that handle various aspects of building and managing a project.

### Lifecycle Phases

There are three built-in lifecycles in Maven:

1. **Default (Build) Lifecycle:** Handles project deployment.
2. **Clean Lifecycle:** Handles project cleaning.
3. **Site Lifecycle:** Handles project documentation.

The most commonly used is the **Default lifecycle**, which includes these core phases:

| Phase         | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| validate      | Validates the project structure and configuration.                          |
| compile       | Compiles the source code.                                                   |
| test          | Runs tests using a suitable testing framework.                              |
| package       | Packages the compiled code into a distributable format (e.g., JAR, WAR).    |
| verify        | Runs any checks to verify the package is valid and meets quality criteria.  |
| install       | Installs the package into the local repository for use as a dependency.     |
| deploy        | Copies the package to a remote repository for sharing with other developers.|

Other important lifecycles:

- **Clean:**  
    - `pre-clean`, `clean`, `post-clean`  
    - Removes files generated during the previous build.

- **Site:**  
    - `pre-site`, `site`, `post-site`, `site-deploy`  
    - Generates project documentation.

### Common Lifecycle Commands

- `mvn validate` — Validate the project is correct and all necessary information is available.
- `mvn compile` — Compile the source code.
- `mvn test` — Run tests.
- `mvn package` — Package the code into a JAR/WAR.
- `mvn install` — Install the package into the local repository.
- `mvn deploy` — Deploy the package to a remote repository.
- `mvn clean` — Remove generated files from previous builds.
- `mvn site` — Generate project documentation.

---

## Project Structure

A typical Maven project has the following layout:

```
project-root/
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
│       ├── java/
│       └── resources/
├── pom.xml
```

- `src/main/java`: Application source code.
- `src/main/resources`: Application resources.
- `src/test/java`: Unit test code.
- `src/test/resources`: Test resources.
- `pom.xml`: Project Object Model configuration.

---

## Configuration: pom.xml

The `pom.xml` file is the core configuration for a Maven project. It defines:

- Project metadata (name, version, description)
- Dependencies (external libraries, plugins)
- Build configuration (plugins, goals, profiles)
- Repository configuration

**Sample:**
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.example</groupId>
  <artifactId>my-app</artifactId>
  <version>1.0.0</version>
  <packaging>jar</packaging>

  <dependencies>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-core</artifactId>
      <version>5.3.20</version>
    </dependency>
    <!-- More dependencies -->
  </dependencies>

  <build>
    <plugins>
      <!-- Build plugins -->
    </plugins>
  </build>
</project>
```

---

## Maven Plugins

Maven plugins extend the capabilities of Maven and are used to perform tasks such as compiling code, running tests, packaging, deployment, code analysis, and more.

- **Compiler Plugin:** Compiles Java source code.
- **Surefire Plugin:** Runs unit tests.
- **JAR/WAR Plugin:** Packages the compiled code.
- **Deploy Plugin:** Handles deployment to remote repositories.
- **Site Plugin:** Generates project documentation.

Plugins are configured in the `<build>` section of `pom.xml`.

---

## Best Practices

- Use Maven Central or trusted private repositories for dependencies.
- Keep `pom.xml` organized and document custom configurations.
- Use dependency scopes (`compile`, `test`, `provided`) appropriately.
- Manage versions using a parent POM or properties for consistency.
- Regularly update dependencies for security and stability.
- Leverage plugins for quality checks, documentation, and reporting.

---

## Troubleshooting

| Issue                       | Solution                                                                 |
|-----------------------------|--------------------------------------------------------------------------|
| Dependency not found        | Check repository URLs in `pom.xml`, verify artifact coordinates.         |
| Build failures              | Review build logs, check plugin versions, ensure all dependencies exist. |
| Outdated dependencies       | Use `mvn versions:display-dependency-updates` to check for new versions. |
| Network issues              | Verify internet connectivity and remote repository URLs.                 |
| Local repo corruption       | Delete the problematic artifact/folder in `~/.m2/repository` and rebuild.|

---

## FAQ

**Q: Can Maven manage non-Java projects?**  
A: Maven is optimized for Java but can handle other languages using plugins.

**Q: Where does Maven store downloaded dependencies?**  
A: In the local repository, usually at `~/.m2/repository`.

**Q: How do I add a new dependency?**  
A: Add a `<dependency>` entry in the `pom.xml` under the `<dependencies>` section.

**Q: What is the difference between local and remote repositories?**  
A: The local repository is on your machine for caching, while remote repositories are online sources for downloading dependencies.

**Q: What is the Maven build lifecycle?**  
A: It is a sequence of build phases (validate, compile, test, package, install, deploy) that automate the building and management of your project.

---

## References

| Link                                  | Description                                  |
|----------------------------------------|----------------------------------------------|
| [Maven Official Documentation](https://maven.apache.org/guides/index.html) | Official Maven guides and documentation      |
| [Maven Central Repository](https://search.maven.org/) | Search and browse open-source Java libraries |
| [Introduction to the POM](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html) | Guide to the pom.xml structure               |
| [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html) | Quick start guide                            |

---

## Contact Information

| Name            | Email Address                         |
|-----------------|--------------------------------------|
| Ashutosh Kumar  | ashutosh.kumar.snaatak@mygurukulam.co|

---