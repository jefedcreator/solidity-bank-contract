// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Send Funds from EOC to contract address 
//Withdraw funds
//Check balance
//deposit

contract Bank{
    address public immutable owner;
    uint private bankBalance;
    mapping(address => uint) private userBalances;
    event EventVariable(bytes data);

    constructor() {
        owner = payable(msg.sender);
    }

    function Balance() public view returns(uint){
        return userBalances[msg.sender];
    } 

    function Transfer(uint _amount, address _bankAddr) public payable{
        require(msg.sender == owner, "Only the owner can transfer funds");

        require(userBalances[msg.sender] >= _amount, "Insufficient Balanace");
        userBalances[msg.sender] -= msg.value;
        bankBalance -= msg.value;

       (, bytes memory data) = _bankAddr.call{value: _amount}("");
        emit EventVariable(data);
    }

    function Withdraw(uint _amount) public payable{
        require(msg.sender == owner, "Only the owner can withdraw funds");

        require(userBalances[msg.sender] >= _amount, "Insufficient Balanace");
        userBalances[msg.sender] -= msg.value;
        bankBalance -= msg.value;

       (, bytes memory data) = msg.sender.call{value: _amount}("");
        emit EventVariable(data);
    }

    function Deposit(uint _amount) public payable{
        bankBalance += _amount;
        userBalances[msg.sender] += _amount;
    }
}