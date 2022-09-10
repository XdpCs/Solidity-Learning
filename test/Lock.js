"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const hardhat_network_helpers_1 = require("@nomicfoundation/hardhat-network-helpers");
const withArgs_1 = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const chai_1 = require("chai");
const hardhat_1 = require("hardhat");
describe("Lock", function () {
    // We define a fixture to reuse the same setup in every test.
    // We use loadFixture to run this setup once, snapshot that state,
    // and reset Hardhat Network to that snapshot in every test.
    async function deployOneYearLockFixture() {
        const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
        const ONE_GWEI = 1000000000;
        const lockedAmount = ONE_GWEI;
        const unlockTime = (await hardhat_network_helpers_1.time.latest()) + ONE_YEAR_IN_SECS;
        // Contracts are deployed using the first signer/account by default
        const [owner, otherAccount] = await hardhat_1.ethers.getSigners();
        const Lock = await hardhat_1.ethers.getContractFactory("Lock");
        const lock = await Lock.deploy(unlockTime, { value: lockedAmount });
        return { lock, unlockTime, lockedAmount, owner, otherAccount };
    }
    describe("Deployment", function () {
        it("Should set the right unlockTime", async function () {
            const { lock, unlockTime } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
            (0, chai_1.expect)(await lock.unlockTime()).to.equal(unlockTime);
        });
        it("Should set the right owner", async function () {
            const { lock, owner } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
            (0, chai_1.expect)(await lock.owner()).to.equal(owner.address);
        });
        it("Should receive and store the funds to lock", async function () {
            const { lock, lockedAmount } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
            (0, chai_1.expect)(await hardhat_1.ethers.provider.getBalance(lock.address)).to.equal(lockedAmount);
        });
        it("Should fail if the unlockTime is not in the future", async function () {
            // We don't use the fixture here because we want a different deployment
            const latestTime = await hardhat_network_helpers_1.time.latest();
            const Lock = await hardhat_1.ethers.getContractFactory("Lock");
            await (0, chai_1.expect)(Lock.deploy(latestTime, { value: 1 })).to.be.revertedWith("Unlock time should be in the future");
        });
    });
    describe("Withdrawals", function () {
        describe("Validations", function () {
            it("Should revert with the right error if called too soon", async function () {
                const { lock } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
                await (0, chai_1.expect)(lock.withdraw()).to.be.revertedWith("You can't withdraw yet");
            });
            it("Should revert with the right error if called from another account", async function () {
                const { lock, unlockTime, otherAccount } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
                // We can increase the time in Hardhat Network
                await hardhat_network_helpers_1.time.increaseTo(unlockTime);
                // We use lock.connect() to send a transaction from another account
                await (0, chai_1.expect)(lock.connect(otherAccount).withdraw()).to.be.revertedWith("You aren't the owner");
            });
            it("Shouldn't fail if the unlockTime has arrived and the owner calls it", async function () {
                const { lock, unlockTime } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
                // Transactions are sent using the first signer by default
                await hardhat_network_helpers_1.time.increaseTo(unlockTime);
                await (0, chai_1.expect)(lock.withdraw()).not.to.be.reverted;
            });
        });
        describe("Events", function () {
            it("Should emit an event on withdrawals", async function () {
                const { lock, unlockTime, lockedAmount } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
                await hardhat_network_helpers_1.time.increaseTo(unlockTime);
                await (0, chai_1.expect)(lock.withdraw())
                    .to.emit(lock, "Withdrawal")
                    .withArgs(lockedAmount, withArgs_1.anyValue); // We accept any value as `when` arg
            });
        });
        describe("Transfers", function () {
            it("Should transfer the funds to the owner", async function () {
                const { lock, unlockTime, lockedAmount, owner } = await (0, hardhat_network_helpers_1.loadFixture)(deployOneYearLockFixture);
                await hardhat_network_helpers_1.time.increaseTo(unlockTime);
                await (0, chai_1.expect)(lock.withdraw()).to.changeEtherBalances([owner, lock], [lockedAmount, -lockedAmount]);
            });
        });
    });
});
