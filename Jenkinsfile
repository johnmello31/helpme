pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'github-key' // Replace with the actual ID of your credentials
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the main branch
                checkout([$class: 'GitSCM', 
                          branches: [[name: 'main']], 
                          doGenerateSubmoduleConfigurations: false, 
                          extensions: [], 
                          userRemoteConfigs: [[url: 'https://github.com/johnmello31/helpme.git',
                                               credentialsId: env.GIT_CREDENTIALS_ID]]
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
                withCredentials([string(credentialsId: env.GIT_CREDENTIALS_ID, variable: 'GITHUB_TOKEN')]) {
                    sh '''
                        git config user.email "johnmello31@gmail.com"
                        git config user.name "John Mello"
                        git checkout main
                        git add Dockerfile.txt
                        git commit -m "Add Dockerfile.txt"
                        git remote set-url origin https://$GITHUB_TOKEN@github.com/johnmello31/helpme.git
                        git push -f origin main
                    '''
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
