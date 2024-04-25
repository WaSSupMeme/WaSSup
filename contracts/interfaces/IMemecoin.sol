// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Permit.sol";

/**
 * @title IMemecoin
 * @author The team of certified degens
 * @notice Interface for the Memecoin contract
 */
interface IMemecoin is IERC20Permit {
  function burn(uint256 _amount) external;

  function burnFrom(address _account, uint256 _amount) external;

  function mainEid() external pure returns (uint256);
}
