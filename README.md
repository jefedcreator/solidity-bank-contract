# Bank Smart Contract

The Bank Smart Contract is a simple Ethereum-based contract that allows users to deposit, withdraw, and transfer funds between user accounts and the contract address. The contract also provides a function to check the user's balance.

## Features

1. Check user balance
2. Deposit funds to the contract
3. Withdraw funds from the contract
4. Transfer funds between user accounts and the contract address

## Prerequisites

- Solidity >=0.7.0 <0.9.0
- Ethereum development environment (e.g., Truffle, Remix, etc.)

## Functions

### Constructor

The constructor initializes the contract and sets the owner to the address deploying the contract.

### Balance

`function Balance() public view returns(uint)`

This function allows users to check their account balance. It returns the balance of the caller's address.

### Transfer

`function Transfer(uint _amount, address _bankAddr) public payable`

This function allows users to transfer a specified amount of funds from their account to another address. The sender must have sufficient balance to complete the transfer. An event is emitted upon successful transfer with the transaction data.

### Withdraw

`function Withdraw(uint _amount) public payable`

This function allows users to withdraw a specified amount of funds from their account. The sender must have sufficient balance to complete the withdrawal. An event is emitted upon successful withdrawal with the transaction data.

### Deposit

`function Deposit(uint _amount) public payable`

This function allows users to deposit a specified amount of funds into their account. The deposited amount is added to the user's balance.

## Events

### EventVariable

`event EventVariable(bytes data)`

This event is emitted when a user transfers or withdraws funds, containing the transaction data.

## Usage

1. Deploy the Bank Smart Contract to the Ethereum network using your preferred development environment.
2. Interact with the deployed contract by calling the functions to deposit, withdraw, transfer, or check your balance.
3. Monitor the events emitted by the contract to track transactions.

## License

This smart contract is licensed under the [GPL-3.0 License](https://spdx.org/licenses/GPL-3.0-or-later.html).
