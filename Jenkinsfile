pipeline {
   agent any

   environment {
     // set the following environment variables
     // ORGANIZATION_NAME
     // YOUR_DOCKERHUB_USERNAME
     ECR_URI = "279596518738.dkr.ecr.us-east-1.amazonaws.com"
     SERVICE_NAME = "expressapp_registry"
     REPOSITORY_TAG="${ECR_URI}/${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      
      stage('Build') {
         steps {
            sh 'mvn clean package'
         }
      }

      stage('Build and Push Image') {
         steps {
            sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 279596518738.dkr.ecr.us-east-1.amazonaws.com'
            sh 'sudo docker image build -t ${REPOSITORY_TAG} .'
            sh 'sudo docker push ${REPOSITORY_TAG}'
         }
      }
   }
}