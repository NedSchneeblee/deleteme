pipeline {
    agent any

    environment{
        DOCKER = credentials('Docker')
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t nedscneedblee/flaskapp .'
            }
        }
        stage('Login and Push'){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'Docker') {
    // some block
                }
            }
        }
    }
}