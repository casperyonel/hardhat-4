//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract myContract {
    uint a;

    struct User {
        string name;
    }

    User[] users;
    // This is a seperate array from struct User. 

    function foo() external {
        User storage user = users[0];
        // This is the pointer

        user.name = 'ghost';
    }
}