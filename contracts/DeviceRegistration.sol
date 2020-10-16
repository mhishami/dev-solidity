/**
 * file: DeviceRegistration.sol
 * desc: A Device Registration Smart contract for access control
 * SPDX-License-Identifier: MIT
 */
pragma solidity ^0.6.0;

import '@openzeppelin/contracts/access/Ownable.sol';
contract DeviceRegistration is Ownable {

  //
  // address[x][y] = true/false
  mapping(address => mapping(bytes32 => bool)) private deviceList;

  function addDeviceId(address sender, string memory deviceId) public onlyOwner returns (bool) {
    bytes32 deviceHash = keccak256(abi.encodePacked(deviceId));
    deviceList[sender][deviceHash] = true;
    return true;
  }

  function validate(string memory deviceId) public view returns (bool) {
    bytes32 deviceHash = keccak256(abi.encodePacked(deviceId));
    return deviceList[msg.sender][deviceHash];
  }

}
