// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyEvent {
    string private myText;
    address private owner;

    constructor () {
        owner = msg.sender;
    }

    event InfoChange(string oldInfo, string newInfo);

    function setText(string memory _myText) external {
        emit InfoChange (myText, _myText);
        require(owner == msg.sender, "You are not the owner");
        myText = _myText;
    } 

    function getText() external view returns (string memory) {
        return myText;
    }   
}