//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.14;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC165 } from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import { IERC721TransferControl } from "./IERC721TransferControl.sol";

abstract contract ERC721TransferControl is ERC721, Ownable, IERC721TransferControl {

    mapping (address => bool) public blockedTransferors;

    function blockTransferor(address _transferor) public onlyOwner {
        blockedTransferors[_transferor] = true;
    }

    function unblockTransferor(address _transferor) public onlyOwner {
        delete blockedTransferors[_transferor];
    }

    function isTransferorBlocked(address _transferor) public view returns (bool) {
        return blockedTransferors[_transferor];
    }

    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint256 _tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(_from, _to, _tokenId);
        require(blockedTransferors[msg.sender] != true, 'Transferor is blocked');
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC721) returns (bool) {
        return interfaceId == type(IERC721TransferControl).interfaceId || super.supportsInterface(interfaceId);
    }
}
