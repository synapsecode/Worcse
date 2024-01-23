const hre = require("hardhat");

async function main() {
  const argslist = [
    "Hello World"
  ];
  const contract = await hre.ethers.deployContract("Worcse", argslist);
  await contract.waitForDeployment();

  console.log(
    `Contract(Worcse) with deployed to ${contract.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});