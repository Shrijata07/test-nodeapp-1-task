
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
            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 412064873312.dkr.ecr.us-east-1.amazonaws.com
            sudo docker build . -t 412064873312.dkr.ecr.us-east-1.amazonaws.com/course-assignment-c7:v${BUILD_NUMBER}
            sudo docker push 412064873312.dkr.ecr.us-east-1.amazonaws.com/course-assignment-c7:v${BUILD_NUMBER}
            '''
          }
        }

      }
    }
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
