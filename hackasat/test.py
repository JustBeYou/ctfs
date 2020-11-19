from os import system

for i in range(1, 120):
    print (f'--------- {i} ---------')
    system(f'python goodplan.py {i}')
    print ('------------------------\n\n\n\n')
