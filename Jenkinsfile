
pipeline {
    agent any

    environment {
        REGISTRY   = "localhost:5000"
        IMAGE_NAME = "student-demo-app"

        PYTHON = "C:\\Users\\STUDENT\\AppData\\Local\\Programs\\Python\\Python313\\python.exe"

        DOCKER = "C:\\Users\\STUDENT\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe"
    }

    stages {

        stage('1. Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('2. Application Build & Test') {
            steps {
                echo "Verifying Python syntax..."
                bat "\"${PYTHON}\" -m py_compile app.py"
            }
        }

        stage('3. Check Docker') {
            steps {
                bat "\"${DOCKER}\" --version"
                bat "\"${DOCKER}\" info"
            }
        }

        stage('4. Build & Tag Docker Image') {
            steps {
                echo "Building Docker image..."
                bat "\"${DOCKER}\" build -t ${REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER} -t ${REGISTRY}/${IMAGE_NAME}:latest ."
            }
        }

        stage('5. Push Image to Registry') {
            steps {
                echo "Pushing Docker images..."
                bat "\"${DOCKER}\" push ${REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER}"
                bat "\"${DOCKER}\" push ${REGISTRY}/${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        success {
            echo "Pipeline succeeded! Docker image ${REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER} created and pushed successfully."
        }

        failure {
            echo "Pipeline failed. Check the Jenkins console output."
        }
    }
}

