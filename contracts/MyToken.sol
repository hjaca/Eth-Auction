// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//pragma solidity ^0.8.0;

/**
 * @title MyToken
 * @dev Token contract for Eth course - Hugo Jaca
 * Funciones:
 *      Constructor. Inicializa la subasta con los parámetros necesario para su funcionamiento.
 * Eventos:
 */

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721("MiToken", "MTNFT") {
    // var definition
    mapping (address => uint256) public a;
    bool public isActive;

    uint count = 1;

    function mint() payable external {
        _mint(msg.sender, count);
        count++;
    }

    // constructor
    constructor (uint256 b) {
       isActive = true;
       b = 0;
    }

}