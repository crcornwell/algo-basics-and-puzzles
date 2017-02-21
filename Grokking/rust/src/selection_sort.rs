//! Selection sort is a simple quadratic sorting algorithm

/// The selection_sort function accepts a vector and returns the sorted
/// equivalent!
///
/// #Example
/// ```
/// use grokking::selection_sort::*;
///
/// let a = vec![1,5,2,8,6,10,3];
/// let sorted_a = selection_sort(&a);
/// assert_eq!(sorted_a, [1,2,3,5,6,8,10]);
/// ```

pub fn selection_sort<T: PartialOrd>(collection: &Vec<T>) -> Vec<T> {
    let sorted = Vec::new();
    let original = collection.clone();
    while original.length() > 0 {

    }
    sorted
}

fn find_smallest<T: PartialOrd>(collection: &Vec<T>) -> &T {
   collection
       .iter()
       .fold(&collection[0], |smallest, element| if smallest < element { smallest } else { element })
}

#[cfg(test)]
mod tests {
    use super::selection_sort;

    #[test]
    fn sorts_numbers() {
        let a = vec![7,6,5,4,3,2,1];
        let sorted_a = selection_sort(&a);
        assert_eq!(sorted_a, vec![1,2,3,4,5,6,7]);
    }

    #[test]
    fn sorts_chars() {
        let a = vec!['e', 'd', 'c', 'a', 'b'];
        let sorted_a = selection_sort(&a);
        assert_eq!(sorted_a, vec!['a','b','c','d','e']);
    }
}
