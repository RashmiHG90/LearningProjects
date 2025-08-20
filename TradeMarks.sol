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

    struct owner{
          uint IPNumber;
          address from;
          address to;
          uint timestamp;
    }

    enum TradeMarkStatus{New,Live_Registered, Dead_Cancelled}
    enum IPType{TradeMark, Patent, CopyRight}

    uint[] public registeredTradeMarks;
    owner[] public tdownerHistory;
    owner[] public tracktdowner;
    address public thirdPartyVerifier;

    mapping (uint=> TradeMark) public tradeMarks;
   
    uint public tdSerial = 300001;

    event log(string message, uint number);

    modifier onlyOwner(uint _tdserial) {
      require(msg.sender == tradeMarks[_tdserial].owner, "only IP owner can perform this action");
        _;      
    }    
    
    modifier onlythridPartyVerifier() {
      require(msg.sender == thirdPartyVerifier, "only third party verifier can perform this action");
        _;      
    }   

    constructor(address  _thirdPartyVerifier) {
      thirdPartyVerifier = _thirdPartyVerifier;
    }
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
    
        require(tradeMarks[_tdserial].serialNumber != 0, "TradeMark not found");
        TradeMark memory newTradeMark = TradeMark(      
        tradeMarks[_tdserial].wordMark,
        tradeMarks[_tdserial].status,
        tradeMarks[_tdserial].goodsAndServices,
        tradeMarks[_tdserial].serialNumber,
        tradeMarks[_tdserial].owner,
        tradeMarks[_tdserial].ipType);
        
        return newTradeMark;
    }
    
    function verifyIP(uint _tdserial) public onlythridPartyVerifier returns (bool) {
      require(tradeMarks[_tdserial].serialNumber != 0, "TradeMark not found");
      if(tradeMarks[tdSerial].status == TradeMarkStatus.New){
          tradeMarks[tdSerial].status = TradeMarkStatus.Live_Registered;
          return true;
      } else{
          return false;
      }
    }

    /*
    Manage and update ownership rights
    transfer ownership securely 
    */

    function transferIp(address _to, uint _tdserial) public onlyOwner(_tdserial) {
     require(tradeMarks[_tdserial].serialNumber != 0, "TradeMark not found");
     owner memory newowner = owner(tradeMarks[_tdserial].serialNumber,tradeMarks[_tdserial].owner,_to,block.timestamp);
     tdownerHistory.push(newowner);
     tradeMarks[_tdserial].owner = _to;
     emit log("Ownership Transferred",_tdserial);
    }
   
   function trackIPOwnerHistory(uint _tdserial) public returns (owner[] memory) {
    for(uint i=0; i<tdownerHistory.length; i++) {
       if(tdownerHistory[i].IPNumber == _tdserial) {
        tracktdowner.push(tdownerHistory[i]);
       }
    }
    return tracktdowner;
   } 
}