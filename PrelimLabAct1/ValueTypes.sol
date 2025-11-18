// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.7;

// Data types - values and references

contract ValueTypes {
    bool public b = true;
    uint public u = 123;  // uint = uint256 0 to 2**256 - 1
                          //        uint8   0 to 2**8 - 1
                          //        uint16  0 to 2**16 - 1
    int public i = -123;  // int = int256   -2**255 to 2**255 - 1
                          //       int128   -2**127 to 2**127 - 1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0xc46fb77DC638f4993AeE9482fc000C7199E8f10B;

}