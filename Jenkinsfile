pipeline {
    agent any 
    
    stages{
        stage("code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/paraspahwa/Ashtray-nodejs.git", branch: "main"        
            }
        }
        stage("build"){
            steps {
                echo "Buidling the image"
                sh "docker build -t ashtraygame ."
            }
        }
        stage("push to docker hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubpass",usernameVariable:"dockerHubUser")]){
                sh "docker tag ashtraygame ${env.dockerHubUser}/ashtraygame:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/ashtraygame:latest"
                }
            }
        }
        stage("deploy"){
            steps {
                echo "Deploying the container"
                sh "docker-compose down && docker-compose up -d"
            }
            
        }
    }
}
