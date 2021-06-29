pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dotnet build
                cd ./DotNetTemplate.Web
                npm install
            }
        }
        stage('Test') {
            steps {
                pwd
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}