// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleGoldVault is ERC4626 {
    constructor(IERC20 _asset)
        ERC4626(_asset)
        ERC20("Vault Gold Shares", "yGOLD")
        {}
}

contract MockGold is ERC20 {
    constructor() ERC20("Mock Gold", "Gold") {
        _mint(msg.sender, 1000000 * 10**18);
    }
}

