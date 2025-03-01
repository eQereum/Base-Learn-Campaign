// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract GarageManager {
    mapping(address => Car[]) private garages;

    struct Car {
        string make; 
        string model; 
        string color; 
        uint numberOfDoors; 
    }

    error BadCarIndex(uint256 index);


    function addCar(string memory _make, string memory _model, string memory _color, uint _numberOfDoors) external {
        garages[msg.sender].push(Car(_make, _model, _color, _numberOfDoors));
    }

    function getMyCars() external view returns (Car[] memory) {
        return garages[msg.sender];
    }

    function getUserCars(address _user) external view returns (Car[] memory) {
        return garages[_user];
    }


    function updateCar(uint256 _index, string memory _make, string memory _model, string memory _color, uint _numberOfDoors) external {
        if (_index >= garages[msg.sender].length) {
            revert BadCarIndex({index: _index}); // بازگشت با خطای سفارشی اگر اندیس نامعتبر باشد
        }
        garages[msg.sender][_index] = Car(_make, _model, _color, _numberOfDoors);
    }

    function resetMyGarage() external {
        delete garages[msg.sender];
    }
}