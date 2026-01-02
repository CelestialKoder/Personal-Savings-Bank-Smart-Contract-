// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SavingsBank 
{
    address public owner;
     constructor() 
    {
        owner = msg.sender;
    }
    function deposit() public payable
    {

    }
    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }
    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not the contract owner");
        require(_amount <= address(this).balance, "Insufficient balance");

        (bool success, ) = payable(owner).call{value: _amount}("");
        require(success, "Transfer failed");
    }
}
