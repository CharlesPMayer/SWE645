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
					sh 'jar -cvf Mayer-HW2-P2.war -C Mayer-HW1-P2/WebContent/ .'
					sh "docker login -u abulh4298 -p swe645-group1? 2> /dev/null"
					//def customImage = docker.build("abulh4298/mayersurvey645:0.2")
					sh 'docker build --tag mayersurvey645:0.3 .'
					sh 'docker tag mayersurvey645:0.3 abulh4298/mayersurvey645:0.3'
				}
			}
		}
		stage("pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push abulh4298/mayersurvey645:0.3'
				}
			}
		}
		//stage("Deploying to Rancher as single pod") {
		//	steps {
				//sh 'kubectl set image deployment/mayersurvey-pipeline mayersurvey-pipeline=abulh4298/mayersurvey645:0.1 -n jenkins-pipeline'
		//		sh 'kubectl create deployment swe645 --image=docker.io/abulh4298/mayersurvey645:latest'
		//	}
		//}
		//stage("Deploying to Rancher as with load balencer") {
		//	steps {
		//		sh 'kubectl set image deployment/ss-port ss-port=abulh4298/mayersurvey645:0.1 -n jenkins-pipeline'
		//	}
		//}
	}
}
