Jenkins CI/CD Project – AWS Infrastructure & Application Automation

📌 Project Overview

This project demonstrates an **end-to-end CI/CD automation pipeline using Jenkins**, integrated with **GitHub Webhooks**, **Terraform**, and **AWS EC2**. The pipeline automatically provisions cloud infrastructure and deploys a **Node.js web application** whenever code is pushed to the GitHub repository.

The goal of this project is to showcase **real-world DevOps practices**, including Pipeline-as-Code, Infrastructure-as-Code (IaC), automated deployments, and cloud resource management.

---

🏗️ Project Architecture

1. Developer pushes code to GitHub
2. GitHub Webhook triggers Jenkins pipeline automatically
3. Jenkins pulls source code and Jenkinsfile from SCM
4. Jenkins executes Terraform stages
5. Terraform provisions AWS EC2 infrastructure
6. Application is deployed and managed on EC2
7. Application becomes accessible via public IP

---

📂 Project Structure

```
JENKINS_PROJECT/
├── Jenkinsfile
├── My_APP/
│   ├── app.js
│   ├── index.html
│   └── package.json
├── My_INFRA_AWS/
│   ├── main.tf
│   ├── variable.tf
│   ├── output.tf
│   └── US.sh
└── README.md
```

---

⚙️ Jenkins Pipeline Stages

The Jenkins pipeline is defined using a **Declarative Jenkinsfile** and includes the following stages:

* **Checkout SCM** – Pulls source code from GitHub
* **Terraform Version Check** – Verifies Terraform installation
* **Terraform Init** – Initializes backend and providers
* **Terraform Validate** – Validates Terraform configuration
* **Terraform Plan** – Shows execution plan
* **Terraform Apply** – Provisions AWS infrastructure

---

☁️ Infrastructure Details

* **Cloud Provider:** AWS
* **Service Used:** EC2
* **OS:** Ubuntu
* **Instance Type:** t3.micro
* **Provisioning Tool:** Terraform

The EC2 instance is bootstrapped using **user_data**, which installs required dependencies and prepares the runtime environment.

---

🚀 Application Deployment

* **Application Type:** Node.js Web Application
* **Process Management:** Linux systemd
* **Port:** 3000

The application is automatically started and managed using systemd, ensuring reliability and automatic restarts.

---

🔐 Security & Credentials

* AWS credentials are stored securely using **Jenkins Credentials Manager**
* No sensitive information is hardcoded in the pipeline or source code

---

🧰 Tools & Technologies Used

* Jenkins (CI/CD Automation)
* Git & GitHub (Source Control & Webhooks)
* Terraform (Infrastructure as Code)
* AWS EC2
* Node.js
* Linux (systemd)

---

🎯 Key Learnings

* Implemented Pipeline-as-Code using Jenkinsfile
* Automated infrastructure provisioning with Terraform
* Integrated Jenkins with GitHub Webhooks
* Deployed and managed applications on AWS EC2
* Followed DevOps best practices for automation and security

---

📌 Use Case

This project is suitable for:

* DevOps CI/CD demonstrations
* Jenkins + Terraform integration examples
* Cloud automation learning
* Resume and portfolio projects

---
👤 Author

**M. Pandian**
DevOps & Cloud Enthusiast
