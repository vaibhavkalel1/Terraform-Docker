pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vaibhavkalel1/Terraform-Docker.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                // Generate and display an execution plan
                def planResult = runCommandWithColor('terraform plan')
                echo "Terraform Plan Exit Code: ${planResult}"
            }
        }
        
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform execution plan automatically without prompting for confirmation
                sh 'terraform apply -auto-approve'
            }
        }
    }
    
    post {
        always {
            // Clean up Terraform resources
            sh 'terraform destroy -auto-approve'
        }
    }
}
