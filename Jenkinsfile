pipeline {
    agent { label 'dev' }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('mounikaparchuri-dockerhub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/MounikaParchuri/jenkins-tomcat-cicd.git'
            }
        }
        stage('Build docker image') {
            steps {  
                sh 'docker build -t mounikaparchuri/tomcat-demo:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push mounikaparchuri/tomcat-demo:$BUILD_NUMBER'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
