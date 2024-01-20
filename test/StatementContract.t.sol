// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "../src/StatementContract.sol";

contract StatementContractTest is DSTest {
    Vm vm = Vm(HEVM_ADDRESS);
    StatementContract statementContract;
    address owner = 0x24e9b47D4d823956CcCcd55eda1471a47De215e4;
    address nonOwner = address(0x2);

    function setUp() public {
        statementContract = new StatementContract();
    }

    function testOwnerCanUpdateStatement() public {
        // Prank the owner address
        vm.prank(owner);
        statementContract.store("New statement");

        // Assert that the statement was updated
        assertEq(statementContract.statement(), "New statement");
    }

    function testNonOwnerCannotUpdateStatement() public {
        // Expect a revert for the next call
        vm.expectRevert("Only IoTcat can call this function");

        // Prank a non-owner address
        vm.prank(nonOwner);
        statementContract.store("Should fail");
    }
}
