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
                dir("${TF_ROOT}") {
                    bat 'terraform init'
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
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'TF_VAR_aws_access_key'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'TF_VAR_aws_secret_key')
                ]) {
                    dir("${TF_ROOT}") {
                        bat 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            input {
                message "Apply Terraform Infrastructure?"
                ok "Apply"
            }
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'TF_VAR_aws_access_key'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'TF_VAR_aws_secret_key')
                ]) {
                    dir("${TF_ROOT}") {
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }
}

