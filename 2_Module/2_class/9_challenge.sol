// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Trip {

    address public owner;
    uint256 public maxSupply;
    uint256 public supply;
    address public winner;
    bool public goalAchieved;
    uint256 private date;
    address[] private accounts;
    uint256 public counter;

    mapping (address => bool) public whiteList;
    mapping (address => uint) public votes;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        maxSupply = 50;
        winner = owner;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    modifier onlyGoalAchieved {
        require(goalAchieved == true, "Goal not achieved yet");
        _;
    }

    modifier onlyNoGoalAchieved {
        require(goalAchieved == false, "The collection is now closed");
        _;
    }

    modifier votingTime {
        require(goalAchieved == true, "The voting is not open - Goal not achieved");
        require(block.timestamp < (date + 10), "The voting is not open - Time expired");
        _;
    }

    modifier onlyVotingClosed{
        require(block.timestamp > (date + 10), "Voting time not expired");
        _;
    }

    function addMember (address member) external onlyOwner {
        whiteList[member] = true;
        accounts.push(member);
    }

    function delMember (address member) external onlyOwner {
        whiteList[member] = false;
    }

    function addMoney(uint amount) external onlyWhitelist onlyNoGoalAchieved {
        require(amount > 0, "Amount must be > 0");
        require(maxSupply >= amount + supply, "The amount exceeds the maximum supply");
        supply += amount;
        if (supply == maxSupply){
            goalAchieved = true;
            date = block.timestamp;
        }
    }

    function vote(address _selected) external votingTime{
        votes[_selected] += 1;
    }

    function sendMoney() payable external onlyVotingClosed onlyGoalAchieved{
        payable(winner).transfer(supply);
        supply = 0;
    }

}