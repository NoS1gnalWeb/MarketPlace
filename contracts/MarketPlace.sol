// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MarketPlace{ 

    enum ShippingStatus{ PENDING, SHIPPED, DELIVERED }
    ShippingStatus status;
    address public owner;
    address customer;
    event MissionComplete();
    
    /*
        Initialisation du contrat entre le owner et le customer 
        avec le status shipped en PENDING.
    */
    constructor() public {
        owner = msg.sender;
        //customer = _customer;
        status = ShippingStatus.PENDING;
    }


    /*
      Change l'état du shipping en shipped
    */
    function Shipped() public {
        require(msg.sender == owner,
                "This function is restricted to the contract's owner");
        status = ShippingStatus.SHIPPED;
    }

    /*
      On change l'état en delivered tout en vérifiant qu'il s'agisse bien
      de l'owner, ensuite on emit l'event MissionComplete();
    */
    function Delivered() public {
        require(msg.sender == owner,
                "This function is restricted to the contract's owner");
        status = ShippingStatus.DELIVERED;
        emit MissionComplete();
    }
    
    /*

    */
    function getStatus() public view returns(ShippingStatus){
        require(msg.sender == owner, 
                "This function is restricted to the contract's owner");  
        return status;
    }

    /*

    */
    function Status() public payable returns(ShippingStatus){
        require(msg.sender == customer, "This function is restricted to the contract's customer");
        require(msg.value == 1 ** -5 ether);
        return status;
    }



}









