//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.9 <0.9.0;

contract enumtest{

enum PizzaSize{ SMALL, MEDIUM,LARGE}

PizzaSize choice;
PizzaSize defaultChoice;

//PizzaSize constant defaultChoice = PizzaSize.SMALL;

constructor(){
    choice=PizzaSize.LARGE;
    defaultChoice=PizzaSize.SMALL;
}

function setLarge() public{
    choice=PizzaSize.LARGE;
}

function getChoice() public view returns(PizzaSize){
    return choice;
}

function getDefaultChoice() public view returns(PizzaSize){
    return defaultChoice;
}

function setMedeium() public {
    choice=PizzaSize.MEDIUM;
}

}