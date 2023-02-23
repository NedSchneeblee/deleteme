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
        stage('Login'){
            steps{
                echo '$DOCKER | doker login -u nedscneedblee --password-stdin'
            }
        }    
    }
}