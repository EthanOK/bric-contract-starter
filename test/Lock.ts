import { expect } from "chai";
import { network } from "hardhat";

const { ethers } = await network.connect();

describe("Lock", function () {
  it("Should deploy the Lock contract", async function () {
    const [owner, alice] = await ethers.getSigners();
    const currentTimestamp = Math.floor(Date.now() / 1000);
    const unlockTime = currentTimestamp + 30 * 24 * 60 * 60;
    const lock = await ethers.deployContract("Lock", [unlockTime], owner);
    expect(await lock.unlockTime()).to.equal(unlockTime);
    expect(await lock.owner()).to.equal(owner.address);
  });
});
