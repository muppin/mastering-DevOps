pipeline {
    agent any
    stages{
        stage ('Code Clone') {
            steps {
                git url : 'https://github.com/Vasishtha15/Docker-Zero-to-Hero.git/' , branch : 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Building the Docker image
                    def dockerImage = docker.build('ayu1503/my-app:latest', '/examples/python-web-app/')
                    dockerImage.inside {
                        // Execute commands inside the Docker container if needed
                        sh 'echo "Running commands inside the Docker container"'
                    }
                }
            }
        }
        stage ('Push to Docker Hub') {
            steps {
                echo "Pushing the image to Docker Hub"
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPass', usernameVariable: 'dockerHubUser')])
                sh "docker login -u ${env.dockerHubUser} -p {env.dockerHubPass}"
            }
        }
        stage ('Testing') {
            steps {
                echo 'testing'
            }
        }
        stage ('Deploy') {
            steps {
                sh 'docker run -d -p 8000:8000 node-todo-cicd:latest'
            }
        }
    }
}
