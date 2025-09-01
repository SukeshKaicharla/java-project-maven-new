pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "hotstarimg"
        CONTAINER_NAME = "hotstarcont"
    }

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
                    docker build -t hotstarcont:v1 -f /var/lib/jenkins/workspace/hotstar/Dockerfile /var/lib/jenkins/workspace/hotstar
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f hotstarcont || true
                    docker run -itd --name hotstar -p 6320:8080 hotstar:v1
                '''
            }
        }
    }
}
