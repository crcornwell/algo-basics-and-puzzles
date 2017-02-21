#!/usr/bin/python
from pprint import pprint

grid = []
grid_map = {
    "w1": (0, 0),
    "w2": (0, 2),
    "b1": (2, 0),
    "b2": (2, 2)
}
stack = []

def is_final_state():
    for x in [0,2]:
        if "b" not in grid[0][x]:
            return False
        if "w" not in grid[2][x]:
            return False
    return True

def is_initial_state():
    if grid_map["w1"] == (0, 0) and grid_map["w2"] == (0, 2) \
        and grid_map["b1"] == (2, 0) and grid_map["b2"] == (2, 2):
            return True
    return False

def get_valid_moves(x, y, size=3):
    positions = [((x+1)%size,(y+2)%size), ((x+2)%size,(y+1)%size)]
    valid_moves = []
    for px,py in positions:
        if grid[px][py] != "-":
            valid_moves.append((px, py))
    return valid_moves

def print_grid():
    print "   0   1   2"
    for x in range(len(grid)):
        print "%s "% x,
        for y in range(len(grid)):
            print "%s%s"% (grid[x][y], " "*(3 - len(grid[x][y]))),
        print 
    print "------------"
    pprint(stack)

def make_move(k, newx, newy, undo=False):
    x = grid_map[k][0]
    y = grid_map[k][1]
    if grid[newx][newy] == "-":
        grid[newx][newy] = k
        grid[x][y] = "-"
        grid_map[k] = (newx, newy)
        if not undo:
            stack.insert(0, "%s %s %s"%(k, x, y))
        return True
    else:
        print "Invalid Move"
        return False

def undo_move():
    move = stack.pop(0)
    s = move.split(" ")
    make_move(s[0], int(s[1]), int(s[2]), True)

def knights_problem():
    number = 0 
    while(1):
        print_grid()
        if is_final_state():
            break
        move = raw_input("Moves %s  :"% number)
        if move == "u" and stack:
            undo_move()
            number -= 1
        else:
            s = move.split(" ")
            make_move(s[0], int(s[1]), int(s[2]))
            number += 1
    return number

if __name__ == "__main__":
    grid = [["-" for x in range(3)] for y in range(3)] 
    for k, pos in grid_map.items():
        grid[pos[0]][pos[1]] = k
    print knights_problem()