# ERC1155Airdropper
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/ERC1155Airdropper/ERC1155Airdropper.sol)

**Inherits:**
[AbstractUtilityContract](/contracts/UtilityContract/AbstractUtilityContract.sol/abstract.AbstractUtilityContract.md), Ownable

**Title:**
ERC1155 Airdropper Contract

**Author:**
webb3george

This contract facilitates the airdropping of ERC1155 tokens to multiple recipients


## State Variables
### MAX_AIRDROP_BATCH_SIZE

```solidity
uint256 public constant MAX_AIRDROP_BATCH_SIZE = 300
```


### token

```solidity
IERC1155 public token
```


### treasury

```solidity
address public treasury
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

Returns the initialization data for deploying a new ERC1155Airdropper contract


```solidity
function getInitData(address _deployManager, address _tokenAddress, address _treasury, address _owner)
    external
    pure
    returns (bytes memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_deployManager`|`address`|The address of the deploy manager|
|`_tokenAddress`|`address`|The address of the ERC1155 token contract|
|`_treasury`|`address`|The address of the treasury holding the tokens to be airdropped|
|`_owner`|`address`|The address of the owner of the new contract|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|The encoded initialization data|


### airdrop

Airdrops ERC1155 tokens to multiple receivers


```solidity
function airdrop(address[] calldata receivers, uint256[] calldata amounts, uint256[] calldata tokenIds)
    external
    onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`receivers`|`address[]`|The array of receivers addresses|
|`amounts`|`uint256[]`|The array of amounts to be airdropped to each receiver|
|`tokenIds`|`uint256[]`|The array of token IDs to be airdropped to each receiver|


## Errors
### AlreadyInitialized
Error if contract is already initialized


```solidity
error AlreadyInitialized();
```

### NoApprovedTokens
Error if no approved tokens for airdrop


```solidity
error NoApprovedTokens();
```

### ReceiversLengthMismatch
Error if receivers length does not match tokenIds length


```solidity
error ReceiversLengthMismatch();
```

### AmountsLengthMismatch
Error if amounts length does not match tokenIds length


```solidity
error AmountsLengthMismatch();
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

