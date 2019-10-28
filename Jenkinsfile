pipeline {
     agent any

     stages {
          stage("Checkout") {
               steps {
                    git url: 'https://github.com/Amazing-Jack/hello.git'
               }
          }

          stage("Compile") {
               steps {
                    sh "./mvnw compile"
               }
          }

          stage("Unit test") {
               steps {
                    sh "./mvnw test"
               }
          }
          
          stage("Package") {
               steps {
                    sh "./mvnw package"
               }
          }

          stage("Docker build") {
               steps {
                    sh "docker build -t jack/hello:${BUILD_TIMESTAMP} ."
               }
          }

          stage("Docker push") {
               steps {
                    docker.withRegistry('http://localhost:8081/artifactory/repository/local/docker-dev-local2/', 'Artifactory-Credentials') {

                         def helloImage = docker.build("jack/hello:${BUILD_TIMESTAMP}")

                         /* Push the container to the custom Registry */
                         helloImage.push()
                    }
               }
          }
     }
}