
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysExercise {
    uint[] private numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; 
    uint[] private timestamps; 
    address[] private senders; 

    uint256 private constant Y2K = 946702800; 

    function getNumbers() external view returns (uint[] memory) {
        return numbers; 
    }

    function resetNumbers() public {
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; 
    }

    function appendToNumbers(uint[] calldata _toAppend) public {
   
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    function saveTimestamp(uint _unixTimestamp) public {
        timestamps.push(_unixTimestamp);
        senders.push(msg.sender);
    }

    function afterY2K() public view returns (uint256[] memory, address[] memory) {
        uint256 count = 0;

        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > Y2K) {
                count++;
            }
        }

        uint256[] memory timestampsAfterY2K = new uint256[](count);
        address[] memory sendersAfterY2K = new address[](count);

        uint256 index = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > Y2K) {
                timestampsAfterY2K[index] = timestamps[i];
                sendersAfterY2K[index] = senders[i];
                index++;
            }
        }


        return (timestampsAfterY2K, sendersAfterY2K);
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps; 
    }
}
