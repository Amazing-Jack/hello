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
                    sh "docker build -t jack/hello:latest ."
               }
          }

          stage("Docker login") {
               steps {
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'Dockerhub-Credentials',
                               usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                         sh 'echo uname=$USERNAME pwd=$PASSWORD'
                         sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    }
               }
          }

          stage("Docker push") {
               steps {
                    sh "docker push jack/hello:latest"
               }
          }
     }
}