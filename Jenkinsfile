pipeline {
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
}
```

## Step 12: Build the Project in Eclipse

1. Right-click on project → **Run As** → **Maven build...**
2. Goals: `clean package`
3. Click **Run**

Check the **Console** tab for build output. If successful, you'll see:
```
BUILD SUCCESS