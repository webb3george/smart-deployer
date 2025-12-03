// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "./IUtilityContract.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UtilityERC20Airdropper is IUtilityContract {

    // ["0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"]
    // [30,40]

    IERC20 public token;
    uint256 public amount;

    error AlreadyInitialized();
    error NotEnoughApprovedTokens();
    error ArraysLengthMissmatch();
    error TransferFailed();

    modifier NotInitialized() {
        require(!initialized, AlreadyInitialized());
        _;
    }

    bool private initialized;

    function initialize(bytes memory _initData) external NotInitialized returns(bool){
        (address _tokenAddress, uint256 _airdropAmount)  = abi.decode(_initData, (address, uint256));

        token = IERC20(_tokenAddress);
        amount = _airdropAmount;

        initialized = true;
        return (true);
    }

    function getInitData(address _tokenAddress, uint256 _airdropAmount) external pure returns(bytes memory) {
        return (abi.encode(_tokenAddress, _airdropAmount));
    }

    function airdrop(address[] calldata receivers, uint256[] calldata amounts) external {
        require(receivers.length == amounts.length, NotEnoughApprovedTokens());
        require(token.allowance(msg.sender, address(this)) >= amount, NotEnoughApprovedTokens());
        
        for (uint256 i = 0; i < receivers.length; i++) {
            require(token.transferFrom(msg.sender, receivers[i], amounts[i]), TransferFailed());
        }
    }

}