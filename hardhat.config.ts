import {HardhatUserConfig} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

require("@nomicfoundation/hardhat-chai-matchers")

const config: HardhatUserConfig = {
    solidity: "0.8.17",
};

export default config;
