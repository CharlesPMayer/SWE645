pipeline {
	agent any
	environment {
			DOCKERHUB_PASS = credentials('dockerhub')
	}
	stages {
		stage("Building the Student Survery Image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf Mayer-HW2-P2.war -C WebContent/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh "docker login -u abulh4298 -p ${DOCKERHUB_PASS}"
					def customImage = docker.build("abulh4298/mayersurvey645:${BUILD_TIMESTAMP}")
				}
			}
		}
		stage("pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push abulh4298/mayersurvey645:${BUILD_TIMESTAMP}
				}
			}
		}
		stage("Deploying to Rancher as single pod") {
			steps {
				sh 'kubectl set image deployment/mayersurvey-pipeline mayersurvey-pipeline=abulh4298/mayersurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
			}
		}
		stage("Deploying to Rancher as with load balencer") {
			steps {
				sh 'kubectl set image deployment/ss-port ss-port=abulh4298/mayersurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
			}
		}
	}
}
