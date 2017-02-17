#!/usr/bin/python
import sys

def binary_search(val, elements, start=0, end=0):
    if start > end:
        return None
    mid = (start + end)/ 2
    if val == elements[mid]:
        return (mid, val)
    if val < elements[mid]:
        return binary_search(val, elements, start, mid)
    else:
        return binary_search(val, elements, mid, end)

def selection_sort(elements):
    sorted_elements = []
    max_index = 0
    while(len(elements)!= len(sorted_elements)):
        for index in range(len(elements)):
            if elements[index] >= elements[max_index]:
                max_index = index
        sorted_elements.append(elements[max_index])
        elements[max_index] = sys.maxint* -1
    return sorted_elements[::-1]

if __name__ == "__main__":
    elements = list(reversed([5, 4, 3, 2, 1, 0, -6, -7, -8, -8, 9]))
    #print binary_search(-8, elements, 0, len(elements))
    elements = [x*x*x for x in elements]
    print selection_sort(elements)