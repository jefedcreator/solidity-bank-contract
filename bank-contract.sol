// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Send Funds from EOC to contract address 
//Withdraw funds
//Check balance
//deposit

contract Bank{
    address public immutable owner;
    uint private bank_balance;
    mapping(address => uint) User_balance;
    event EventVariable(bytes data);

    constructor() {
        owner = payable(msg.sender);
    }

    function Balance() public view returns(uint){
        return User_balance[msg.sender];
    } 

    function Transfer(uint _amount, address _bankAddr) public payable{
        require(User_balance[msg.sender] >= _amount, "Insufficient Balanace");
        User_balance[msg.sender] -= msg.value;
        bank_balance -= msg.value;
        // _bankAcc += msg.value;
       (, bytes memory data) = _bankAddr.call{value: _amount}("");
        emit EventVariable(data);
    }

    function Withdraw(uint _amount) public payable{
         require(User_balance[msg.sender] >= _amount, "Insufficient Balanace");
        User_balance[msg.sender] -= msg.value;
        bank_balance -= msg.value;
        // _bankAcc += msg.value;
       (, bytes memory data) = msg.sender.call{value: _amount}("");
        emit EventVariable(data);
    }

    function Deposit(uint _amount) public payable{
        bank_balance += _amount;
        User_balance[msg.sender] += _amount;
    }
}