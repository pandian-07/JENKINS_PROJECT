pipeline {
    agent any

    environment {
        TF_ROOT = "My_INFRA_AWS"
        AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {

        stage('Terraform Version') {
            steps {
                bat 'terraform --version'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_ROOT}") {
                        bat 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_ROOT}") {
                    bat 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_ROOT}") {
                    bat 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            input {
                message "Apply Terraform Infrastructure?"
                ok "Apply"
            }
            steps {
                dir("${TF_ROOT}") {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}

