// app.js
const express = require('express');
const bodyParser = require('body-parser');
const Web3 = require('web3');
const { abi, evm } = require('./build/contracts/NFTMarketplace.json'); // Replace with the path to your compiled smart contract JSON

const app = express();
const port = 3001;

app.use(bodyParser.json());

// Connect to Ethereum node
const web3 = new Web3('http://localhost:8545'); // Update with your Ethereum node URL
const contractAddress = '0x1234567890123456789012345678901234567890'; // Replace with your deployed contract address
const nftMarketplaceContract = new web3.eth.Contract(abi, contractAddress);

app.post('/createNFT', async (req, res) => {
    const accounts = await web3.eth.getAccounts();
    await nftMarketplaceContract.methods.createNFT().send({  
        from: accounts[0],
        gas: '3000000',
    });

    res.json({ success: true });
});

app.post('/listNFT', async (req, res) => {
    const { tokenId } = req.body;
    const accounts = await web3.eth.getAccounts();
    await nftMarketplaceContract.methods.listNFT(tokenId).send({
        from: accounts[0],
        value: nftMarketplaceContract.methods.listingPrice().call(),
        gas: '3000000',
    });

    res.json({ success: true });
});

app.post('/buyNFT', async (req, res) => {
    const { tokenId } = req.body;
    const accounts = await web3.eth.getAccounts();
    await nftMarketplaceContract.methods.buyNFT(tokenId).send({
        from: accounts[0],
        value: nftMarketplaceContract.methods.listingPrice().call(),
        gas: '3000000',
    });

    res.json({ success: true });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
