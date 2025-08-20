// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract IntellectualProperty{

    struct TradeMark{
      string wordMark;
      TradeMarkStatus status;
      string goodsAndServices;
      uint serialNumber;
      address owner;  
      IPType ipType;    
    }

    struct owners{
          uint IPNumber;
          address from;
          address to;
          uint timestamp;
    }

    enum TradeMarkStatus{New,Live_Registered, Dead_Cancelled}
    enum IPType{TradeMark, Patent, CopyRight}

    uint[] public registeredTradeMarks;
    owners[] public tdownerHistory;
    owners[] public tracktdowner;

      TradeMark public tradeMark;

    mapping (uint=> TradeMark) public tradeMarks;
    mapping(uint=> owners) public tmOwnersHistory;

    uint public tdSerial = 300001;

    event log(string message, uint number);

    /*
    register new IP with 
    type(patent,copyright,trademark)
    description & owner information.
     struct TradeMark{
      string wordMark;
      TradeMarkStatus status;
      string goodsAndServices;
      uint serialNumber;
      address owner;  
      IPType ipType;    
    */
    function registerIP(string memory _wordMark, string memory _goodsAndServices) public {
      tdSerial++;   

        tradeMarks[tdSerial].wordMark = _wordMark;
        tradeMarks[tdSerial].status = TradeMarkStatus.New;
        tradeMarks[tdSerial].goodsAndServices = _goodsAndServices;
        tradeMarks[tdSerial].serialNumber = tdSerial;
        tradeMarks[tdSerial].owner = msg.sender;
        tradeMarks[tdSerial].ipType = IPType.TradeMark;
       
       registeredTradeMarks.push(tdSerial);    
       emit log("TradeMark Registered",tdSerial);   
    }


    /*
    View Intellectual property details
    provide public access to search and view registered IP rights, 
    including basic details and ownership history
    */

    function viewIP(uint _tdserial) public view returns (TradeMark memory) {
    
    for (uint i = 0; i < registeredTradeMarks.length; i++) {
        if (registeredTradeMarks[i] == _tdserial) {
             TradeMark memory newTradeMark = TradeMark(      
    tradeMarks[_tdserial].wordMark,
    tradeMarks[_tdserial].status,
    tradeMarks[_tdserial].goodsAndServices,
    tradeMarks[_tdserial].serialNumber,
    tradeMarks[_tdserial].owner,
    tradeMarks[_tdserial].ipType);
    
    return newTradeMark;
        }
    }   
    revert("TradeMark not found");
}

    /*
    Manage and update ownership rights
    transfer ownership securely 
    */

    function transferIp(address _to, uint _tdserial) public {
     tmOwnersHistory[tdSerial].IPNumber = _tdserial;
     tmOwnersHistory[tdSerial].from = msg.sender;
     tmOwnersHistory[tdSerial].to = _to;
     tmOwnersHistory[tdSerial].timestamp = block.timestamp;
    }
   
}