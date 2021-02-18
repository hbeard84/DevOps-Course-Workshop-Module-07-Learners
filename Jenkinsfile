pipeline {
    agent none
    stages {
        stage('.Net core') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/core/sdk:3.1' 
                    args '-e DOTNET_CLI_HOME="/tmp/DOTNET_CLI_HOME"'
                }
            }
            steps {
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}
