// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// A community chest type of contract, you put money into the pot. The owner can withdraw it all.
contract Donate {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {
        require(msg.value > 0);
    }

    function balance() external view returns(uint256) {
        return address(this).balance;
    }

    function nominateNewOwner(address newOwner) external {
        require(msg.sender == owner);
        owner = payable(newOwner);
    }

    function withdraw() external {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
}
