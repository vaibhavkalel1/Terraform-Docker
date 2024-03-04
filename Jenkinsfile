pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform scripts from version control
                // Replace the repository URL with your actual Git repository URL
                git 'https://github.com/vaibhavkalel1/Terraform-Docker.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                // Initialize Terraform in the directory containing your Terraform scripts
                sh 'terraform init'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                // Generate and display an execution plan
                sh 'terraform plan'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform execution plan automatically without prompting for confirmation
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
