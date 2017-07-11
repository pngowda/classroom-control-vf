node {
    stage('checkout'){
    
    checkout scm    

   } 

    stage('build'){
    cleanWs()
    echo "build"
    bat returnStatus: true, script: 'C:\\myprojects\\test.bat'
    }
}
