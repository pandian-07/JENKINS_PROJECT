pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.5'
            args '--entrypoint=""'
        }
    }

    environment {
        TF_ROOT = "My_INFRA_AWS"
        AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {

        stage('Terraform Init & Validate') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_ROOT}") {
                        sh '''
                          terraform init
                          terraform validate
                        '''
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_ROOT}") {
                        sh 'terraform plan -out=tfplan'
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
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_ROOT}") {
                        sh '''
                          terraform apply -auto-approve tfplan
                          terraform output -raw public_ip > ec2_ip.txt
                        '''
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            input {
                message "Destroy Terraform Infrastructure?"
                ok "Destroy"
            }
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_ROOT}") {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}

