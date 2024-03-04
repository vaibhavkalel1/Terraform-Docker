def ansiColorWrap(color, command) {
    def result
    ansiColor(color) {
        result = sh(script: command, returnStatus: true)
    }
    return result
}

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
                // Generate and display an execution plan with ANSI color
                def planResult = ansiColorWrap('xterm', 'terraform plan')
                echo "Terraform Plan Exit Code: ${planResult}"
            }
        }
        
        stage('Terraform Apply') {
            steps {
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
