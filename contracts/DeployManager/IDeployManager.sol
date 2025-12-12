// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

/// @title IDeployManager - Factory for utility contracts
/// @author webb3george
/// @notice Interface defines the functions, errors and events for the DeployManager contract
interface IDeployManager is IERC165 {
    /// @notice Emitted when a new utility contract is added
    /// @param _contractAddress The address of the utility contract
    /// @param _fee The deployment fee(In Wei) for the utility contract
    /// @param _isActive The status of the utility contract
    /// @param _timestamp The timestamp when the contract was added
    event NewContractAdded(address _contractAddress, uint256 _fee, bool _isActive, uint256 _timestamp);
    event ContractFeeUpdated(address _contractAddress, uint256 _oldFee, uint256 _newFee, uint256 _timestamp);
    event ContractStatusUpdated(address _contractAddress, bool _isActive, uint256 _timestamp);
    event NewDeployment(address _contractAddress, address _deployer, uint256 _fee, uint256 _timestamp);

    struct ContractInfo {
        uint256 fee;
        bool isActive;
        uint256 registeredAt;
    }

    /// @dev Error if the contract is not active
    error ContractNotActive();

    /// @dev Not enough funds to deploy the contract
    error InsufficientFunds();

    /// @dev Error if the contract does not exist
    error ContractDoesNotExist();

    /// @dev Error if deployment fails
    error DeployFailed();

    /// @dev Error if transaction fails
    error TransactionFailed();

    /// @dev Error if the contract is not a utility contract
    error ContractIsNotUtilityContract();

    /// @notice Deploys a new instance of the specified utility contract
    /// @param _utilityContract The address of the utility contract to deploy
    /// @param _initData The initialization data for the new contract instance
    /// @return The address of the newly deployed contract instance
    /// @dev Emits a NewDeployment event upon successful deployment
    function deploy(address _utilityContract, bytes calldata _initData) external payable returns (address);

    function addNewContract(address _contractAddress, uint256 _fee, bool _isActive) external;

    function updateFee(address _contractAddress, uint256 _newFee) external;

    function changeContractStatus(address _contractAddress, bool _isActive) external;
}
