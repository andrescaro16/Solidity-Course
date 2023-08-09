// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyModifier {
    string private myText; 
    address public owner; 
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    function setText(string memory _myText) external onlyOwner {
        myText = _myText;
    }

    function getText() external view returns (string memory) {
        return myText;
    }     
}