pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the main branch
                git branch: 'main', url: 'https://github.com/johnmello31/helpme.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    def image = docker.build("your-image-name")
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
