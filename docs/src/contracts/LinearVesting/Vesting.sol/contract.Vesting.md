# Vesting
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/LinearVesting/Vesting.sol)

**Inherits:**
[IVesting](/contracts/LinearVesting/IVesting.sol/interface.IVesting.md), [AbstractUtilityContract](/contracts/UtilityContract/AbstractUtilityContract.sol/abstract.AbstractUtilityContract.md), Ownable


## State Variables
### initialized

```solidity
bool private initialized
```


### token

```solidity
IERC20 public token
```


### allocatedTokens

```solidity
uint256 public allocatedTokens
```


### vestings

```solidity
mapping(address => VestingInfo) public vestings
```


## Functions
### constructor


```solidity
constructor() payable Ownable(msg.sender);
```

### notInitialized


```solidity
modifier notInitialized() ;
```

### initialize


```solidity
function initialize(bytes memory _initData) external override notInitialized returns (bool);
```

### startVesting


```solidity
function startVesting(IVesting.VestingParams calldata params) external onlyOwner;
```

### claim


```solidity
function claim() public;
```

### withdrawUnallocated


```solidity
function withdrawUnallocated(address _to) external onlyOwner;
```

### vestedAmount


```solidity
function vestedAmount(address _claimer) public view returns (uint256);
```

### claimableAmount


```solidity
function claimableAmount(address _claimer) public view returns (uint256);
```

### getInitData


```solidity
function getInitData(address _tokenAddress, uint256 _allocatedTokens, address _owner)
    external
    pure
    returns (bytes memory);
```

