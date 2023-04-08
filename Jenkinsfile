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
}

    stage('Build Docker Image') {
      parallel {
        stage('Build and Push Docker Image') {
          steps {
            sh 'cd test-nodeapp-1-task && sudo docker build . -t 412064873312.dkr.ecr.us-east-1.amazonaws.com/course-assignment-c7:v${BUILD_NUMBER}'
            sh 'sudo docker push 412064873312.dkr.ecr.us-east-1.amazonaws.com/course-assignment-c7:v${BUILD_NUMBER}'

          }
        }

      }
    }
}
