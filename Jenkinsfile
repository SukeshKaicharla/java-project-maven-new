pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/SukeshKaicharla/java-project-maven-new.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker rmi -f hotstarimg:v1 || true
                    docker build -t hotstarimg:v1 -f /var/lib/jenkins/workspace/hotstar/Dockerfile /var/lib/jenkins/workspace/hotstar
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f hotstarcont || true
                    docker run -itd --name hotstarcont -p 6320:8080 hotstarimg:v1
                '''
            }
        }
    }
}
