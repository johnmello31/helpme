pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the main branch
                git branch: 'main', url: 'https://your-repository-url.git'
            }
        }
        
        stage('Output Dockerfile') {
            steps {
                // Output the contents of the Dockerfile
                sh 'cat Dockerfile'
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
