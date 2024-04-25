// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 * @title IMemecoinDistributor
 * @author The team of certified degens
 * @notice Interface for the MemecoinDistributor contract
 */
interface IMemecoinDistributor {
  event Distributed(
    address indexed token,
    address[] addresses,
    uint256[] amounts,
    uint256 totalAmount
  );

  function airdropTokens(
    address _token,
    address[] calldata _addresses,
    uint256[] calldata _amounts,
    uint256 _totalAmount
  ) external;
}
