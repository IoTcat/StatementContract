// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StatementContract {
    string public statement;
    
    // Hardcoded IoTcat's address
    address public constant owner = 0x24e9b47D4d823956CcCcd55eda1471a47De215e4;

    event StatementChanged(string newStatement);
    event UnauthorizedAccess(address sender);

    modifier onlyIoTcat() {
        if (msg.sender != owner) {
            emit UnauthorizedAccess(msg.sender);
        }
        require(msg.sender == owner, "Only IoTcat can call this function");
        _;
    }

    function store(string memory newStatement) public onlyIoTcat {
        statement = newStatement;
        emit StatementChanged(newStatement);
    }
}
