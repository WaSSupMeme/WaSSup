// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title MockToken
 * @author The team of certified degens
 * @notice Mock token contract for testing purposes
 */
contract MockToken is ERC20 {
  /**
   * @notice Constructor for the MockToken contract
   * @param _name The name of the token
   * @param _symbol The symbol of the token
   * @param _maxSupply The maximum supply of the token
   * @dev The token is minted only once and only to the deployer's address
   */
  constructor(
    string memory _name,
    string memory _symbol,
    uint256 _maxSupply
  ) ERC20 (_name, _symbol) {
    _mint(msg.sender, _maxSupply);
  }
}
