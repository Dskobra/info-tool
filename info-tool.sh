#! /usr/bin/bash

temp=""
os_id=""
os_version=""

gcc_found=""
gcc_version=""


getOSDetails(){
    source /etc/os-release
    echo "-----OS INFO-----" >> log.txt
    echo "====================" >> log.txt
    echo "|OS NAME: " $ID >> log.txt
    echo "|VERSION: " $VERSION  >> log.txt
    echo "|Pretty Name: " $PRETTY_NAME >> log.txt
    echo "====================" >> log.txt
    

}

getGCCInfo(){
    test -f /usr/bin/gcc && gcc_found="Found GCC"

    if [ -z "$gcc_found" ]
    then
        gcc_found="GCC not installed/found"
        echo "GCC not found"
        echo $gcc_found >> log.txt
    else
        gcc --version >> gcc.log
        gcc_version=$(grep "(GCC)" gcc.log)

        
        echo "" >> log.txt
        echo "" >> log.txt
        echo "" >> log.txt
        echo "-----Toolchains-----" >> log.txt
        echo "====================" >> log.txt
        echo $gcc_version >> log.txt
        rm gcc.log
    fi

}

getGPPInfo(){
    test -f /usr/bin/g++ && gpp_found="Found G++"

    if [ -z "$gpp_found" ]
    then
        gpp_found="G++ not installed/found"
        echo "G++ not found"
        echo $gpp_found >> log.txt
    else
        g++ --version >> gpp.log
        gpp_version=$(grep "(GCC)" gpp.log)
        echo $gpp_version >> log.txt
        rm gpp.log
    fi

}

getGDBInfo(){
    test -f /usr/bin/gdb && gdb_found="Found GDB"

    if [ -z "$gdb_found" ]
    then
        gdb_found="GDB not installed/found"
        echo "GDB not found"
        echo $gdb_found >> log.txt
    else
        gdb --version >> gdb.log
        gdb_version=$(grep "(GDB)" gdb.log)
        echo $gdb_version >> log.txt
        rm gdb.log
    fi

}

getJDKInfo(){
    test -f /usr/bin/java && openjdk_found="Found openJDK"

    if [ -z "$openjdk_found" ]
    then
        openjdk_found="OpenJDK not installed/found"
        echo "OpenJDK not found"
        echo $openjdk_found >> log.txt
    else
        java --version >> log.txt
    fi

    echo "====================" >> log.txt
}

getBrowserInfo(){
        echo "" >> log.txt
        echo "" >> log.txt
        echo "" >> log.txt
        echo "-----Browsers-----" >> log.txt
        echo "====================" >> log.txt

        test -f /usr/bin/firefox && firefox_found="Found Firefox"
        if [ -z "$firefox_found" ]
        then
            firefox_found="Mozilla Firefox not installed/found"
            echo "Mozilla Firefox not found"
            echo $firefox_found >> log.txt
        else
            firefox --version >> log.txt
        fi

        test -f /usr/bin/brave-browser && brave_found="Found Brave"
        if [ -z "$brave_found" ]
        then
            brave_found="Brave Browser not installed/found"
            echo "Brave Browser not found"
            echo $brave_found >> log.txt
        else
            brave-browser --version >> log.txt
        fi
}
rm log.txt
getOSDetails
getGCCInfo
getGPPInfo
getGDBInfo
getJDKInfo
getBrowserInfo
cat log.txt