pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the main branch
                checkout([$class: 'GitSCM', 
                          branches: [[name: '*/main']], 
                          doGenerateSubmoduleConfigurations: false, 
                          extensions: [], 
                          userRemoteConfigs: [[url: 'https://github.com/johnmello31/helpme']]
                ])
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
