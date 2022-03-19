//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Temperature is Ownable {

  uint256 private temperature;

  mapping (address => true) contraller; 
  
  modifier isContraller() {
    require(contraller[msg.sender], "not Contraller");
    _;
  }

  // only set Gnosis address
  function setContraller(address _newAddress) external onlyOwner {    
    contraller[_newAddress] = true;
  }

  function getTemperature() public view returns (uint256) {
    return temperature;
  }

  function setTemperature(uint256 _temperature) public returns(uint256) isContraller{
    temperature = _temperature;
  }

}