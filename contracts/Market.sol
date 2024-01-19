// initialize solidity 
// import counters.sol
// import reentrancy guard 
// import erc721

// import hardhat console

// initialize NftMarket contract
//use counters for incrementing values


//counter for each individual item that will be created-itemid


//counter for each item sold
//we need to keep up with no of items sold because solidity doesnt support dynamic length arrays. so need to know the length of the array 
//create a variable for the owner of the contract  and make it payable bcause the owner will get a commision on each item sold
//so listing fee is charged. anyone who wants to list an item should pay the lsiting fee. and owner of the contract gets a commision from that fee



//set the owner as the msg.sender as the owner will be deploying this contract


//define a struct called marketitem for each individual market item. struct is a map /object . it holds other values 


// create a mapping for all the market items that are being created
// so we map a uint256(the itemid) to a marketitem= so that you can fetch the marketitem based on the itemid


//event called marketitemcreated for when a market item is created- it will match the marketitem struct
//so we need to emit an event every time a new marketitem is created
//this is useful if u want to listen to events from a frontend application


//function to get the listing price. when we deploy this contract we dont know what the listingprice is at the front end
// so with this function we can call the contract , get the listing price and send the correct amount of payment

