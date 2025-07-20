# Azure Infrastructure Automation with Terraform

## Overview

This project automates the provisioning of a complete Azure infrastructure using **Terraform**. It follows a modular structure to promote reusability, scalability, and clarity. The resources deployed include networking components, compute resources, and database services, with proper implementation of security and data handling practices.

---

## Features

- 🚀 Automated deployment of Azure infrastructure
- 🧱 Modular Terraform structure for maintainability
- 🌐 Creation of:
kkkk
  - Resource Group
  - Virtual Network (VNet)
  - Subnets
  - Network Interface Cards (NICs)
  - Public IP Addresses
  - Virtual Machines (VMs)
  - Key Vault
  - Network Security Group(NSG)
  - NIC-NSG assosiation
  - Azure SQL Database Server and Databases
- 🔐 Integration with Azure Key Vault for secrets and credential management
- 📤 Usage of `output` blocks for inter-module communication and value export
- 📥 Usage of `data` blocks to reference existing or computed values

---

