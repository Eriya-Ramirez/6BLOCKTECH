// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ServiceFeeCalculator {
    function calculateFee(
        string memory firstName,
        string memory middleName,
        string memory lastName,
        uint256 serviceCode
    ) public pure returns (uint256 totalFee, bytes32 hashValue) {
        require(serviceCode == 1 || serviceCode == 2, "Invalid service code");

        uint256 baseFee;
        uint256 serviceCharge = 0;
        uint256 tax;

        if (serviceCode == 1) {

            baseFee = 10000;
            tax = (baseFee * 12) / 100;
            totalFee = baseFee + tax;
        } else if (serviceCode == 2) {
            baseFee = 2000;
            serviceCharge = (baseFee * 10) / 100;
            uint256 subtotal = baseFee + serviceCharge;
            tax = (subtotal * 12) / 100;
            totalFee = subtotal + tax;
        }

        
        bytes1 firstCharFirst = bytes(firstName)[0];
        bytes1 lastCharMiddle = bytes(middleName)[bytes(middleName).length - 1];
        bytes1 firstCharLast = bytes(lastName)[0];

        
        string memory feeStr = uint2str(totalFee);
        bytes1 firstDigit = bytes(feeStr)[0];

        
        bytes memory message;
        if (serviceCode == 1) {
            message = abi.encodePacked(firstCharFirst, lastCharMiddle, firstCharLast, serviceCode, firstDigit);
        } else {
            message = abi.encode(firstCharFirst, lastCharMiddle, firstCharLast, serviceCode, firstDigit);
        }

       
        hashValue = keccak256(message);
    }

    
    function uint2str(uint256 _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}