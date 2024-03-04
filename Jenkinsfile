pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        
        stage('Deploy Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 8000:80 vaibhavkalel/tf_docker_image:latest'
                }
            }
        }
    }
    
    post {
        always {
            stage('Terraform Cleanup') {
                steps {
                    script {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
