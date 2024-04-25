// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Errors} from "./libraries/Errors.sol";
import {IMemecoinDistributor} from "./interfaces/IMemecoinDistributor.sol";

/**
 * @title MemecoinDistributor
 * @author The team of certified degens
 * @notice Smart contract for distributing memecoins to eligible users
 */
contract MemecoinDistributor is IMemecoinDistributor {
  /**
   * @notice Airdrop ERC20 tokens to a list of eligible addressess
   * @param _token The address of the token to airdrop
   * @param _recipients The addresses to airdrop to
   * @param _amounts The amounts to airdrop
   * @param _totalAmount The total amount to airdrop
   */
  function airdropTokens(
    address _token,
    address[] calldata _recipients,
    uint256[] calldata _amounts,
    uint256 _totalAmount
  ) external {
    if (_token == address(0)) revert Errors.ZeroAddress();
    if (_recipients.length != _amounts.length)
      revert Errors.ArrayLengthMismatch();

    uint256 totalAmount = 0;

    for (uint256 i = 0; i < _recipients.length; i++) {
      if (_amounts[i] == 0) revert Errors.InvalidAmount();
      if (_recipients[i] == address(0)) revert Errors.ZeroAddress();
      totalAmount += _amounts[i];
    }

    if (totalAmount != _totalAmount) revert Errors.InvalidTotalAmount();

    for (uint256 i = 0; i < _recipients.length; i++) {
      bool success = IERC20(_token).transfer(_recipients[i], _amounts[i]);
      if (!success) revert Errors.ERC20TransferFailed();
    }

    emit Distributed(_token, _recipients, _amounts, totalAmount);
  }
}
