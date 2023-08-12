// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Challenge {

    enum Voto {UnVoted, Voted, CanNotVoted}

    struct InfoStruct {
        string city;
        Voto color;
    }
    mapping (address => InfoStruct) private storedInfos;

}