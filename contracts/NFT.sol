// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "hardhat/console.sol";

// install openzeppelin and hardhat 




contract NFT is ERC721URIStorage {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddres;
    
    constructor(address marketplaceAddress) ERC721("Metaverse", "METT") {
        //then set the contractAddress as argument for marketplaceaddress
        //beacuse we need the address of marketplace before deploying the contract
        //now we can access the marketplace by referencing the contractAddress
        contractAddress = marketplaceAddress;
    }


//function for minting new tokens
//only need to pass tokenURI because we already stored the marketplaceaddrerss and the tokenids and
//we also know that msg.sender is going to mint the tokens
    function createToken(string memory tokenURI) public returns (uint) {
        //beacuse this function mints token so increment tokenids
        _tokenIds.increment();
        //newitemid will get the current value of the tokenids 
        uint256 newItemId = _tokenIds.current();
 //mint the token-pass in the msg.sender as the creator and id of current token being minted as the newitemid
        _mint(msg.sender, newItemId);
//set the tokenuri - get the id of the current token being minted as newitemid and pass in the tokenURI to set the current token uri 
        _setTokenURI(newItemId, tokenURI);
//give the marketplace the approval to transact these tokens/NFTS- if we did not do this then we wont be able to transact from other contracts
//pass in the contract address which is same as marketplace address
        setApprovalForAll(contractAddress, true);
        // if we decide to interact with the contract from the client side then we need to mint the token first
        // then set it for sale and then do the transaction.
        //to set it for sale we need to get the current tokenid. thats why we return the current tokenid=newitemid
        return newItemId;
    }
}

