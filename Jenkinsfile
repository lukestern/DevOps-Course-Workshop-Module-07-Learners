pipeline {
    agent none

    stages {
        stage('DotNet Build') {
            agent {
                docker {
                    image 'dotnet/sdk:5.0'
                    label 'dotnet-container'
                 }
                reuseNode true
            }
            steps {
                dotnet build
            }
        }
        stage('DotNet Test') {
            agent {
                docker {
                    image 'dotnet/sdk:5.0'
                    label 'dotnet-container'
                 }
                reuseNode true
            }
            steps {
                dotnet test
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
