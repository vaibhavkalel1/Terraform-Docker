pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vaibhavkalel1/Terraform-Docker.git' // Replace with your repository URL
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
