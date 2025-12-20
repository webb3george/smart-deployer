# IUtilityContract
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/UtilityContract/IUtilityContract.sol)

**Inherits:**
IERC165


## Functions
### initialize

Initialization of deployManager


```solidity
function initialize(bytes memory _initData) external returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_initData`|`bytes`|The initialization data for the new contract instance|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|The boolean value indicating whether the initialization was successful|


### getDeployManager

Shows address of the deploy manager


```solidity
function getDeployManager() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|address of the deploy manager|


## Errors
### DeployManagerCannotBeZeroAddress
Error if contrat is Zero address


```solidity
error DeployManagerCannotBeZeroAddress();
```

### NotDeployManager
Error if deploying contract does not supports its interface


```solidity
error NotDeployManager();
```

### FailedToDeployManager
Error if deployManager validation failed


```solidity
error FailedToDeployManager();
```

