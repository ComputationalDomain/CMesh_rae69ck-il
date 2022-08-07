import numpy as np

data = np.loadtxt('airfoil.dat', skiprows=3)

top = data[1:len(data)//2-1]
bottom = data[len(data)//2:]

top = np.flip(top, axis=0)



file = open('airfoil.geo', 'w')

for i in range(len(top)):

    point = 'Point(' + str(i+1) + ') = '
    coords = '{' + str(top[i][0]) + ', ' + str(top[i][1]) + ', ' + '0};' + '\n'

    file.write(point+coords)

for i in range(len(bottom)):

    point = 'Point(' + str(i+1+len(top)) + ') = '
    coords = '{' + str(bottom[i][0]) + ', ' + str(bottom[i][1]) + ', ' + '0};' + '\n'

    file.write(point+coords)

Line = 'Line(1) = {'

for i in range(len(top) + len(bottom)):
    if not(i == len(top) + len(bottom) - 1):
        Line = Line + str(i+1) + ', '
    else:
        Line = Line + str(i+1) + ', 1};'

file.write(Line)
file.close()
    
