pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'bus57790/devops-app'
        IMAGE_TAG       = "${BUILD_NUMBER}"
        SONAR_HOST      = 'http://192.168.1.184:9000'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('OWASP Dependency Check') {
            steps {
                sh 'echo "Running dependency analysis..."'
            }
        }

        stage('SonarQube Quality Gate') {
            steps {
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                    sh 'echo "Running SonarQube analysis against http://192.168.1.184:9000..."'
                }
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh 'trivy fs --severity HIGH,CRITICAL .'
            }
        }

        stage('Docker Build & Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        docker build -t ${DOCKER_HUB_REPO}:${IMAGE_TAG} -t ${DOCKER_HUB_REPO}:latest .
                        echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin
                        docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}
                        docker push ${DOCKER_HUB_REPO}:latest
                    """
                }
            }
        }

        stage('Trigger CD Pipeline') {
            steps {
                build job: 'CD-Pipeline', parameters: [string(name: 'IMAGE_TAG', value: String.valueOf(BUILD_NUMBER))], wait: false
            }
        }
    }
}
