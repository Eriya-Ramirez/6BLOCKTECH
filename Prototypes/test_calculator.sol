// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint256 result = 0;
    
    // Demo of a get function
    function get() public view returns (uint) {
        return result;
    }

    // In this function, it uses get() to get the result.
    function add(uint num1, uint num2) external returns (uint) {
        result = num1 + num2;
        return result; 
    }

    // Returns directly the answers
    function sub(uint num1, uint num2) external pure returns (uint) {
        return (num1 - num2);
    }

    // Returns directly the answers
    function multiply(uint num1, uint num2) external pure returns (uint) {
        return (num1 * num2);
    }

    // Returns directly the answers
    function div(uint num1, uint num2) external pure  returns (uint) {
        return (num1 / num2);
    }
    
    // Clears the values from the add function.
    function clear() external {
        result = 0;
    }

    
}

