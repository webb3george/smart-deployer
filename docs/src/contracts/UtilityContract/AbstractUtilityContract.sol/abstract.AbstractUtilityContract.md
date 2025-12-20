# AbstractUtilityContract
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/UtilityContract/AbstractUtilityContract.sol)

**Inherits:**
[IUtilityContract](/contracts/UtilityContract/IUtilityContract.sol/interface.IUtilityContract.md), ERC165


## State Variables
### deployManager

```solidity
address public deployManager
```


## Functions
### initialize

Initialization of deployManager


```solidity
function initialize(bytes calldata _initData) external virtual override returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_initData`|`bytes`|The initialization data for the new contract instance|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The boolean value indicating whether the initialization was successful|


### setDeployManager

Internal func for setting deployManager


```solidity
function setDeployManager(address _deployManager) internal virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_deployManager`|`address`|DeployManager address|


### validateDeployManager

Internal func for validate deployManager


```solidity
function validateDeployManager(address _deployManager) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_deployManager`|`address`|DeployManager address|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if valid|


### getDeployManager

Shows address of the deploy manager


```solidity
function getDeployManager() external view virtual override returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|address of the deploy manager|


### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC165) returns (bool);
```

