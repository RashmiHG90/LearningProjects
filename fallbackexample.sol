//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//main contract
contract FF{

    event log(string message);
    fallback() external payable{
        emit log("Fallback function executed");
    }

    function getbalance() public view returns(uint){
        return address(this).balance;
    }
}

//supporting +executor contract
contract test{
    address payable scaddress;
    constructor(address payable _address){
    scaddress=_address;
}

//Function to  call Fallback Function
function callFF() public payable{
  //, is indication that ignoring remaining values
  //msg.value --> the amount of ethers
  (bool status,)=scaddress.call{value:msg.value}("sending Ethers");  
  require(status, "Fallback function call failed");
}
}