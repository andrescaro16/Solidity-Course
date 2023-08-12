// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Register15 {

    enum Colors {Undefined, Blue, Red}

    struct InfoStruct {
        string myText;
        Colors color;
        uint countChanges;
    }
    mapping (address => InfoStruct[]) public storedInfos;

    constructor() {
        InfoStruct memory auxInfo = InfoStruct ({
            myText: "Hello world",
            color: Colors.Undefined,
            countChanges: 0
        });
        storedInfos[msg.sender].push(auxInfo);
    }

    event InfoChange(address person, uint countChanges, string oldInfo, string newInfo);

    function addInfo(Colors myColor, string memory myInfo) public returns (uint index) {
        InfoStruct memory auxInfo = InfoStruct ({
            myText: myInfo,
            color: myColor,
            countChanges: storedInfos[msg.sender][storedInfos[msg.sender].length -1].countChanges + 1
        });
        storedInfos[msg.sender].push(auxInfo);
        index = storedInfos[msg.sender].length -1;
    }
    
    function setText(uint index, string memory _newText) public {
        storedInfos[msg.sender][index].countChanges++;
        emit InfoChange (msg.sender, storedInfos[msg.sender][index].countChanges, storedInfos[msg.sender][index].myText, _newText);
        storedInfos[msg.sender][index].myText = _newText;
        storedInfos[msg.sender][index].countChanges++;
    }

    function setColor(uint index, Colors myColor) public {
        storedInfos[msg.sender][index].color = myColor;
        storedInfos[msg.sender][index].countChanges++;
    }

    function getOneInfo(address account, uint index) public view returns (InfoStruct memory) {
        require (index < storedInfos[account].length, "invalid index");
        return storedInfos[account][index];
    }

    function getMyInfoAtIndex(uint index) external view returns (InfoStruct memory) {
        return getOneInfo(msg.sender, index);
    }

    function listAllInfo(address account) external view returns (InfoStruct[] memory) {
        return storedInfos[account];
    }
   
}