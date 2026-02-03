// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringExtractor {
    // State metadata: Full Name of the user (placeholder; replace with actual name)
    string public fullName = "John Doe";

    // Function to perform string extractions, concatenation, and hashing
    function processStrings(
        string memory barangay,
        string memory city,
        string memory province,
        string memory country
    ) public pure returns (
        string memory extractedBarangay,  // First two characters of Barangay
        string memory extractedCity,      // First two characters of City
        string memory extractedProvince,  // Last two characters of Province
        string memory extractedCountry,   // Last two characters of Country
        string memory concatenated,       // Combined extracted string
        bytes32 hashEncode,               // Keccak-256 hash using abi.encode
        bytes32 hashEncodePacked          // Keccak-256 hash using abi.encodePacked
    ) {
        // Extract first two characters of Barangay
        extractedBarangay = substring(barangay, 0, 2);
        
        // Extract first two characters of City
        extractedCity = substring(city, 0, 2);
        
        // Extract last two characters of Province
        uint provinceLen = bytes(province).length;
        extractedProvince = substring(province, provinceLen - 2, 2);
        
        // Extract last two characters of Country
        uint countryLen = bytes(country).length;
        extractedCountry = substring(country, countryLen - 2, 2);
        
        // Concatenate the extracted strings
        concatenated = string(abi.encodePacked(extractedBarangay, extractedCity, extractedProvince, extractedCountry));
        
        // Generate Keccak-256 hash using abi.encode
        hashEncode = keccak256(abi.encode(concatenated));
        
        // Generate Keccak-256 hash using abi.encodePacked
        hashEncodePacked = keccak256(abi.encodePacked(concatenated));
    }

    // Helper function to extract a substring from a string
    function substring(string memory str, uint startIndex, uint length) internal pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        require(startIndex + length <= strBytes.length, "Substring out of bounds");
        bytes memory result = new bytes(length);
        for (uint i = 0; i < length; i++) {
            result[i] = strBytes[startIndex + i];
        }
        return string(result);
    }
}