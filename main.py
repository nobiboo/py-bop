#!/usr/bin/python3

import os
import argparse
from time import sleep

def file_menu():
    menu = {
        '1':'.py',
        '2':'.sh',
    }

    while True:

        print("\nWelcome to Py Bop!\n\nHere are your options: ")
        print('1) Create a Python project')
        print('2) Create a Bash project')
        print('q) To quit the program')

        choice = input('\nSelection?: ')

        if choice == 'q':
            print('\nExiting..')
            break
        elif choice in menu:
            create_project(file_type=menu[choice])
        else:
            print('________________________________________')
            print('\nInvalid entry, please use a menu option\n')
            print('________________________________________')

def create_project(project_name=None,file_type='.py'):
    if project_name == None:
        project_name = input('Name of project?: ')
    main_file = f'main{file_type}'
    sandbox_file = f'sandbox{file_type}'
    py_shebang = '#!/usr/bin/python3\n'

    if not os.path.exists(project_name):
        os.mkdir(project_name)
        print(f'Creating {project_name}')

        with open(f'{project_name}/{main_file}','w') as f:
            f.write(f'{py_shebang}')
            f.close()

        with open(f'{project_name}/{sandbox_file}','w') as f:
            f.write(f'{py_shebang}')
            f.close()

        for file in os.listdir(project_name):
            os.chmod(f'{project_name}/{file}', 0o755)
        sleep(.5)
        print(f'Action completed:\n\t{project_name}/\n\t|--{main_file}\n\t|--{sandbox_file}  ')

    else:
        print('Directory already exists')

parser = argparse.ArgumentParser(usage='BoP(Bash or Python) [options]')
parser.add_argument('-p','--python',help='Specify Python ext followed by file name',required=False)
parser.add_argument('-b','--bash',help='Specify Bash ext followed by file name',required=False)
args = parser.parse_args()
py_project = args.python
sh_project = args.bash


if py_project:
    create_project(project_name=py_project)
elif sh_project:
    create_project(project_name=sh_project,file_type='.sh')
else:
    file_menu()

