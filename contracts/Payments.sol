// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Payments {
    //Struct
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }

    struct Balance {
        uint totalPayments;
        mapping(uint => Payment) paymants;
    }
    mapping(address => Balance) public balances;

    function currentBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getPayment(
        address _addr,
        uint _index
    ) public view returns (Payment memory) {
        return balances[_addr].paymants[_index];
    }

    function pay(string memory message) public payable {
        uint paymentNum = balances[msg.sender].totalPayments;
        balances[msg.sender].totalPayments++;

        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );

        balances[msg.sender].paymants[paymentNum] = newPayment;
    }

    //Byte
    // bytes32 public myVar = "test here";
    // bytes public myDynVar = "test here";

    // function demo() public view returns (bytes1) {
    //     return myDynVar[0];
    // }

    //Aray
    //    uint[] public items;
    //    uint public len;
    //    function demo() public {
    //     items.push(4);
    //     items.push(5);
    //     len = items.length;
    //    }

    //    function sampleMemory() public view returns(uint[] memory) {
    //     uint[] memory tempArray = new uint[](10);
    //     tempArray[0] = 1;
    //     return tempArray;
    //    }
    //    uint[10][2] public  items;

    //    function demo() public {
    //       items = [
    //         [3, 4, 5],
    //         [6,7,8]
    //       ];
    //    }

    // Enum
    //    enum Status { Paid, Delivered, Received }
    //    Status public currentStatus;

    //    function pay() public {
    //     currentStatus = Status.Paid;
    //    }

    //    function delivered() public {
    //     currentStatus = Status.Delivered;
    //    }
}
