import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("@nomiclabs/hardhat-waffle")

const config: HardhatUserConfig = {
  solidity: "0.8.9",
};

export default config;
