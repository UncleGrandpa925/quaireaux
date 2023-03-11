// Core lib imports
use array::ArrayTrait;
use option::OptionTrait;
use quaireaux::utils::array_slice;
use quaireaux::utils::array_clone;

const ZERO_USIZE: usize = 0_usize;

#[derive(Drop)]
struct Deque {
    elements: Array::<u256>,
}

trait DequeTrait {
    fn new() -> Deque;
    fn new_from_array(input: @Array::<u256>) -> Deque;
    fn push_back(ref self: Deque, value: u256);
    // fn push_front(ref self: Deque, value: u256);
    // fn pop_back(ref self: Deque) -> Option::<u256>;
    fn pop_front(ref self: Deque) -> Option::<u256>;
    fn peek_front(self: @Deque) -> Option::<u256>;
    fn peek_back(self: @Deque) -> Option::<u256>;
    fn len(self: @Deque) -> usize;
    fn is_empty(self: @Deque) -> bool;
    fn to_array(self: @Deque) -> Array::<u256>;
}

impl DequeImpl of DequeTrait {
    fn new() -> Deque {
        deque_new()
    }

    fn new_from_array(input: @Array::<u256>) -> Deque {
        deque_new_from_array(input)
    }

    fn push_back(ref self: Deque, value: u256){
        let mut elements = self.elements;
        elements.append(value);
        self = Deque { elements }
    }

    fn pop_front(ref self: Deque) -> Option::<u256> {
        let mut elements = self.elements;
        let front = elements.pop_front();
        self = Deque { elements };
        front
    }

    // fn pop_back(ref self: Deque) -> Option::<u256> {
    //     let mut elements = array_clone(@self.elements);

    //     if (elements.len() == 0_usize) {
    //         return Option::None(());
    //     }

    //     let back = elements.at(elements.len() - 1_usize);

    //     elements = array_slice(@elements, 0_usize, elements.len() - 1_usize);
    //     self = Deque { elements };

    //     Option::Some(*back)
    // }

    fn peek_front(self: @Deque) -> Option::<u256> {
        if (self.is_empty()) {
            return Option::None(());
        }
        Option::Some(*self.elements.at(0_usize))
    }

    fn peek_back(self: @Deque) -> Option::<u256> {
        if (self.is_empty()) {
            return Option::None(());
        }
        Option::Some(*self.elements.at(self.elements.len() - 1_usize))
    }

    fn len(self: @Deque) -> usize {
        self.elements.len()
    }

    fn is_empty(self: @Deque) -> bool{
        self.len() == ZERO_USIZE
    }

    fn to_array(self: @Deque) -> Array::<u256> {
        array_clone(self.elements)
    }
}

fn deque_new() -> Deque{
    let mut arr = ArrayTrait::<u256>::new();
    Deque { elements: arr }
}

fn deque_new_from_array(input: @Array::<u256>) -> Deque{
    let mut arr = ArrayTrait::<u256>::new();
    let new_elements = array_clone(input);
    Deque { elements: new_elements }
}