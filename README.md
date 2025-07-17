# Standard Operating Procedure (SOP)
## Title: Disk Usage & Ulimit Configuration on Ubuntu OS

### SOP Info:
**Version:** 1.0  
**Date:** 2025-07-16  
**Prepared By:** Cloud-Ops-Crew  
**Reviewed By:** []  
**Approval:** []  

---

## Table of Contents

1. [Purpose](#1-purpose)
2. [Scope](#2-scope)
3. [Prerequisites](#3-prerequisites)
4. [Procedure](#4-procedure)  
   4.1. [Check Disk Usage](#41-check-disk-usage)  
   &nbsp;&nbsp;&nbsp;4.1.1. [List All Mounted Filesystems & Usage](#411-list-all-mounted-filesystems--usage)  
   &nbsp;&nbsp;&nbsp;4.1.2. [Identify Top Disk Consumers](#412-identify-top-disk-consumers)  
   &nbsp;&nbsp;&nbsp;4.1.3. [Check Inode Usage](#413-check-inode-usage)  
   4.2. [Check and Manage Mount Points](#42-check-and-manage-mount-points)  
   &nbsp;&nbsp;&nbsp;4.2.1. [List Active Mounts](#421-list-active-mounts)  
   &nbsp;&nbsp;&nbsp;4.2.2. [Verify `/etc/fstab` for Persistent Mounts](#422-verify-etcfstab-for-persistent-mounts)  
   &nbsp;&nbsp;&nbsp;4.2.3. [Mount/Unmount Filesystems (if necessary)](#423-mountunmount-filesystems-if-necessary)  
   4.3. [Configure Ulimit Settings](#43-configure-ulimit-settings)  
   &nbsp;&nbsp;&nbsp;4.3.1. [Check Current Ulimit Values](#431-check-current-ulimit-values)  
   &nbsp;&nbsp;&nbsp;4.3.2. [Set Temporary Ulimit for Current Session](#432-set-temporary-ulimit-for-current-session)  
   &nbsp;&nbsp;&nbsp;4.3.3. [Configure Persistent Ulimits for Users](#433-configure-persistent-ulimits-for-users)  
   &nbsp;&nbsp;&nbsp;4.3.4. [Verify Effective Limits for a User/Process](#434-verify-effective-limits-for-a-userprocess)  
5. [Troubleshooting](#5-troubleshooting)
6. [References](#6-references)
7. [Revision History](#7-revision-history)

---

## 1. Purpose
This SOP outlines standardized procedures to:
- Check disk usage and mount points
- Configure and verify ulimit (user limits) settings for users and processes  
on Ubuntu-based systems, ensuring optimal system performance and resource usage.

---

## 2. Scope
Applicable to all Ubuntu servers.

---

## 3. Prerequisites
- Access to the Ubuntu server with sudo privileges.
- Basic knowledge of Linux command-line operations.

---

## 4. Procedure

### 4.1 Check Disk Usage

#### 4.1.1 List All Mounted Filesystems & Usage
```bash
df -hT
```
- **Purpose:** Displays all mounted filesystems with type and human-readable sizes.

<img width="995" height="252" alt="Image" src="https://github.com/user-attachments/assets/c2c9fad1-c67a-446a-83d9-cd9e93bd210b" />

- Ensure root (/) is not above 80% usage.

##### Check Disk Usage by Directory
```bash
du -sh /path/to/directory
```
<img width="691" height="81" alt="Image" src="https://github.com/user-attachments/assets/c154c2de-09a7-4df7-a557-806334e8d56d" />

#### 4.1.2 Identify Top Disk Consumers
```bash
sudo du -ahx / | sort -rh | head -n 20
```
- **Purpose:** Lists top 20 largest files/directories on root (`/`).
- **Note:** Adjust the path as needed for specific mount points.

<img width="1001" height="602" alt="Image" src="https://github.com/user-attachments/assets/fa8b8740-c5ca-4151-9eae-08f4f503d92c" />

#### 4.1.3 Check Inode Usage
```bash
df -i
```
- **Purpose:** Identifies inode exhaustion, which can cause "disk full" errors despite free space.

<img width="1002" height="246" alt="Image" src="https://github.com/user-attachments/assets/c659d059-d990-4eb9-9fb9-20b0184b676f" />

---

### 4.2 Check and Manage Mount Points

#### 4.2.1 List Active Mounts
```bash
mount | column -t
```
<img width="1918" height="607" alt="Image" src="https://github.com/user-attachments/assets/0e58e046-c9a7-43f4-99fd-956c1704c733" />

or
```bash
lsblk -f
```
<img width="1918" height="575" alt="Image" src="https://github.com/user-attachments/assets/30fffd94-0f04-41ff-a619-be4c6cc569b5" />

- **Purpose:** Shows device, mount point, and filesystem type.

#### 4.2.2 Verify `/etc/fstab` for Persistent Mounts
```bash
cat /etc/fstab
```
- **Purpose:** Ensures all required filesystems are configured to auto-mount on boot.

<img width="976" height="306" alt="Image" src="https://github.com/user-attachments/assets/acb8611e-bf40-4670-a973-62263701f246" />

#### 4.2.3 Mount/Unmount Filesystems (if necessary)
- **Detect the New Disk in Ubuntu**
  ```bash
  lsblk
  ```
  <img width="988" height="572" alt="Image" src="https://github.com/user-attachments/assets/51d89320-be3f-434b-9dc7-f9180f284085" />

- **Partition the New Disk**
  ```bash
  sudo fdisk /dev/sdb
  ```
  Inside fdisk, do the following:
    - Press n → new partition
    - Press p → primary
    - Press 1 → partition number
    - Press Enter (accept defaults for first/last sector)
    - Press w → write changes
- **Now check**
  ```bash
  lsblk
  ```
  <img width="963" height="602" alt="Image" src="https://github.com/user-attachments/assets/3e06c7ef-f407-4c2b-8aac-31c7052ad339" />

- **Format the Partition**
  ```bash
  sudo mkfs.ext4 /dev/sdb1
  ```
  <img width="992" height="311" alt="Image" src="https://github.com/user-attachments/assets/39814ebe-ad54-461c-85b8-7fc1f7c082ba" />
  This creates an ext4 file system on the partition.

- **Create Mount Point**
  ```bash
  sudo mkdir -p /mnt/mydisk
  ```
- **To mount:**
  ```bash
  sudo mount /dev/sdXn /mount/point 
  ```
  <img width="1842" height="767" alt="Image" src="https://github.com/user-attachments/assets/bde1ee55-69c2-46a1-b885-1f92d6f81998" />

  
- **To unmount:**
  ```bash
  sudo umount /mount/point
  ```
  <img width="1818" height="636" alt="Image" src="https://github.com/user-attachments/assets/ddd1183b-db8a-4eb4-8d26-46a7ba88fd9a" />

---

### 4.3 Configure Ulimit Settings

#### 4.3.1 Check Current Ulimit Values
- For the current shell:
  ```bash
  ulimit -a
  ```
  <img width="792" height="496" alt="Image" src="https://github.com/user-attachments/assets/2efc1045-9081-447c-955b-00af0917439d" />


- For a specific limit (e.g., open files):
  ```bash
  ulimit -n
  ```
  <img width="488" height="47" alt="Image" src="https://github.com/user-attachments/assets/5e107865-7701-4b7f-82ff-32bc09a2164c" />


#### 4.3.2 Set Temporary Ulimit for Current Session
```bash
ulimit -n 4096
```
<img width="510" height="82" alt="Image" src="https://github.com/user-attachments/assets/347db596-42ed-4863-b10b-929c30166e68" />

- **Note:** This change lasts only for the current shell session.

#### 4.3.3 Configure Persistent Ulimits for Users

**Edit `/etc/security/limits.conf`:**
```bash
sudo nano /etc/security/limits.conf
```
- Add lines like:
  ```
  username   soft   nofile  4096
  username   hard   nofile  8192
  ```
  Or for all users:
  ```
  *   soft   nofile  4096
  *   hard   nofile  8192
  ```
- **Fields:**
  - *soft* - Soft limit (can be changed by the user up to the hard limit)
  - *hard* - Maximum limit (cannot be exceeded)

**For systemd services:**
- Edit the service unit file or create a drop-in override:
  ```ini
  [Service]
  LimitNOFILE=8192
  ```
  Reload systemd and restart the service:
  ```bash
  sudo systemctl daemon-reload
  sudo systemctl restart <service-name>
  ```

#### 4.3.4 Verify Effective Limits for a User/Process
- After login or restart:
  ```bash
  ulimit -a
  ```
- For a running process (PID):
  ```bash
  cat /proc/<PID>/limits
  ```

---

## 5. Troubleshooting

| Issue                      | Possible Cause                | Solution                                      |
|----------------------------|-------------------------------|-----------------------------------------------|
| Disk appears full          | Large files, inode exhaustion | Use `du`, `df -i`, delete unnecessary files   |
| Ulimit not applied         | PAM misconfig, wrong user     | Check `/etc/security/limits.conf`, relogin    |
| Mount not persistent       | Missing `/etc/fstab` entry    | Update `/etc/fstab` and mount manually        |

---

## 6. References

- [Ubuntu Server Guide: Disk Management](https://help.ubuntu.com/lts/serverguide/filesystems.html)
- [Ubuntu: Limits.conf Documentation](https://manpages.ubuntu.com/manpages/focal/en/man5/limits.conf.5.html)
- [Systemd Service Limits](https://www.freedesktop.org/software/systemd/man/systemd.exec.html#Process%20Properties)

---

## 7. Revision History

| Version | Date       | Author        | Change Description       |
|---------|------------|---------------|-------------------------|
| 1.0     | 2025-07-16 | Ashutosh Kr.   | Initial version         |

---

**End of SOP**
