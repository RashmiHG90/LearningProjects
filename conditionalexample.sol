//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract conditional{
    int num1;
    bool public result;

    function condition(int _num1) public{
        num1=_num1;
        if(num1>100){
            result=true;
        }else{
            result= false;
        }
        }
    }

contract ternary{
    int num1;
    bool public result;

    function condition(int _num1) public{
        num1=_num1;
        num1>100? result=true:result=false;
    }
}