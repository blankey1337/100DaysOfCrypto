// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.3.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.3.2/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts@4.3.2/token/ERC20/extensions/ERC20Votes.sol";

/* Day one - COMP-like vote power for governance  */
contract DaysOfCryptoDayOneToken is ERC20, Ownable, ERC20Permit, ERC20Votes {
    constructor()
        ERC20("100DaysOfCryptoDayOneToken", "ONE")
        ERC20Permit("100DaysOfCryptoDayOneToken")
    {
        _mint(msg.sender, 100 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.
    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}