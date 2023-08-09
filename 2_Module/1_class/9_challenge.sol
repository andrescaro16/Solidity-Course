// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Bank {

    struct Account{
        uint256 funds;
        uint256 date;
    }

    mapping(address => Account) public balance;

    function saveMoney() public payable {
        require(balance[msg.sender].funds == 0, "You have already saved money");
        balance[msg.sender].funds += msg.value;
        balance[msg.sender].date = block.timestamp;
    }

    function withdrawal(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balance[msg.sender].funds >= amount, "Insufficient balance");
        require(block.timestamp >= (balance[msg.sender].date + 31554000), "A year has not passed");
        balance[msg.sender].funds -= amount;
        payable(msg.sender).transfer(amount);
    }
    
    function contractBalance() public view returns (uint256) {
        return address(this).balance; // balance de todo el banco
    }
}