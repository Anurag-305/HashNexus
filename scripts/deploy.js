// scripts/deploy.js
const hre = require("hardhat");

async function main() {
  // Compile the contracts before deploying (optional in latest Hardhat)
  await hre.run("compile");

  console.log("Deploying HashNexus contract...");

  // Get the contract factory
  const Project = await hre.ethers.getContractFactory("Project");

  // Deploy the contract
  const project = await Project.deploy();

  // Wait for deployment
  await project.waitForDeployment();

  // Log the deployed address
  console.log(`✅ HashNexus (Project.sol) deployed to: ${await project.getAddress()}`);
}

// Handle errors
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
