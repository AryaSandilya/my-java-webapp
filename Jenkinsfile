pipeline {
    agent any

    environment {
        EC2_USER       = 'ubuntu'
        EC2_HOST       = '100.55.11.32'
        WAR_NAME       = 'my-java-webapp.war'
        APP_CONTEXT    = 'my-java-webapp'
        TOMCAT_WEBAPPS = '/var/lib/tomcat10/webapps'
        PEM_FILE       = 'C:\\jenkins-keys\\jenkinsKeyPair.pem'
    }

    tools {
        maven 'Maven'
    }

    stages {

        stage('Checkout') {
            steps {
                echo '📥 Checking out source code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo '🔨 Building Maven WAR...'
                bat 'mvn clean package -DskipTests'
                echo 'Build complete!'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                bat 'mvn test'
            }
        }

        stage('Deploy to EC2') {
            steps {
                echo '🚀 Deploying WAR to Tomcat on EC2...'

                bat """
                    scp -o StrictHostKeyChecking=no -i "${PEM_FILE}" target\\${WAR_NAME} ${EC2_USER}@${EC2_HOST}:/home/${EC2_USER}/${WAR_NAME}
                """

                bat """
                    ssh -o StrictHostKeyChecking=no -i "${PEM_FILE}" ${EC2_USER}@${EC2_HOST} "sudo cp /home/${EC2_USER}/${WAR_NAME} ${TOMCAT_WEBAPPS}/${WAR_NAME} && sudo systemctl restart tomcat10 && echo Tomcat restarted!"
                """
            }
        }

        stage('Verify') {
            steps {
                echo '✅ Verifying deployment...'
                bat """
                    ssh -o StrictHostKeyChecking=no -i "${PEM_FILE}" ${EC2_USER}@${EC2_HOST} "sleep 5 && sudo systemctl is-active tomcat10 && echo App is running!"
                """
            }
        }
    }

    post {
        success {
            echo """
====================================
 BUILD SUCCEEDED
 App live at: http://${EC2_HOST}:8080/${APP_CONTEXT}
====================================
"""
        }
        failure {
            echo """
====================================
 BUILD FAILED
 Check logs above for errors.
====================================
"""
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}

/*pipeline {
    agent any
    
    tools {
        maven 'Maven-3.9'
        jdk 'JDK-17'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                echo 'Packaging WAR file...'
                sh 'mvn package'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying to Tomcat...'
                sh 'cp target/my-java-webapp.war /opt/tomcat/webapps/'
            }
        }
    }
    
    post {
        success {
            echo 'Build successful!'
            archiveArtifacts artifacts: 'target/*.war'
        }
        failure {
            echo 'Build failed!'
        }
    }
}*/


