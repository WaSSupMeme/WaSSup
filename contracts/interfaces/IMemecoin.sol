// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 * @title IMemecoin
 * @author The team of certified degens
 * @notice Interface for the Memecoin contract
 */
interface IMemecoin {
  function burn(uint256 _amount) external;

  function burnFrom(address _owner, uint256 _amount) external;

  function getMainChainId() external pure returns (uint256);
}
