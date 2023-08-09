// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyEvent {
    string private myText;
    event InfoChange(string oldInfo, string newInfo);

    function setText(string memory _myText) external {
        emit InfoChange (myText, _myText);
        myText = _myText;
    } 

    function getText() external view returns (string memory) {
        return myText;
    }   
}