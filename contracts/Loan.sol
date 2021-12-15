//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract LoanFactory {
    address _user1;
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


    address admin;
    modifier onlyAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
    }
    function withdraw() external onlyAdmin() {
    }


    function() payable external {
    }



}




library myLibrary {
    function add10( unint a) pure public returns (uint) {
        return a + 10;
    }
}

contract new {
    function foo() external {
        uint result = myLibrary.add10(10)
    }
}







