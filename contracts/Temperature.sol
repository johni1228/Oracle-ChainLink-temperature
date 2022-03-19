//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "github.com/provable-things/ethereum-api/provableAPI.sol";
import "hardhat/console.sol";

contract Temperature is usingProvable {

    uint public temp ;
    uint private subTemp = 0;

    event LogCurrentTemperature(string temp);
    event LogNewProvableQuery(string description);

    constructor() public {
        currentTemp();
    }

    function __callback(bytes32 _myid, string memory _result) public {
        require(msg.sender == provable_cbAddress());
        emit LogCurrentTemperature(_result);
        temp = parseInt(_result, 2);
    }

    function currentTemp() public payable {
        emit LogNewProvableQuery("Provable query was sent, standing by for the answer...");
        provable_query("URL", "xml(https://api.openweathermap.org/data/2.5/weather?q=London&mode=xml&appid=493458e0a06ff6e5bc64697fc01b6d78).current.temperature");
    }

    function getTemperature() public view returns (uint) {
        return temp.div(subTemp);
    }

    function setTemperature(uint _subTemp) public {
        subTemp = _subTemp;
    }
}
