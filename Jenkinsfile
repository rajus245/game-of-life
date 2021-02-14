pipeline {
   agent any

   environment {
     // set the following environment variables
     // ORGANIZATION_NAME
     // YOUR_DOCKERHUB_USERNAME
     ECR_URI = "279596518738.dkr.ecr.us-east-1.amazonaws.com/expressapp_registry"
     
     SERVICE_NAME = "gameoflife-webapp"
     REPOSITORY_TAG="${ECR_URI}/${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      
      stage('Build') {
         steps {
            sh 'mvn clean package'
         }
      }

      stage('archiving artifacts and publish test results') {
          steps {
              archive 'target/*.war'
              junit 'target/surefire-reports/*.xml'
          }
      }

      stage('Build and Push Image') {
         steps {
            sh 'sudo docker image build -t ${REPOSITORY_TAG} .'
            sh 'sudo docker push ${REPOSITORY_TAG}'
         }
      }
   }
}