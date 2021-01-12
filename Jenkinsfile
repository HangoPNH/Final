pipeline {
    agent none
	
    environment {
        PASS = credentials('123qwezxc.')
    }
	
    parameters {
        choice(
            choices: ['nodejs' , 'python', 'all'],
            description: '',
            name: 'CHOICE')
    }

    stages {
        
        stage ('build-nodejs') {
            agent {label 'master'}
            when {
                expression { params.CHOICE == 'nodejs' }
            }
            steps {
                echo "Building app nodejs!"
                sh './nodejs/build.sh'
            }
        }
		
		stage ('build-python') {
			agent {label 'master'}
			when {
				expression { params.CHOICE == 'python' }
			}
			steps {
				echo "Building app python!"
				sh './python/build.sh'
			}
		}
		
		stage ('build-all') {
            agent {label 'master'}
            when {
                expression { params.CHOICE == 'all' }
            }
            steps {
                echo "Building app all!"
                sh '''
                ./nodejs/build.sh
				./python/build.sh
                '''
            }
        }
		
		stage ('push-nodejs') {
		    agent {label 'master'}
            when {
                expression { params.CHOICE == 'nodejs' }
            }
            steps {
                echo "Pushing nodejs container image!"
                sh './nodejs/push.sh'
            }
        }
		
		stage ('push-python') {
		    agent {label 'master'}
            when {
                expression { params.CHOICE == 'python' }
            }
            steps {
                echo "Pushing python container image!"
                sh './python/push.sh'
            }
        }
		
		stage ('push-all') {
		    agent {label 'master'}
            when {
                expression { params.CHOICE == 'all' }
            }
            steps {
                echo "Pushing all container image!"
                sh '''
                ./nodejs/push.sh
				./python/Push.sh
                '''
            }
        }
		
		stage ('deploy-nodejs') {
		    agent {label 'node2'}
            when {
                expression { params.CHOICE == 'nodejs' }
            }
            steps {
                echo "Deploy nodejs container image!"
                sh './nodejs/deploy.sh'
            }
        }
		
	stage ('deploy-python') {
		    agent {label 'node2'}
            when {
                expression { params.CHOICE == 'python' }
            }
            steps {
                echo "Deploy python container image!"
                sh './python/deploy.sh'
            }
        }
		
	stage ('deploy-all') {
		    agent {label 'node2'}
            when {
                expression { params.CHOICE == 'all' }
            }
            steps {
                echo "Deploy all container image!"
                sh '''
                ./nodejs/deploy.sh
				./python/deploy.sh
                '''
            }
        }
    }
}
