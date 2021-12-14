//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract myContract {
    uint a;

    event NewTrade (
        uint date, 
        address indexed from, 
        address to, 
        uint amount
    ); 

    function trade(address to, uint amount) external {
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
 
    mapping(address => uint) balances;

    function invest() external payable {
        if (msg.value < 1 ether) {
            revert();
        }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns(uint) {
        return address(this).balance;
    }

    function sendEther (address payable recipient) external {
        recipient.transfer(100);
    }

    address payable[] recipients;
}