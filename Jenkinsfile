node {
    stage('checkout'){
    
    checkout scm    
    /*
    checkout([$class: 'GitSCM', branches: [[name: '*/production']], 
    doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], 
    userRemoteConfigs: [[credentialsId: '496f982a-5eab-4af1-88df-a73d01d3c654', 
    url: 'https://github.com/prajwaln22/classroom-control-vf.git']]])
    */
   } 

    stage('build'){
    cleanWs()
    echo "build"
    bat returnStatus: true, script: 'C:\\myprojects\\test.bat'
    }
}
