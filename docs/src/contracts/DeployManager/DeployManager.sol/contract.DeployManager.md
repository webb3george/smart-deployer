# DeployManager
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/DeployManager/DeployManager.sol)

**Inherits:**
[IDeployManager](/contracts/DeployManager/IDeployManager.sol/interface.IDeployManager.md), Ownable, ERC165

**Title:**
DeployManager - Factory for utility contracts

**Author:**
webb3george

Contract to manage deployment of utility contracts

Uses OpenZeppelin's Clones and Ownable; assumes utility contracts implement IUtilityContract


## State Variables
### deployedContracts
Maps deployer address to an array of deployed contracts


```solidity
mapping(address => address[]) public deployedContracts
```


### contractsData
Maps a utility contract address to it's params


```solidity
mapping(address => ContractInfo) public contractsData
```


## Functions
### constructor


```solidity
constructor() payable Ownable(msg.sender);
```

### deploy

Deploys a new instance of the specified utility contract

Emits a NewDeployment event upon successful deployment


```solidity
function deploy(address _utilityContract, bytes calldata _initData) external payable override returns (address);
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
function addNewContract(address _contractAddress, uint256 _fee, bool _isActive) external override onlyOwner;
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
function updateFee(address _contractAddress, uint256 _newFee) external override onlyOwner;
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
function changeContractStatus(address _contractAddress, bool _isActive) external override onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_contractAddress`|`address`|The address of the utility contract to update status|
|`_isActive`|`bool`|New contract status value|


### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC165) returns (bool);
```

