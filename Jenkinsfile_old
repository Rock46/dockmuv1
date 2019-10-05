pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
   
	}
        stage('Push') {
			docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {

			def customImage = docker.build("linuxrakesh/dockmvn")

        /* Push the container to the custom Registry */
			customImage.push()
        }
	 }   
}
