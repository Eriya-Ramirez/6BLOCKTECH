// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SimpleMintContract is ERC721URIStorage, Ownable {

    uint public mintAmount = 0.05 ether;
    uint public totalSupply;
    uint public maxSupply;
    bool public isMintEnabled;

    mapping (address => uint256) public mintedWallet;

    constructor() ERC721("Sample Minting", "SAMPLEMINT") Ownable(msg.sender) {
    maxSupply = 2;
    }

    function toggleisMintEnabled () external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setmaxsupply(uint maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function mint() external payable {
        require(isMintEnabled, "Minting not enabled.");
        require(mintedWallet[msg.sender] <1, "Exceeds max per wallet");
        require(msg.value == mintAmount, "Wrong value");
        require(maxSupply > totalSupply, "Sold out");

        mintedWallet[msg.sender]++;
        totalSupply++;

        uint tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
        
    }

}
