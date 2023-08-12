// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MappingStruct {

    //enum Colors {Undefined = 0, Blue = 1, Red = 2, Gren = 3}
    enum Colors {Undefined, Blue, Red, Green}

    struct InfoStruct {
        string myText;
        Colors color;
        uint countChanges;
    }
    mapping (address => InfoStruct) private storedInfos;

    event InfoChange(address person, uint countChanges, string oldInfo, string newInfo);

    function setText(Colors myColor, string memory _myText) external {
      storedInfos[msg.sender].countChanges++;
      emit InfoChange (msg.sender, storedInfos[msg.sender].countChanges, storedInfos[msg.sender].myText, _myText);
      storedInfos[msg.sender].color = myColor;  
      storedInfos[msg.sender].myText = _myText;    
    }

    function getText() external view returns (InfoStruct memory) {
        return storedInfos[msg.sender];
    } 
}