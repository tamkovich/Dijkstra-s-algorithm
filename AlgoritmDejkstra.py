def alg_dejkstra(mas, start, n):
    used_by_pin = [[0] * n for i in range(n)]
    visited = []
    c = []
    b = []
    # initialization
    for i in range(n):
        for j in range(n):
            used_by_pin[i][j] = 0 if mas[i][j] == 0 else 1
        visited.append(False)
        b.append(mas[start][i])
        c.append(None)
    x = start
    visited[x] = True
    flag = True
    print(b)
    print(c)
    print(visited)
    while flag:
        for i in range(n):
            if (mas[x][i] != 0)and(mas[x][i] < float('inf'))\
                    and(used_by_pin[x][i] == 1)and((c[i] is None)or((b[x]+mas[x][i]) < b[i])):
                c[i] = x
                b[i] = b[x] + mas[x][i]
                used_by_pin[x][i] = 0
                used_by_pin[i][x] = 0
        # print(c)
        # print(b)
        for i in range(n):
            if not visited[i] and(b[i] != 0):
                if flag:
                    mini = i
                    flag = False
                elif b[i] < b[mini]:
                    mini = i
        if not flag:
            if not visited[mini]:
                visited[mini] = True
                x = mini
            flag = True
        else:
            flag = False
    print(b)
    for i in range(n):
        if c[i] is not None:
            print('[', i+1, ']', end='')
            x = c[i]
            while x is not None:
                print('~[', x+1, ']', end='')
                x = c[x]
            print()


f = open('input.txt', 'r')
n = int(f.readline())
mas = [[0] * n for i in range(n)]
i = 0
# input
for line in f.read().split('\n'):
    j = 0
    for x in line.split(' '):
        if i == j:
            mas[i][j] = 0
        else:
            if x == '0':
                mas[i][j] = float('inf')
            else:
                mas[i][j] = int(x)
        j += 1
    i += 1
f.close()
print(mas)
start = int(input('Enter the peak of graph:'))
alg_dejkstra(mas, start, n)
