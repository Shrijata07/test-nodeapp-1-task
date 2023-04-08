
pipeline {
  agent {
    label 'Application'
  }

  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      parallel {
        stage('Build and Push Docker Image') {
          steps {
            sh '''
            sudo docker build . -t 412064873312.dkr.ecr.us-east-1.amazonaws.com/course-assignment-c7:v${BUILD_NUMBER}
            sudo docker push 412064873312.dkr.ecr.us-east-1.amazonaws.com/course-assignment-c7:v${BUILD_NUMBER}
            '''
          }
        }

      }
    }
    stage('Deploy in App host') {
      steps {
        script {
          sh'''
          sudo docker pull
'''
}
environment {
    AWS_DEFAULT_REGION = 'us-east-1'
  }
 
  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
    disableConcurrentBuilds()
    timeout(time: 1, unit: 'HOURS')
  }
}
