pipeline {
    agent any

    
    stages {
        stage('Login, Build and Push'){
            steps {
                script{
                    withDockerRegistry(credentialsId: 'Docker') {
                        docker.build('nedschneedblee/flaskapp').push('latest')
                    }
                }
            }
        }
        stage('AWS Commands'){
            steps{
                script{
                    withAWS(credentials: 'AWSCred', region: 'us-east-1'){
                        sh 'aws sts get-caller-identity'
                    }
                }
            }
        }
        stage('Kubernetes login'){
            steps{
                script{
                    withAWS(credentials: 'AWSCred', region: 'us-east-1'){
                        sh 'aws eks update-kubeconfig --region us-east-1 --name VETTEC'
                    }
                }
            }
        }
        stage('Create Namespace'){
            steps {
                script {
                    withAWS(credentials: 'AWSCred', region: 'us-east-1') {
                        try {
                            sh 'kubectl apply -f manifest.yaml'
                        } catch (Exception e) {
                            echo 'Exception occured: ' + e.toString()
                            echo 'Handled the Exception!'
                        }
                    }
                }
            }
        }
    }
}
