pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the main branch
                checkout([$class: 'GitSCM', 
                          branches: [[name: 'main']], 
                          doGenerateSubmoduleConfigurations: false, 
                          extensions: [], 
                          userRemoteConfigs: [[url: 'https://github.com/johnmello31/helpme.git']]
                ])
            }
        }
        
        stage('Output Dockerfile') {
            steps {
                // Output the contents of the Dockerfile and save to Dockerfile.txt
                sh 'cat Dockerfile > Dockerfile.txt'
            }
        }
        
        stage('Commit and Push Dockerfile.txt') {
            steps {
                // Commit and push Dockerfile.txt to the repository
                sh '''
                    git config user.email "johnmello31@gmail.com"
                    git config user.name "John Mello"
                    git add Dockerfile.txt
                    git commit -m "Add Dockerfile.txt"
                    git branch -M main
                    git push -f origin main
                '''
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

