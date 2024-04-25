// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ILayerZeroEndpointV2} from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/ILayerZeroEndpointV2.sol";
import {Errors} from "./libraries/Errors.sol";
import {IMemecoin} from "./interfaces/IMemecoin.sol";

/**
 * @title Memecoin
 * @author The team of certified degens
 * @notice Memecoin token contract built using the LayerZero's OFT (Omnichain Fungible Token) standard
 */
contract Memecoin is ERC20, ERC20Burnable, ERC20Permit, Ownable {
  /// @notice The LayerZero enpoint ID of the main chain (Base)
  uint256 public constant MAIN_ENDPOINT_ID = 30184;

  /**
   * @notice Constructor for the Memecoin contract
   * @param _owner The owner of the contract
   * @param _minter The address that will receive the max supply of the token initially (on the main chain)
   * @param _name The name of the token
   * @param _symbol The symbol of the token
   * @param _lzEndpoint The address of the LayerZero endpoint contract for the chain of deployment
   * @param _maxSupply The maximum supply of the token
   * @dev The token is minted only once and only to the minter's address on the main chain
   */
  constructor(
    address _owner,
    address _minter,
    string memory _name,
    string memory _symbol,
    address _lzEndpoint,
    uint256 _maxSupply
  ) ERC20(_name, _symbol) ERC20Permit(_name) {
    if (_minter == address(0)) revert Errors.ZeroAddress();
    if (_owner == address(0)) revert Errors.ZeroAddress();
    if (_maxSupply == 0) revert Errors.InvalidMaxSupply();

    _transferOwnership(_owner);

    if (ILayerZeroEndpointV2(_lzEndpoint).eid() == MAIN_ENDPOINT_ID) {
      _mint(_minter, _maxSupply);
    }
  }

  /**
   * @notice Get the LayerZero endpoint ID of the main chain
   * @return The LayerZero endpoint ID of the main chain
   */
  function mainEid() external pure returns (uint256) {
    return MAIN_ENDPOINT_ID;
  }
}
