// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC721/extensions/IERC721Enumerable.sol)

pragma solidity ^0.8.0;

import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IERC721TransferControl is IERC721 {

    function blockTransferor(address _transferor) external;

    function unblockTransferor(address _transferor) external;

    function isTransferorBlocked(address _transferor) external view returns (bool);
    
}