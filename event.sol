//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract valueAlert{
    uint price=10;
    event priceEvent(bool returnValue);

    function Checker(uint8 inPrice) public returns(bool flag){
        if(inPrice>price){
            emit priceEvent(true);
            return true;
        }
        emit priceEvent(false);
        return false;
    }
}