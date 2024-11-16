// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//pragma solidity ^0.8.0;

/**
 * @title DEX 
 * @dev Token contract for Eth course - Hugo Jaca
 * Funciones:
 *      Constructor. Inicializa la subasta con los parámetros necesario para su funcionamiento.
 * Eventos:
 *      Crear dos tokens ERC-20 simples: Los contrato de los tokens deben tener obligatoriamente los nombres TokenA y TokenB.
 *      Implementar un contrato de exchange (denominado obligatoriamente SimpleDEX) que:
 *         Mantenga un pool de liquidez para TokenA y TokenB.
 *         Utilice la fórmula del producto constante (x+dx)(y-dy) = xy para calcular los precios de intercambio.
 *         Permita añadir y retirar liquidez.
 *         Permita intercambiar TokenA por TokenB y viceversa.
 *      El contrato SimpleDEX debe contar obligatoriamente y sin modificación de la interface con las siguientes funciones:
 *         constructor(address _tokenA, address _tokenB)
 *         addLiquidity(uint256 amountA, uint256 amountB)
 *         swapAforB(uint256 amountAIn)
 *         swapBforA(uint256 amountBIn)
 *         removeLiquidity(uint256 amountA, uint256 amountB)
 *         getPrice(address _token)
 *      Incluir los eventos que consideren convenientes.
 */

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX {
    // var definition
    bool public isActive;

    IERC20 tokenA;
    IERC20 tokenB;

    // constructor
    constructor (address addTokenA, address addTokenB) {
       tokenA = IERC20(addTokenA);
       tokenB = IERC20(addTokenB);
      
    }

    // functions
    function addLiquidity(uint256 amountA, uint256 amountB) public {
    }

    function swapAforB(uint256 amountAIn) public {
    }
     
    function swapBforA(uint256 amountBIn) public {
    }
        
    function removeLiquidity(uint256 amountA, uint256 amountB) public {
    }
    
    function getPrice(address _token) public {
    }
    
}