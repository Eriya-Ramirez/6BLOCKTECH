// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TuitionCalculator {
    uint constant FixedLabFee = 500;

    function FeeCompute(uint256 unitnum, uint256 unitrate) public pure returns (uint256) {
        uint EnrollmentFee = unitnum * unitrate;
        uint MiscellaneousFee;
        if (unitnum > 18) {
            MiscellaneousFee = (EnrollmentFee * 12) / 100;
        } else {
            MiscellaneousFee = (EnrollmentFee * 8) / 100;
        }
        
        uint totalFee = EnrollmentFee + MiscellaneousFee + FixedLabFee;
        return totalFee;
    }

// Mode of Payment Functions
    function payCash(uint256 totalFee) public pure returns (uint256) {
        uint discount = (totalFee * 10) / 100;
        return totalFee - discount;
    }

    function TwoPayment(uint totalFee) public pure returns (uint) {
        uint interest = (totalFee * 5) / 100;
        return totalFee + interest;
    }

    function ThreePayments(uint totalFee) public pure returns (uint) {
        uint interest = (totalFee * 10) / 100;
        return totalFee + interest;
    }

}

