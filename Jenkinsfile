pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('python-web-app') // Add your Docker Hub credentials ID here
        GIT_CREDENTIALS = credentials('64d2a6a7-d04e-49f8-8027-120cdedfa1e3') // Add your GitHub credentials ID here
        DOCKER_IMAGE = "rosinebelle/python-web-app:v.0.0"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/s7rosine/DevopsEngineer-Projects.git', credentialsId: 'GIT_CREDENTIALS'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repository/docker/rosinebelle/python-web-app/general', 'DOCKER_HUB_CREDENTIALS') {
                        docker.image("${env.DOCKER_IMAGE}").push()
                    }
                }
            }
        }

        stage('Push to GitHub') {
            steps {
                script {
                    sh 'git add .'
                    sh 'git commit -m "Automated commit from Jenkins"'
                    sh 'git push origin main'
                }
            }
        }
    }
}

