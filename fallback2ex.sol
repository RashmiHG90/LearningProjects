//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Fallback2Ex{
    event log(string _msg);
    event showGas(uint _gasLeft);
    event logBool(bool _msg);

    fallback() external payable{
        emit log("fallback called");
        emit showGas(gasleft());
        emit logBool(msg.value > 0);
    }

    function getBalance() external view returns(uint256){
        return address(this).balance;
    }
}

contract caller2Ex{
    function sendMoney_call(address payable _to) public payable{
        (bool retVal,) = _to.call{value: msg.value}("");
        require(retVal == true, "Failed to send");
    }
}