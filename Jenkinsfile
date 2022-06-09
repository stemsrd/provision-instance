pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
    
        stage ("terraform init") {
            steps {
                sh ("/usr/local/bin/terraform init -reconfigure") 
            }
        }
        
        stage ("plan") {
            steps {
                sh ('/usr/local/bin/terraform plan') 
            }
        }

        stage (" Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('/usr/local/bin/terraform ${action} --auto-approve') 
           }
        }
    }
}
    
