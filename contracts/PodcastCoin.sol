pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";

contract Podcast is ERC721Full {
    
    constructor() ERC721Full("Podcast", "PDCT") public {}
    
    using Counters for Counters.Counter;
    Counters.Counter tokenId;
    
    struct Podcast {
        string Title;
        string Publisher;
    }
    
    mapping(uint => Podcast) public podcast;
    
    function setPurchasePrice (uint256 purchasePrice) public onlyCreator {
        require(_PurchasePrice = 1 ether/50);
        purchasePrice = _PurchasePrice;
    }
    
    function setCurrentPrice(uint256 currentPrice) public onlyOwner {
        require (currentPrice >= _PurchasePrice);
        currentPrice = payee.transfer(_amount);
    }
    
    function purchaseToken  (uint256 tokenId) public payable {
        require msg.value >= currentPrice); // forces to pay equal or more for nft
        require (contractAddress.exists(_tokenId)); // checks if token exists
        address TokenSeller = contractAddress.ownerOf(_tokenId); // seller has the token
        nftAddress.safeTransferFrom(tokenSeller, msg.sender, tokenId); // transfering
        emit Received (msg.sender, _tokenId, msg.value, address(this).balance); // stuff happening
    }
    
    function sell(address newOwner) public {
        
    }
    
    function payRoyalties(address seller) private {
        
    }
    
    function distributeBonusEdition() public {
        
    }
    
    function mint() public {
        _mint();
    }
    
    function burn(uint tokenId) public {
        
    }
    
}