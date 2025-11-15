//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
abstract contract Abstractcontract{

    function getstr(string memory _str) public pure virtual returns(string memory);
    function setValue(uint _in1, uint _in2) public virtual;

    function add() public virtual returns(uint);
}

contract derivedcontract is Abstractcontract{
    uint private num1;
    uint private num2;

    function getstr(string memory _string) public pure override returns(string memory){
        return _string;
    }

    function setValue(uint _in1, uint _in2) public override{
        num1=_in1;
        num2=_in2;
    }

    function add() public view override returns(uint){
        return(num1+num2);
    }
}