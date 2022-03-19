const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Temperature", function () {
  it("Should return the getting and setting temperature", async function () {

    const Temperature = await ethers.getContractFactory("Temperature");
    const temperature = await Temperature.deploy();
    await temperature.deployed();

    const contractTemp = await temperature.currentTemp();
    console.log(contractTemp);
    
  });
});
