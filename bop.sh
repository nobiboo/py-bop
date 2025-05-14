#!/bin/bash

create_python() {

    echo ""
    local python_project="$1"
    if [ $# -eq 0 ];then
        read -p "Name of project? [no spaces]: " python_project
    fi
    echo "Creating $python_project..."
    sleep 0.25
    echo "This is working..."
    mkdir "$python_project"
    touch "$python_project"/main.py 
    touch "$python_project"/sandbox.py
    chmod +x "$python_project"/main.py "$python_project"/sandbox.py
    echo '#!/usr/bin/python3' >> "$python_project"/main.py && echo '#!/usr/bin/python3' >> "$python_project"/sandbox.py
    sleep 0.25
    echo "Command complete."
    echo ""
}

create_bash() {

    local bash_project="$1"
    echo ""
    if [ $# -eq 0 ];then
        read -p "Name of project? [no spaces]: " bash_project
    fi
    echo "Creating $bash_project..."
    sleep 0.25
    echo "This is working..."
    mkdir "$bash_project"
    touch "$bash_project"/"$bash_project".sh 
    touch "$bash_project"/sandbox.sh
    chmod +x "$bash_project"/"$bash_project".sh "$bash_project"/sandbox.sh
    echo '#!/bin/bash' >> "$bash_project"/"$bash_project".sh && echo '#!/bin/bash' >> "$bash_project"/sandbox.sh
    sleep 0.25
    echo "Command complete."
    echo ""
}

if [ $# -eq 0 ]; then
    while true;do

        echo "p) To create a python file"
        echo "b) To create a bash file"
        echo "e) Or 'exit' to exit"

        read -p "Please enter your selection: " create_file

        case "$create_file" in

            p) create_python
            ;;

            b) create_bash
            ;;
            e | exit) exit
            ;;
            ?) echo "Invalid entry"
        esac
    done
fi



while getopts "b:p:" opt; do

    case "$opt" in
        p) echo "Creating Python project.."
        create_python "$OPTARG"
        ;;

        b) echo "Creating Bash project.."
        create_bash "$OPTARG"
        ;;


    esac
done