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
