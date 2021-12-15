//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract LoanFactory {
    Loan[] loans;
    function createLoan() external  {
        Loan loan1 = new Loan(100); // Pointer creates new Loan contract
        loans.push(loan1); // So we can access this loan in THIS contract
        address(loan1); // For if you just want to store address of loan1

        loan1.reimburse(_user1);
      }
}
contract Loan {
    uint public amount;
    constructor(uint _amount) public {
        amount = _amount;
    }

    function reimburse(address _address, uint amountRepay) external {
        require(_address != msg.sender);
        require(address(this).balance > amountRepay); // Confirm enough funds
        _address.balance += amountRepay;
    }
}







