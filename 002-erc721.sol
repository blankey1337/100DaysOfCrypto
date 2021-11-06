// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.3.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.3.0/security/Pausable.sol";
import "@openzeppelin/contracts@4.3.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.3.0/utils/Counters.sol";

/**
Day 2 - ERC721 - Classic NFT use case
*/

contract DaysOfCryptoDayTwoToken is ERC721, ERC721Enumerable, Pausable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("DaysOfCryptoDayTwoToken", "TWO") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to) public onlyOwner {
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
