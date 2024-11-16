# Solidity API

## SimpleDEX

### Contract
SimpleDEX : contracts/Dex.sol

 --- 
### Functions:
### constructor

```solidity
constructor(address addTokenA, address addTokenB) public
```

### addLiquidity

```solidity
function addLiquidity(uint256 amountA, uint256 amountB) public
```

### swapAforB

```solidity
function swapAforB(uint256 amountAIn) public
```

### swapBforA

```solidity
function swapBforA(uint256 amountBIn) public
```

### removeLiquidity

```solidity
function removeLiquidity(uint256 amountA, uint256 amountB) public
```

### getPrice

```solidity
function getPrice(address _token) public
```

