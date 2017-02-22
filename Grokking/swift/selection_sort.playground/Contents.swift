var fibonacci = [144,1,55,8,13,3,2,34,5,21,89];

func findSmallest(items: Array<Int>) -> Int {
    var smallest = items[0];
    var smallestIndex = 0;
    for i in 0...items.count-1 {
        if items[i] < smallest {
            smallest = items[i];
            smallestIndex = i;
        }
    }
    return smallestIndex;
}

func selectionSort(unordered: Array<Int>) -> Array<Int> {
    var newArr = Array<Int>();
    var unorderedCopy = unordered;
    while (unorderedCopy.count > 0) {
        let smallestIndex = findSmallest(items: unorderedCopy);
        newArr.append(unorderedCopy[smallestIndex]);
        unorderedCopy.remove(at: smallestIndex);
    }
    return newArr;
}

selectionSort(unordered: fibonacci);

var mySlice = fibonacci[0...5];

func sliceFunction(s: ArraySlice<Int>) -> Int {
    return s.count;
}

func sliceFunction(s: Array<Int>) -> Int {
    return sliceFunction(s: s[0...s.count-1]);
}