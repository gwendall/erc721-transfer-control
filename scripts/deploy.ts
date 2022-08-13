import { ethers } from "hardhat";

async function main() {

  const TestERC721TransferControl = await ethers.getContractFactory("TestERC721TransferControl");
  const testERC721TransferControl = await TestERC721TransferControl.deploy();

  await testERC721TransferControl.deployed();

  console.log("TestERC721TransferControl deployed to:", testERC721TransferControl.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
