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

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DEX {
    // var definition
    bool public isActive;

    IERC20 tokenA;

    // constructor
    constructor (address addTokenA) {
       tokenA = IERC20(addTokenA);
      
    }

}