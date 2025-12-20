# IVesting
[Git Source](https://github.com/st4rkeey/smart-deployer/blob/1cb73867eb8674ff50206595bc13d95bd7efd33d/contracts/LinearVesting/IVesting.sol)


## Functions
### startVesting


```solidity
function startVesting(VestingParams calldata params) external;
```

### vestedAmount


```solidity
function vestedAmount(address _claimer) external view returns (uint256);
```

### claim


```solidity
function claim() external;
```

### claimableAmount


```solidity
function claimableAmount(address _claimer) external view returns (uint256);
```

### withdrawUnallocated


```solidity
function withdrawUnallocated(address _to) external;
```

### getInitData


```solidity
function getInitData(address _tokenAddress, uint256 _allocatedTokens, address _owner)
    external
    pure
    returns (bytes memory);
```

## Events
### Claim

```solidity
event Claim(address beneficiary, uint256 amount, uint256 timestamp);
```

### VestingCreated

```solidity
event VestingCreated(address beneficiary, uint256 totalAmount, uint256 creationTime);
```

### TokensWithdrawn

```solidity
event TokensWithdrawn(address to, uint256 amount, uint256 timestamp);
```

## Errors
### VestingNotFound

```solidity
error VestingNotFound();
```

### AlreadyInitialized

```solidity
error AlreadyInitialized();
```

### ClaimNotAvailable

```solidity
error ClaimNotAvailable(uint256 blockTimestamp, uint256 AvailableTimeFrom);
```

### NothingToClaim

```solidity
error NothingToClaim();
```

### InsufficientBalanceOfContract

```solidity
error InsufficientBalanceOfContract(uint256 availableBalance, uint256 totalAmount);
```

### VestingAlreadyExist

```solidity
error VestingAlreadyExist();
```

### AmountCantBeZero

```solidity
error AmountCantBeZero();
```

### StartTimeShouldBeFuture

```solidity
error StartTimeShouldBeFuture(uint256 startTime, uint256 currentTimeStamp);
```

### DurationCantBeZero

```solidity
error DurationCantBeZero();
```

### CooldownCantBeLongerThanDuration

```solidity
error CooldownCantBeLongerThanDuration();
```

### InvalidAddress

```solidity
error InvalidAddress();
```

### BelowMinClaimAmount

```solidity
error BelowMinClaimAmount();
```

### CooldownNotPassedYet

```solidity
error CooldownNotPassedYet();
```

### CantClaimMoreThanTotalAmount

```solidity
error CantClaimMoreThanTotalAmount();
```

### NothingToWithdraw

```solidity
error NothingToWithdraw();
```

## Structs
### VestingInfo

```solidity
struct VestingInfo {
    uint256 totalAmount;
    uint256 startTime;
    uint256 cliff;
    uint256 duration;
    uint256 claimed;
    uint256 lastClaimTime;
    uint256 claimCooldown;
    uint256 minClaimAmount;
    bool created;
}
```

### VestingParams

```solidity
struct VestingParams {
    address beneficiary;
    uint256 totalAmount;
    uint256 startTime;
    uint256 cliff;
    uint256 duration;
    uint256 claimCooldown;
    uint256 minClaimAmount;
}
```

