// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 * @title Utils
 * @author The team of certified degens
 * @notice Library containing some of the utility functions useful for the project
 */
library Utils {
  /**
   * @notice Check if an address is a contract
   * @param _address The address to check
   * @return isContract True if the address is a contract, false otherwise
   */
  function isContract(address _address) external view returns (bool) {
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return size > 0;
  }

  /**
   * @notice Get the total amount of an array of amounts
   * @param _amounts The amounts to sum
   * @return totalAmount The total amount
   */
  function getTotalAmount(
    uint256[] calldata _amounts
  ) external pure returns (uint256) {
    uint256 totalAmount = 0;

    for (uint256 i = 0; i < _amounts.length; i++) {
      totalAmount += _amounts[i];
    }

    return totalAmount;
  }
}
