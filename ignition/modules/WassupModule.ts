import {buildModule} from "@nomicfoundation/hardhat-ignition/modules";

const WassupModule = buildModule("WassupModule", (m) => {
  const owner = m.getParameter("owner");
  const minter = m.getParameter("minter");
  const name = m.getParameter("name");
  const symbol = m.getParameter("symbol");
  const lzEndpoint = m.getParameter("lzEndpoint");
  const maxSupply = m.getParameter("maxSupply");

  const wassup = m.contract("Wassup", [owner, minter, name, symbol, lzEndpoint, maxSupply]);

  return {wassup};
});

export default WassupModule;
