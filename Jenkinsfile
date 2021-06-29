pipeline {
    agent none

    stages {
        stage('DotNet') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk:5.0'
                }
            }
            environment {
                DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
            }
            stages {
                stage('Build') {
                    steps {
                        sh 'dotnet build'
                    }
                }
                stage('Test') {
                    steps {
                        sh 'dotnet test'
                    }
                }
            }
        }

        stage('Node') {
                agent {
                    docker { image 'node:14-alpine' }
                }
            stages {
                stage('Node Build') {
                    steps {
                        dir('./DotnetTemplate.Web') {
                            sh 'npm install'
                        }
                    }
                }
                stage('Node Test') {
                    steps {
                        dir('./DotnetTemplate.Web') {
                            sh 'npm run lint'
                            sh 'npm t'
                        }
                    }
                }
            }
        }
    }
}
