// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ManualToken {
    // my_address -> 10 tokens;
    mapping(address => uint256) private s_balances;

    // function name() public pure returns (string memory) {
    //     return "Manual Token";
    // }

    string public name = "Manual Token";

    function totalSupply() public pure returns (uint256) {
        return 100 ether; //1000000000000000000
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[msg.sender] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}