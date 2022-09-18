const main = async () => {
  const HotelRoom = await hre.ethers.getContractFactory("HotelRoom");
  const hotelroom = await HotelRoom.deploy();

  await hotelroom.deployed();

  console.log("HotelRoom address: ", hotelroom.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
