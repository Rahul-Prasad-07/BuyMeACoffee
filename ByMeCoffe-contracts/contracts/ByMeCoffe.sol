// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ByMeCoffe {

    //Event to emmit when a Memo is created
    event NewMemo (
        address indexed from,
        uint256 timestamp,
        string name ,
        string message
    );


     struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    address payable owner ;

    Memo[] memoes;

    constructor(){
        owner = payable(msg.sender);
    }

   


    function ByMeACoffe (string _name , string _message) public payable {

        require(msg.sender >0, "cant bye coffe for free");

        memoes.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );

    }

    function withdrawTips() public {

        require(owner.send(address(this).balance));


    }

    function getMemoes() public view returns (Memo[] memory){
        return memoes;

    }
}