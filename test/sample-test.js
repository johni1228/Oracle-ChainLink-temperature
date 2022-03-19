const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Temperature", function () {
  it("Should return the getting and setting temperature", async function () {
    const currentTemp = fetch(`https://api.openweathermap.org/data/2.5/weather?q=London&appid=${process.env.TEMP_API_KEY}`)
    const Temperature = await ethers.getContractFactory("Temperature");
    const temperature = await Temperature.deploy();
    await temperature.deployed();

    expect(await temperature.getTemperature()).to.equal(currentTemp);
  });
});
