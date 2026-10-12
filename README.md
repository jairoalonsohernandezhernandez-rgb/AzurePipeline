# Azure Production-Ready Hub-Spoke Infrastructure with Terraform

![Terraform Validation](https://github.com/jairoalonsohernandezhernandez-rgb/AzurePipeline/actions/workflows/terraform.yml/badge.svg)
![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235847b7.svg?style=flat&logo=terraform&logoColor=white)

## 📌 Description

This repository provides modular Infrastructure as Code (IaC) written in **Terraform** to deploy a secure, high-availability **Hub-Spoke Network Architecture** in **Microsoft Azure**. 

The design applies production-grade cloud security patterns, including centralized egress traffic control via NAT Gateway, network isolation through Private Endpoints, dynamic IP management, and automated continuous integration pipelines via GitHub Actions.

---

## 📐 Architecture Overview

The architecture follows Azure's recommended **Enterprise Landing Zone** design pattern:

* **Hub VNet:** Serves as the central point of connectivity, housing shared network resources and outbound internet routing.
  * **NAT Gateway & Public IP:** Provides secure, outbound-only internet connectivity for internal workloads without exposing public inbound IPs.
* **Spoke VNet:** Isolates application workloads and database tiers from directly accessing public networks.
  * **Compute Layer:** Linux Virtual Machine configured inside isolated subnets with dynamic internal IP allocation.
  * **Storage & Data Layer:** Azure Storage Account isolated behind **Private Endpoints (`subresource_names = ["blob"]`)**, blocking public endpoint access and routing internal network traffic exclusively through Azure's backbone network.

---

## 📁 Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── terraform.yml     # CI Pipeline for formatting and syntax validation
├── modules/
│   ├── spoke_network/        # VNet, Subnets, and Network Security Groups (NSGs)
│   ├── secure_storage/       # Azure Storage Account & Private Endpoints
│   └── virtual_machine/      # Linux Compute, NIC, and SSH Key deployment
├── .gitignore                # Protects sensitive states, SSH keys, and tfvars
├── main.tf                   # Root deployment module and provider config
├── variables.tf              # Input variable declarations
├── outputs.tf                # Infrastructure output values
└── README.md