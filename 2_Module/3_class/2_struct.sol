// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyStruct {

    //enum Colors {Undefined = 0, Blue = 1, Red = 2}
    enum Colors {Undefined, Blue, Red}

    struct InfoStruct {
        string text;
        Colors color;
        uint countChanges;
    }
    InfoStruct storedInfo;

    constructor() {
        storedInfo = InfoStruct ({
            text: "Hola Medellin",
            color: Colors.Undefined,
            countChanges: 0
        });
    }

    function setInfo(Colors myColor, string memory myText) external {
        storedInfo.countChanges++;
        storedInfo.color = myColor;  
        storedInfo.text = myText;    
    }

    function getInfo() external view returns (InfoStruct memory) {
        return storedInfo;
    }   
}