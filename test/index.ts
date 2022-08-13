import { expect } from "chai";
import { ethers } from "hardhat";

describe("ERC721 Transfer Control", () => {
  it("Should deploy the contract", async () => {
    const TestERC721TransferControl = await ethers.getContractFactory("TestERC721TransferControl");
    const testERC721TransferControl = await TestERC721TransferControl.deploy();
    await testERC721TransferControl.deployed();
    expect(await testERC721TransferControl.totalSupply()).to.equal(0);
  });
});
