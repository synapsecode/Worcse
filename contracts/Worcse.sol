// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Worcse {
    string public greeting;

    // Constructor to set the initial greeting when the contract is deployed
    constructor(string memory initialGreeting) {
        greeting = initialGreeting;
    }

    // Function to get the current greeting
    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    // Function to set a new greeting
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }
}