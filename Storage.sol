// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployeeStorage {
    uint16 private shares; 
    uint32 private salary; 
    uint256 public idNumber; 
    string public name; 

    constructor(uint16 _shares, string memory _name, uint32 _salary, uint _idNumber) {
        shares = _shares; 
        name = _name;
        salary = _salary; 
        idNumber = _idNumber;
    }

    function viewShares() public view returns (uint16) {
        return shares;
    }
    
    function viewSalary() public view returns (uint32) {
        return salary;
    }

    error TooManyShares(uint16 totalShares);
    
    function grantShares(uint16 _newShares) public {
        if (_newShares > 5000) {
            revert("Too many shares"); 
        } else if (shares + _newShares > 5000) {
            revert TooManyShares(shares + _newShares); 
        }
        shares += _newShares; 
    }

    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload(_slot)
        }
    }

    function debugResetShares() public {
        shares = 1000; 
    }
}