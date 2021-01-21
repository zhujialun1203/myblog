pipeline {
  agent none
  stages {
    stage('Deploy') {
      agent any
      steps {
        echo 'Deploying'
        sh 'sudo ./deploy_jenkins.sh'
      }
    }
  }
}
