// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Variables {
    // Variables de estado.
    string public text = "Hello";
    uint public num = 123;
    address owner;

    function doSomething() public {
        // Variables locales.
        uint i = 456;

        // Variables Globales
        uint timestamp = block.timestamp; // tiempo del bloque actual en segundos
        address sender = msg.sender; // address de quien llama a la función
        
        num = i;
        num = timestamp;
        owner = sender;
    }
}