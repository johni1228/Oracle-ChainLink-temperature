//SPDX-License-Identifier: Unlicense
pragma solidity >= 0.5.0 < 0.6.0;

import "provable-eth-api/provableAPI.sol";

contract TemperatureOracle is usingProvable {

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
}
