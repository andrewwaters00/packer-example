#!/usr/bin/groovy

buildfile="firstrun.json"

node('any') {

  stage('Create Packer AMI') {
        steps {
          withCredentials([
            usernamePassword(credentialsId: 'AWS', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
          ]) {
            sh 'packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} ${buildfile}'
        }
      }
     }

stage('AWS Deployment') {
      steps {
          withCredentials([
            usernamePassword(credentialsId: 'AWS', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
            usernamePassword(credentialsId: 'github_account', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
          ]) {
            sh 'git clone https://github.com/andrewwaters00/packer-terraform.git'
            sh '''
               cd packer-terraform
               terraform init
               terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
               git add terraform.tfstate
               git -c user.name="andrewwaters00" -c user.email="andrew.waters00@googlemail.com" commit -m "terraform state update from Jenkins"
               git push https://${REPO_USER}:${REPO_PASS}@github.com/andrewwaters00/packer-terraform.git master
            '''
        }
      }
    }
  }
 
              



