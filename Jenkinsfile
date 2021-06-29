pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:5.0'
        }
    }

    stages {
        stage('DotNet Build') {
            steps {
                sh 'dotnet build'
            }
        }
        stage('DotNet Test') {
            steps {
                sh 'dotnet test'
            }
        }
        // stage('Node Build') {
        //     agent {
        //         docker { image 'node:14-alpine' }
        //         reuseNode true
        //     }
        //     steps {
        //         dir('./DotnetTemplate.Web') {
        //             node install
        //         }
        //     }
        // }
        // stage('Node Test') {
        //     agent {
        //         docker { image 'node:14-alpine' }
        //         reuseNode true
        //     }
        //     steps {
        //         dir('./DotnetTemplate.Web') {
        //             npm run lint
        //             npm t
        //         }
        //     }
        // }
    }
}
