// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

contract BuyMeCoffee {
    /********ERRORS********/
    error BuyMeCoffee__SendMoreThanZeroToBuyMeCoffee();
    error BuyMeCoffee__NotEnoughBalanceInTheContract();
    error BuyMeCoffee__TransferFailed();

    /********TYPE DECLARATIONS********/
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    /********STATE VARIABLES********/
    address payable s_owner;
    Memo[] s_memos;

    /********EVENTS********/
    // Event to emit when a new coffee is bought
    event NewMemo(address indexed from, uint256 timestamp, string name, string message);

    /********MODIFIERS********/
    modifier onlyOwner() {
        require(msg.sender == s_owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        s_owner = payable(msg.sender);
    }

    /********RECEIVE FUNCTION********/
    receive() external payable {
        // Emit an event when a new coffee is bought
        emit NewMemo(msg.sender, block.timestamp, "", "");
    }

    /********FALLBACK FUNCTION********/
    fallback() external payable {
        // Emit an event when a new coffee is bought
        emit NewMemo(msg.sender, block.timestamp, "", "");
    }

    /********EXTERNAL FUNCTIONS********/
    /**
     * @dev buy a coffee for contract owner
     * @param _name name of the coffee buyer
     * @param _message a nice message from the coffiee buyer
     */
    function buyCoffee(string memory _name, string memory _message) external payable {
        if(msg.value <= 0) {
            revert BuyMeCoffee__SendMoreThanZeroToBuyMeCoffee();
        }

        s_memos.push(Memo(msg.sender, block.timestamp, _name, _message));

        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    /**
     * @dev send specific amount of tips to the owner
     * @param _amount that the owner wants to withdraw
     */
    function withdrawTips(uint256 _amount) external payable onlyOwner {
        if(_amount > address(this).balance) {
            revert BuyMeCoffee__NotEnoughBalanceInTheContract();
        }

        (bool success, ) = s_owner.call{value: _amount}("");

        if(!success) {
            revert BuyMeCoffee__TransferFailed();
        }

    }

    /********PUBLIC FUNCTIONS********/

    /**
     * @dev return all the memos
     */
    function getMemos() public view returns(Memo[] memory) {
        return s_memos;
    }

    function getOwner() public view returns (address) {
        return s_owner;
    }
}
