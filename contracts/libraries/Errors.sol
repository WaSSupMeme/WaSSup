// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 * @title Errors
 * @author The team of certified degens
 * @notice Library containing all custom errors detailing cases where the contracts should revert
 */
library Errors {
  /// @notice An error emitted if an address supplied as an argument is the zero address
  error ZeroAddress();

  /// @notice An error emitted if the max supply is invalid (zero)
  error InvalidMaxSupply();

  /// @notice An error emitted if an amount is invalid (zero)
  error InvalidAmount();

  /// @notice An error emitted if the total amount does not match the sum of the amounts
  error InvalidTotalAmount();

  /// @notice An error emitted if the lengths of two arrays do not match
  error ArrayLengthMismatch();

  /// @notice An error emitted if an ERC20 transfer fails
  error ERC20TransferFailed();

  /// @notice An error emitted if user has insufficient balance
  error InsufficientBalance();

  /// @notice An error emitted if user has insufficient allowance
  error InsufficientAllowance();
}
