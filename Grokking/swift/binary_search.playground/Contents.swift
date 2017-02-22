//: Playground - noun: a place where people can play

var myList = [1,2,3,5,8,13,21,34,55,89];

func binarySearch(list: Array<Int>, item: Int) -> Int? {
    var low = 0;
    var high = list.count - 1;
    var mid: Int;
    var guess: Int;
    while (low <= high) {
        mid = (low + high) / 2;
        guess = list[mid];
        if (guess == item) {
            return mid;
        } else if (guess > item) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
    return nil;
}

// Test for each item in the list.
for item in myList {
    print(binarySearch(list: myList, item: item)!);
}

// Test for an item not in the list.
binarySearch(list: myList, item: 4);

func recBinarySearch(ordered: ArraySlice<Int>, item: Int) -> Int? {
    let mid = ordered.count/2;
    let si = ordered.startIndex
    if (ordered[si+mid] == item) {
        return si+mid;
    } else if (ordered.count == 1) {
        return nil;
    } else if (item < ordered[si+mid]) {
        return recBinarySearch(ordered: ordered[si+0...si+mid-1], item: item);
    } else {
        return recBinarySearch(ordered: ordered[si+mid+1...si+ordered.count-1], item: item);
    }
}

func recBinarySearch(ordered: Array<Int>, item: Int) -> Int? {
    return recBinarySearch(ordered: ordered[0...ordered.count-1], item: item)
}

// Test for each item in the list
for item in myList {
    print(recBinarySearch(ordered: myList, item: item)!);
}

// Test for an item not in the list.
recBinarySearch(ordered: myList, item: 4);

func myFunction(addend x: Int) -> Int {
    return x+1
}
myFunction(addend: 5)