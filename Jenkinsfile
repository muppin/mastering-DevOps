pipeline{
    agent any
    stages{
        stage("build"){
            steps{
                sh 'echo building the application'
                sh 'echo test'
                sh 'echo push'
                sh 'echo test2'
            }
        }
        stage("test"){
            steps{
                sh 'echo testing the application'
                
            }
        }
        stage("Run"){
            steps{
                sh 'echo running the application'
                
            }
        }
        stage("deploy"){
            steps{
                sh 'echo deploying the application'
                
            }
        }
    }
}
