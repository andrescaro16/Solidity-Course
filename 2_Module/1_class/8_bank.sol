// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Bank {
    mapping(address => uint256) public balance;

    function safeMoney() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdrawal(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balance[msg.sender] >= amount, "Insufficient balance");
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    
    function contractBalance() public view returns (uint256) {
        return address(this).balance; // balance de todo el banco
    }
}