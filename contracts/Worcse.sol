// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorcseContract {
    address public buyer;
    address public seller;
    address public escrowAgent;

    uint256 public amount;
    bool public isFundsReleased;
    bool public isRefunded;

    event FundsDeposited(address indexed depositor, uint256 amount);
    event FundsReleased(address indexed receiver, uint256 amount);
    event FundsRefunded(address indexed refundReceiver, uint256 amount);

    constructor(address _buyer, address _seller) {
        buyer = _buyer;
        seller = _seller;
        escrowAgent = msg.sender;
    }

    function depositFunds() external payable onlyBuyer fundsNotReleased fundsNotRefunded {
        amount += msg.value;
        emit FundsDeposited(msg.sender, msg.value);
    }

    function releaseFunds() external onlyEscrowAgent fundsNotRefunded {
        require(isFundsReleased == false, "Funds have already been released");
        payable(seller).transfer(amount);
        isFundsReleased = true;
        emit FundsReleased(seller, amount);
    }

    function refundFunds() external onlyEscrowAgent fundsNotReleased {
        require(isRefunded == false, "Funds have already been refunded");
        payable(buyer).transfer(amount);
        isRefunded = true;
        emit FundsRefunded(buyer, amount);
    }

    // ====================== Modifiers ===================

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only the buyer can call this function");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can call this function");
        _;
    }

    modifier onlyEscrowAgent() {
        require(msg.sender == escrowAgent, "Only the escrow agent can call this function");
        _;
    }

    modifier fundsNotReleased() {
        require(!isFundsReleased, "Funds have already been released");
        _;
    }

    modifier fundsNotRefunded() {
        require(!isRefunded, "Funds have already been refunded");
        _;
    }
}
