// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ErrorHandling{
    mapping(address => uint256) public valueMapping;

    // Function to set value for the sender's address
    function setValue(uint256 _value) public {
        // ensure the value being set is not zero
        require(_value != 0, "Value cannot be zero.");
        valueMapping[msg.sender] = _value;
    }

    // Function to retrieve the value associated with the sender's address
    function getValue() public view returns (uint256) {
        // Ensure the sender has set a value before retrieving
        require(valueMapping[msg.sender] !=0, "No value is set for sender.");
        return valueMapping[msg.sender];
    }



}

