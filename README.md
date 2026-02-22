# 🌍 NGO Donation System – Infrastructure Automation Project

This project automates the provisioning and deployment of a Non-Profit (NGO) donation web application using Infrastructure as Code (Terraform) and Docker.

The goal is to eliminate manual configuration errors and enable repeatable, scalable environment setup using DevOps practices.

---

## 📌 Project Objective

To build and deploy an NGO donation application with:

- Docker-based containerization
- Terraform-based Infrastructure as Code (IaC)
- Automated and repeatable deployment
- Simple interactive frontend for user donations

---

## 🏗️ System Architecture

User (Browser)
        ↓
Flask Web Application
        ↓
Docker Container
        ↓
Terraform Automation

- The user interacts with the donation form.
- Flask processes donation requests.
- The application runs inside a Docker container.
- Terraform automates infrastructure provisioning.

---

## 🛠️ Tech Stack

- **Backend:** Python (Flask)
- **Frontend:** HTML, CSS
- **Containerization:** Docker
- **Infrastructure as Code:** Terraform
- **Version Control:** Git & GitHub

---

## 📂 Project Structure
ngo-iac-project/
│
├── app/
│ ├── app.py
│ └── templates/
│ ├── index.html
│ └── success.html
│
├── Dockerfile
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── screenshots/
│
└── README.md
🚀 Running the Application (Docker)

### Step 1: Build Docker Image


docker build -t ngo-app .


### Step 2: Run Docker Container


docker run -p 5000:5000 ngo-app

Step 3: Open in Browser


http://localhost:5000


You will see the NGO Donation Form.

---

## 🌍 Terraform Infrastructure Automation

Navigate to terraform directory:
cd terraform


Initialize Terraform:


terraform init


Preview infrastructure changes:
terraform plan


Apply configuration:


terraform apply


This provisions infrastructure automatically without manual setup

🔄 Key Features

- Interactive donation form
- Dockerized Flask application
- Automated infrastructure provisioning using Terraform
- Clean and modular project structure
- Repeatable and scalable deployment
- Version controlled via GitHub

---

## 🎯 DevOps Concepts Demonstrated

- Infrastructure as Code (IaC)
- Containerization
- Automation
- Deployment consistency
- Environment reproducibility
- Version control workflow

---

## 🚀 Future Improvements

- AWS EC2 deployment using Terraform
- CI/CD integration (GitHub Actions / Jenkins)
- Database integration for storing donations



👩‍💻 Author

Kratika Singhal

---

## ⭐ Conclusion

This project demonstrates how DevOps practices can automate application deployment and infrastructure provisioning, ensuring reliability, scalability, and consistency for NGO systems.
