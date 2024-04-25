// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./Memecoin.sol";

/**
 * @title Wassup
 * @author The team of certified degens
 * @notice The official Wassup meme token contract (learn more at https://wassup.meme)
 */
contract Wassup is Memecoin {
  /**
   * @notice Constructor for the Wassup token contract
   * @param _owner The owner of the contract
   * @param _minter The address that will receive the max supply of the Wassup token initially on Base and distribute it in an airdrop
   * @param _name The name of the token
   * @param _symbol The symbol of the token
   * @param _lzEndpoint The address of the LayerZero endpoint contract for the chain of deployment (Base)
   * @param _maxSupply The maximum supply of the Wassup token
   */
  constructor(
    address _owner,
    address _minter,
    string memory _name,
    string memory _symbol,
    address _lzEndpoint,
    uint256 _maxSupply
  ) Memecoin(_owner, _minter, _name, _symbol, _lzEndpoint, _maxSupply) {}
}
