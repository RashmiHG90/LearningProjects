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

    struct Patent{
        uint PatentNumber;
        string displayType;
        string title;
        address Inventor;
        uint createdDate;
        uint PublicationDate;
        uint pages;
        PatentStatus status;
        string IPType;
    }

    struct Copyright{
        string fullTitle;
        uint registrationNumber;
        string typeOfWork;
        uint dateOfCreation;
        uint dateOfPublication;
        address claimant;
        CopyRightStatus status;
        string IPType;
    }

    struct ownersList{
          uint IPNumber;
          address from;
          address to;
          uint timestamp;
    }

    enum TradeMarkStatus{New,Live_Registered, Dead_Cancelled}
    enum PatentStatus{Created, Published}
    enum CopyRightStatus{Registered, Published}
    enum IPType{TradeMark, Patent, CopyRight}

    TradeMark[] public registeredTradeMarks;
    ownersList[] public tdownerHistory;
    ownersList[] public tracktdowner;

    mapping (uint=> TradeMark) public tradeMarks;
    mapping (uint=> Patent) public patents;
    mapping (uint=> Copyright) public copyrights;

    uint public tdSerial = 300001;
    uint public patentNumber = 400001;
    uint public registrationNumber = 500001;

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
       TradeMark memory newTradeMark = TradeMark(_wordMark,TradeMarkStatus.New,_goodsAndServices,tdSerial,msg.sender,IPType.TradeMark);
       registeredTradeMarks.push(newTradeMark);    
       emit log("TradeMark Registered",tdSerial);   
    }

    /*
    Manage and update ownership rights
    transfer ownership securely 
    */

    function transferOwnership(uint _tdSerial, address _to) public{
        TradeMark memory tradeMark;
        ownersList memory newowner;
         for(uint i =0; i<registeredTradeMarks.length; i++){
            emit log("Ownership Transferred",_tdSerial);
            if(registeredTradeMarks[i].serialNumber == _tdSerial){
        tradeMark = registeredTradeMarks[i];
        newowner = ownersList(_tdSerial, tradeMark.owner, _to, block.timestamp);
        tdownerHistory.push(newowner);
        tradeMark.owner = _to;
        emit log("Ownership Transferred",_tdSerial); }
         }
    }
    /*
    verify IP
    allow third party verifier to authenticate and verify authenticity of IP
    */
    function verifyIP(uint _tdserial) public {
        for(uint i=0; i<registeredTradeMarks.length; i++){
       if(registeredTradeMarks[i].serialNumber == _tdserial && registeredTradeMarks[i].status == TradeMarkStatus.New){
            registeredTradeMarks[i].status = TradeMarkStatus.Live_Registered;
        }
        emit log("TradeMark Verified",_tdserial);
    }
    }

    /*
    View Intellectual property details
    provide public access to search and view registered IP rights, 
    including basic details and ownership history
    */
    function viewIP(uint _tdserial) public view returns (TradeMark memory){
        TradeMark memory tradeMark;
        for(uint i=0; i<registeredTradeMarks.length; i++){
            if(registeredTradeMarks[i].serialNumber == _tdserial){
         tradeMark = registeredTradeMarks[i];}
        }
        return tradeMark;
    }
    /*
    Track and record all ownership transfers
    ensuring a transparent transaction history
     ownersList[] public tdownerHistory;
    */
    function trackIP(uint _tdserial) public  returns(ownersList[] memory){
        for(uint i=0; i<tdownerHistory.length; i++){
            if(tdownerHistory[i].IPNumber == _tdserial){
       tracktdowner.push(tdownerHistory[i]);
    }
    }
    return tracktdowner;
    }
}