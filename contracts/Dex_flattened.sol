// SPDX-License-Identifier: GPL-3.0
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.26;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: contracts/Dex.sol

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