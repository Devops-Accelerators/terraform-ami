node {

stage('Preparation') {
      git 'https://github.com/Devops-Accelerators/terraform-ami.git'
   }
    stage('Preparation'){
      sh "chmod u+x *.sh"
    }
  stage('Jenkins'){
      sh "./jenkins.sh"
  }

  stage('JFrog'){
      sh "./jfrog.sh"
  }

  stage('Locust'){
      sh "./locust.sh"
  }

  stage('Selenium'){
      sh "./selenium.sh"
  }

  stage('Tomcat'){
      sh "sh tomcat.sh"
  }

}
 
