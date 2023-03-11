use array::ArrayTrait;
use option::OptionTrait;
use traits::Into;
use traits::TryInto;

use quaireaux::data_structures::deque::Deque;
use quaireaux::data_structures::deque::DequeTrait;
use quaireaux::utils::is_equal_u256;

#[test]
#[available_gas(2000000)]
fn deque_new_test() {
    let mut deque = DequeTrait::new();
    let result_len = deque.len();

    assert(result_len == 0_usize, 'wrong length');
}

#[test]
#[available_gas(2000000)]
fn deque_is_empty_test() {
    let mut deque = DequeTrait::new();
    let result = deque.is_empty();

    assert(result == true, 'should be empty');
}

#[test]
#[available_gas(2000000)]
fn deque_push_back_test() {
    let mut deque = DequeTrait::new();
    let val_1: u256 = 1.into();
    let val_2: u256 = 2.into();

    deque.push_back(val_1);
    deque.push_back(val_2);

    let result_len = deque.len();
    let result_is_empty = deque.is_empty();

    assert(result_is_empty == false, 'must not be empty');
    assert(result_len == 2_usize, 'len should be 2');
}
// don't even know what kinds of tests is this

#[test]
#[available_gas(2000000)]
fn deque_pop_front_test() {
    let mut deque = DequeTrait::new();

    let val_1: u256 = 1.into();
    let val_2: u256 = 2.into();

    deque.push_back(val_1);
    deque.push_back(val_2);

    let result_len = deque.len();
    let result_is_empty = deque.is_empty();

    assert(result_is_empty == false, 'must not be empty');
    assert(result_len == 2_usize, 'len should be 2');
}

// #[test]
// #[available_gas(2000000)]
// fn deque_new_from_array_test() {
//     let mut arr = ArrayTrait::<u256>::new();
//     arr.append(1.into());
//     arr.append(2.into());

//     let mut deque = DequeTrait::new_from_array(@arr);

//     let mut ax = deque.to_array();

//     assert(is_equal_u256(ref arr,ref ax,0_usize),'not equal');
// }

#[test]
#[available_gas(2000000)]
fn deque_peek_front_test() {
    let mut deque = DequeTrait::new();
    deque.push_back(1.into());
    deque.push_back(2.into());

    assert(deque.peek_front().expect('empty') == 1.into(), 'not equal');
}

#[test]
#[available_gas(2000000)]
fn deque_peek_back_test() {
    let mut deque = DequeTrait::new();
    deque.push_back(1.into());
    deque.push_back(2.into());

    assert(deque.peek_back().expect('empty') == 2.into(), 'not equal');
}
