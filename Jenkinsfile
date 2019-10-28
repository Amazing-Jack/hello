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
                    def artServer  Artifactory.server('Local-Artifactory')
                    artServer.credentialsId='Artifactory-Credentials'
                    def artDocker= Artifactory.docker server: artServer
                    def tagName="jack/hello:${BUILD_TIMESTAMP}"
                    def buildInfo = Artifactory.newBuildInfo()
                    sh 'pwd'
                    sh 'ls -al'
                    sh 'cat Dockerfile'
                    docker.build(tagName)
                    buildInfo.env.vars['status2'] = 'pre-test'
                    artDocker.push(tagName, 'docker-dev-local2', buildInfo)
               }
          }
     }
}