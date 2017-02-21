//: Playground - noun: a place where people can play

var myList = [1,2,3,5,8,13,21,34,55,89];

func binarySearch(list: Array<Int>, item: Int) -> Int? {
    let middleIndex = list.count / 2;
    if ((list.count == 1) && (list[0] != item)) {
        return nil;
    }
    if (list[middleIndex] == item) {
        return middleIndex;
    } else if (list[middleIndex] > item) {
        let firstHalf = Array(list.prefix(middleIndex));
        return binarySearch(list: firstHalf, item: item);
    } else {
        let secondHalf = Array(list.suffix(list.count - middleIndex));
        let recurse = binarySearch(list: secondHalf, item: item);
        if (recurse != nil) {
            return recurse! + middleIndex;
        } else {
            return nil;
        }
    }
}

// Test for each item in the list.
for item in myList {
    print(binarySearch(list: myList, item: item)!);
}

// Test for an item not in the list.
binarySearch(list: myList, item: 4);