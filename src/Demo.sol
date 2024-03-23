// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Demo{
    //require
    //revert
    //assert
    address owner;

    event Paid(address _from, uint _amount, uint _timestamp);

    constructor(){
        owner = msg.sender;
    }

    function pay() external payable {
      emit Paid(msg.sender, msg.value, block.timestamp);
    }

    modifier onlyOwner(address _to){
        require(msg.sender == owner, "You are not a owner!");
        require(_to != address(0), "incorent address!");
        _;
    }

    function withdraw(address payable  _to) external {
        // assert(msg.sender == owner); use carefully
        // require(msg.sender == owner, "You are not a owner!"); 
        if(msg.sender != owner){
          revert("you are not an owner!");  
        }
        _to.transfer(address(this).balance);
    }

}