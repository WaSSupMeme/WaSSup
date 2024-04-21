// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {OFT, ILayerZeroEndpoint} from "@layerzerolabs/solidity-examples/contracts/token/oft/v1/OFT.sol";
import {Errors} from "./libraries/Errors.sol";
import {IMemecoin} from "./interfaces/IMemecoin.sol";

/**
 * @title Memecoin
 * @author The team of certified degens
 * @notice Memecoin token contract built using the LayerZero's OFT (Omnichain Fungible Token) standard
 */
contract Memecoin is OFT, IMemecoin {
  /// @notice The chain ID of the main chain (Base)
  uint256 public constant MAIN_CHAIN_ID = 184;

  /**
   * @notice Constructor for the Memecoin contract
   * @param _minter The address that will receive the max supply of the token initially (on the main chain)
   * @param _name The name of the token
   * @param _symbol The symbol of the token
   * @param _lzEndpoint The address of the LayerZero endpoint contract for the chain of deployment
   * @param _maxSupply The maximum supply of the token
   * @dev The token is minted only once and only to the minter's address on the main chain
   */
  constructor(
    address _minter,
    string memory _name,
    string memory _symbol,
    address _lzEndpoint,
    uint256 _maxSupply
  ) OFT(_name, _symbol, _lzEndpoint) {
    if (_minter == address(0)) revert Errors.ZeroAddress();
    if (_lzEndpoint == address(0)) revert Errors.ZeroAddress();
    if (_maxSupply == 0) revert Errors.InvalidMaxSupply();

    if (ILayerZeroEndpoint(_lzEndpoint).getChainId() == MAIN_CHAIN_ID) {
      _mint(_minter, _maxSupply);
    }
  }

  /**
   * @notice Burn tokens from the sender's account
   * @param _amount The amount of tokens to burn
   */
  function burn(uint256 _amount) external {
    if (_amount == 0) revert Errors.InvalidAmount();
    if (balanceOf(msg.sender) < _amount) revert Errors.InsufficientBalance();

    _burn(msg.sender, _amount);
  }

  /**
   * @notice Burn tokens from the owner's account if the sender has the necessary allowance
   * @param _from The address to burn tokens from
   * @param _amount The amount of tokens to burn
   */
  function burnFrom(address _from, uint256 _amount) external {
    if (_amount == 0) revert Errors.InvalidAmount();
    if (balanceOf(_from) < _amount) revert Errors.InsufficientBalance();
    if (allowance(_from, msg.sender) < _amount)
      revert Errors.InsufficientAllowance();

    _burn(_from, _amount);
  }

  /**
   * @notice Get the chain ID of the main chain
   * @return The chain ID of the main chain
   */
  function getMainChainId() external pure returns (uint256) {
    return MAIN_CHAIN_ID;
  }
}
