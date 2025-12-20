# IDeployManager
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/DeployManager/IDeployManager.sol)

**Inherits:**
IERC165

**Title:**
IDeployManager - Factory for utility contracts

**Author:**
webb3george

Interface defines the functions, errors and events for the DeployManager contract


## Functions
### deploy

Deploys a new instance of the specified utility contract

Emits a NewDeployment event upon successful deployment


```solidity
function deploy(address _utilityContract, bytes calldata _initData) external payable returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_utilityContract`|`address`|The address of the utility contract to deploy|
|`_initData`|`bytes`|The initialization data for the new contract instance|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the newly deployed contract instance|


### addNewContract

Adds new contract info

Emits a NewContractAdded event upon successful contract added


```solidity
function addNewContract(address _contractAddress, uint256 _fee, bool _isActive) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the potential utility contract|
|`_fee`|`uint256`|Fee of the contract to deploy|
|`_isActive`|`bool`|Actual status of the contract added|


### updateFee

Updates fee amount of contract deploy

Emits a ContractFeeUpdated event upon successful fee update


```solidity
function updateFee(address _contractAddress, uint256 _newFee) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract to update fee amount|
|`_newFee`|`uint256`|New fee amount|


### changeContractStatus

Changes contact status

Emits a ContractStatusUpdated event upon successful status update


```solidity
function changeContractStatus(address _contractAddress, bool _isActive) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract to update status|
|`_isActive`|`bool`|New contract status value|


## Events
### NewContractAdded
Emitted when a new utility contract is added


```solidity
event NewContractAdded(address _contractAddress, uint256 _fee, bool _isActive, uint256 _timestamp);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract|
|`_fee`|`uint256`|The deployment fee(In Wei) for the utility contract|
|`_isActive`|`bool`|The status of the utility contract|
|`_timestamp`|`uint256`|The timestamp when the contract was added|

### ContractFeeUpdated
Emmited when deployment Fee updated


```solidity
event ContractFeeUpdated(address _contractAddress, uint256 _oldFee, uint256 _newFee, uint256 _timestamp);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract|
|`_oldFee`|`uint256`|The amount of the previous deployment fee (in Wei)|
|`_newFee`|`uint256`|The amount of the new deployment fee (in Wei)|
|`_timestamp`|`uint256`|The timestamp when the fee was updated|

### ContractStatusUpdated
Emitted when a contract status updated


```solidity
event ContractStatusUpdated(address _contractAddress, bool _isActive, uint256 _timestamp);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract|
|`_isActive`|`bool`|New status value|
|`_timestamp`|`uint256`|The timestamp when the fee was updated|

### NewDeployment
Emmited when contract deployed


```solidity
event NewDeployment(address _contractAddress, address _deployer, uint256 _fee, uint256 _timestamp);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract|
|`_deployer`|`address`|Address of the contract deployer|
|`_fee`|`uint256`|Amount of fee to pay for contract deploy|
|`_timestamp`|`uint256`|The timestamp when the fee was updated|

## Errors
### ContractNotActive
Error if the contract is not active


```solidity
error ContractNotActive();
```

### InsufficientFunds
Not enough funds to deploy the contract


```solidity
error InsufficientFunds();
```

### ContractDoesNotExist
Error if the contract does not exist


```solidity
error ContractDoesNotExist();
```

### DeployFailed
Error if deployment fails


```solidity
error DeployFailed();
```

### TransactionFailed
Error if transaction fails


```solidity
error TransactionFailed();
```

### ContractIsNotUtilityContract
Error if the contract is not a utility contract


```solidity
error ContractIsNotUtilityContract();
```

### ContractAlreadyRegistered
Error when user tries to register already registered contract


```solidity
error ContractAlreadyRegistered();
```

## Structs
### ContractInfo
Stores registered contract info


```solidity
struct ContractInfo {
    uint256 fee; /// @notice Fee for contract deployment
    bool isActive; /// @notice Contract Status
    uint256 registeredAt; /// @notice Timestamp when contract registered
}
```

