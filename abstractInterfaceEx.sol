//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Interface: Only function declarations, no implementations
interface IVehicle{
    //function declaration
    function startEngine() external pure returns(string memory);
    function stopEngine() external pure returns(string memory);
}

//Abstract contract: can have both implemented and unimplemented functions
abstract contract AbstractVehical{
    abstract contract AbstractVehicle{
        string public brand = "Generic vehicle";
        function horn() public pure returns(string memory){
            return "Beep! Beep!";
        }

        //Abstract function (no body)
        function fuelType() public view virtual returns(string memory);
    }
}

///Concrete contract: Implements both interface and abstract contract
contract Car is IVehicle, AbstractVehicle{
    function startEngine() external pure override returns(string memory){
        return "Car engine started!";
    }

    function stopEngine() external pure override returns(string memory){
        return "Car engine stopped!";
    }
    function fuelType() public pure override returns(string memory){
        return "Petrol";
    }
    
}