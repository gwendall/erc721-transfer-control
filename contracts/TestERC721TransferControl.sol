//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.14;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { ERC721Enumerable } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import { ERC721TransferControl } from "./extensions/ERC721TransferControl.sol";

contract TestERC721TransferControl is ERC721, ERC721Enumerable, ERC721TransferControl {

    constructor() ERC721("Test ERC721 Transferor Control", "TestERC721TransferControl") {
        this;
    }

    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint256 _tokenId
    ) 
        internal 
        override(ERC721, ERC721Enumerable, ERC721TransferControl) 
    {
        return super._beforeTokenTransfer(_from, _to, _tokenId);
    }

    function supportsInterface(bytes4 interfaceId) 
        public 
        view 
        virtual 
        override(ERC721, ERC721Enumerable, ERC721TransferControl)
        returns (bool) 
    {
        return super.supportsInterface(interfaceId);
    }
}
