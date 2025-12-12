// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "../UtilityContract/AbstractUtilityContract.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC721Airdropper is AbstractUtilityContract, Ownable {
    constructor() payable Ownable(msg.sender) {}

    IERC721 public token;
    address public treasury;

    uint256 public constant MAX_AIRDROP_BATCH_SIZE = 300;

    error AlreadyInitialized();
    error NoApprovedTokens();
    error ArraysLengthMissmatch();
    error TransferFailed();
    error BatchSizeExceeded();

    modifier notInitialized() {
        require(!initialized, AlreadyInitialized());
        _;
    }

    bool private initialized;

    function initialize(bytes memory _initData) external override notInitialized returns (bool) {
        (address _deployManager, address _tokenAddress, address _treasury, address _owner) =
            abi.decode(_initData, (address, address, address, address));

        setDeployManager(_deployManager);

        token = IERC721(_tokenAddress);
        treasury = _treasury;

        Ownable.transferOwnership(_owner);

        initialized = true;
        return (true);
    }

    function getInitData(address _deployManager, address _tokenAddress, address _treasury, address _owner)
        external
        pure
        returns (bytes memory)
    {
        return (abi.encode(_deployManager, _tokenAddress, _treasury, _owner));
    }

    function airdrop(address[] calldata receivers, uint256[] calldata tokenIds) external onlyOwner {
        require(tokenIds.length <= MAX_AIRDROP_BATCH_SIZE, BatchSizeExceeded());
        require(receivers.length == tokenIds.length, ArraysLengthMissmatch());
        require(token.isApprovedForAll(treasury, address(this)), NoApprovedTokens());

        for (uint256 i = 0; i < receivers.length;) {
            token.safeTransferFrom(treasury, receivers[i], tokenIds[i]);
            unchecked {
                ++i;
            }
        }
    }
}
