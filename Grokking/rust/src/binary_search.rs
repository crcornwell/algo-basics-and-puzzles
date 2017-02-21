//! The binary_search module implements a binary search algorithm
//!
//! # Examples
//!
//! ```
//! let a = [1,2,3,4];
//! let x = grokking::binary_search::bin_search(&a, 1);
//! assert_eq!(x, Some(0))
//! ```

/// The bin_search function accepts an array slice and element of any type that
/// implements the PartialOrd trait, and returns either `Some(x)` where x is the
/// index at which the element appears in the list, or `None` if it is not found.
///
/// # Examples
///
/// ```
/// use grokking::binary_search::*;
///
/// let a = ['a','b','x','y','z'];
/// let x = bin_search(&a, 'd');
/// assert_eq!(x, None)
/// ```

pub fn bin_search<T: PartialOrd>(list: &[T], element: T) -> Option<usize> {
    bin_search_inner(list, element, 0, list.len() - 1)
}

fn bin_search_inner<T: PartialOrd>(list: &[T], element: T, lo: usize, hi: usize) -> Option<usize> {
    let mid = (hi + lo) / 2;
    if lo > hi {
        None
    } else if list[mid] == element {
        Some(mid)
    } else if list[mid] < element {
        bin_search_inner(list, element, mid + 1, hi)
    } else {
        bin_search_inner(list, element, lo, mid - 1)
    }
    
    //match list {
        //list if lo > hi => None,
        //list if list[mid] == element => Some(mid),
        //list if list[mid] < element => bin_search_inner(list, element, mid+1, hi),
        //list if list[mid] > element => bin_search_inner(list, element, lo, mid-1),
        //_ => None
    //}
}

#[cfg(test)]
mod tests {
    use super::bin_search;

    #[test]
    fn binary_search_chars() {
        let a = ['a','b','c','d','e'];
        let x = bin_search(&a, 'e');
        assert_eq!(x, Some(4))
    }

    #[test]
    fn binary_search_numbers() {
        let a = [1,2,3,10,24];
        let x = bin_search(&a, 10);
        assert_eq!(x, Some(3))
    }

    #[test]
    fn binary_search_not_found() {
        let a = [1,2,3];
        let x = bin_search(&a, 4);
        assert_eq!(x, None)
    }
}
