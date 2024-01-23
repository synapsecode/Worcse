// Import necessary modules from Hardhat
const { expect } = require("chai");
const { ethers } = require("hardhat");

// Hardhat test suite
describe("Escrow Contract", function () {
    let worcseContract;
    let owner;
    let member1;
    let member2;

    // Deploy the contract before each test
    beforeEach(async function () {
        [owner, member1, member2] = await ethers.getSigners();
        const WorcseContract = await ethers.getContractFactory("WorcseContract");
        const arglist = [
            "Hello World"
        ];
        worcseContract = await WorcseContract.deploy(...arglist);
    });

    // Test case 1: Contract initialization
    it("Should initialize the contract correctly", async function () {
    });
});
