// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";
import "../IUtilityContract.sol";
import "./IDeployManager.sol";

contract DeployManager is IDeployManager, Ownable {
    constructor() Ownable(msg.sender) payable {}

    event NewContractAdded(address _contractAddress, uint256 _fee, bool _isActive, uint256 _timestamp);
    event ContractFeeUpdated(address _contractAddress, uint256 _oldFee, uint256 _newFee, uint256 _timestamp);
    event ContractStatusUpdated(address _contractAddress, bool _isActive, uint256 _timestamp);
    event NewDeployment(address _contractAddress, address _deployer, uint256 _fee, uint256 _timestamp);

    struct ContractInfo {
        uint256 fee;
        bool isActive;
        uint256 registeredAt;
    }

    mapping(address => address[]) public deployedContracts;
    mapping(address => ContractInfo) public contractsData;

    error ContractNotActive();
    error InsufficientFunds();
    error ContractDoesNotExist();
    error DeployFailed();

    function deploy(address _utilityContract, bytes calldata _initData) external payable returns (address) {
        ContractInfo memory info = contractsData[_utilityContract];

        require(info.isActive, ContractNotActive());
        require(msg.value >= info.fee, InsufficientFunds());
        require(info.registeredAt > 0, ContractDoesNotExist());

        address clone = Clones.clone(_utilityContract);
        bool success = IUtilityContract(clone).initialize(_initData);
        require(success, DeployFailed());

        payable(owner()).transfer(msg.value);

        deployedContracts[msg.sender].push(clone);

        emit NewDeployment(clone, msg.sender, info.fee, block.timestamp);

        return clone;
    }

    function addNewContract(address _contractAddress, uint256 _fee, bool _isActive) external onlyOwner {
        contractsData[_contractAddress] = ContractInfo(_fee, _isActive, block.timestamp);

        emit NewContractAdded(_contractAddress, _fee, _isActive, block.timestamp);
    }

    function updateFee(address _contractAddress, uint256 _newFee) external onlyOwner {
        require(contractsData[_contractAddress].registeredAt > 0, ContractDoesNotExist());
        uint256 _oldFee = contractsData[_contractAddress].fee;
        contractsData[_contractAddress].fee = _newFee;

        emit ContractFeeUpdated(_contractAddress, _oldFee, _newFee, block.timestamp);
    }

    function changeContractStatus(address _contractAddress, bool _isActive) external onlyOwner {
        require(contractsData[_contractAddress].registeredAt > 0, ContractDoesNotExist());
        contractsData[_contractAddress].isActive = _isActive;

        emit ContractStatusUpdated(_contractAddress, _isActive, block.timestamp);
    }
}
