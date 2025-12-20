# ERC20Airdropper
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/ERC20Airdropper/ERC20Airdropper.sol)

**Inherits:**
[AbstractUtilityContract](/contracts/UtilityContract/AbstractUtilityContract.sol/abstract.AbstractUtilityContract.md), Ownable

**Title:**
ERC20 Airdropper Contract

**Author:**
webb3george

This contract facilitates the airdropping of ERC20 tokens to multiple recipients.


## State Variables
### token

```solidity
IERC20 public token
```


### amount

```solidity
uint256 public amount
```


### treasury

```solidity
address public treasury
```


### MAX_AIRDROP_BATCH_SIZE

```solidity
uint256 public constant MAX_AIRDROP_BATCH_SIZE = 300
```


### initialized

```solidity
bool private initialized
```


## Functions
### constructor


```solidity
constructor() payable Ownable(msg.sender);
```

### notInitialized

Modifier to check if contract is not initialized


```solidity
modifier notInitialized() ;
```

### initialize

Initialization of the airdropper contract


```solidity
function initialize(bytes memory _initData) external override notInitialized returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_initData`|`bytes`|The initialization data for the new contract instance|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The boolean value indicating whether the initialization was successful|


### getInitData

Returns the initialization data for deploying a new ERC20Airdropper contract


```solidity
function getInitData(
    address _deployManager,
    address _tokenAddress,
    uint256 _airdropAmount,
    address _treasury,
    address _owner
) external pure returns (bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_deployManager`|`address`|The address of the deploy manager|
|`_tokenAddress`|`address`|The address of the ERC20 token contract|
|`_airdropAmount`|`uint256`|The amount of tokens to be airdropped to each receiver|
|`_treasury`|`address`|The address of the treasury holding the tokens to be airdropped|
|`_owner`|`address`|The address of the owner of the new contract|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|The encoded initialization data|


### airdrop

Airdrops ERC20 tokens to multiple receivers


```solidity
function airdrop(address[] calldata receivers, uint256[] calldata amounts) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`receivers`|`address[]`|The array of receivers addresses|
|`amounts`|`uint256[]`|The array of amounts to be airdropped to each receiver|


## Errors
### AlreadyInitialized
Error if contract is already initialized


```solidity
error AlreadyInitialized();
```

### NotEnoughApprovedTokens
Error if no approved tokens for airdrop


```solidity
error NotEnoughApprovedTokens();
```

### ArraysLengthMissmatch
Error if receivers length does not match tokenIds length


```solidity
error ArraysLengthMissmatch();
```

### TransferFailed
Error if transfer failed


```solidity
error TransferFailed();
```

### BatchSizeExceeded
Error if batch size exceeded


```solidity
error BatchSizeExceeded();
```

