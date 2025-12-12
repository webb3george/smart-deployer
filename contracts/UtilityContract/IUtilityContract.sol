// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

interface IUtilityContract is IERC165 {
    error DeployManagerCannotBeZeroAddress();
    error NotDeployManager();
    error FailedToDeployManager();

    function initialize(bytes memory _initData) external returns (bool);

    //function getDeployManager() external view returns (address);
}
