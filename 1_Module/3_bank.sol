// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Bank {
    mapping(address => uint) public map;
    uint public balance = 0;

    function deposit() public payable {
        address sender = msg.sender;
        uint value = msg.value;
        map[sender] = value;
    }

    function withdraw() public payable {
        address sender = msg.sender;
        uint value = msg.value;
        if (map[sender] >= value) {
            map[sender] = map[sender] - value;
        }
    }

    function viewBalance() public returns(uint) {
        address sender = msg.sender;
        balance = map[sender];
        return balance;
    }
}