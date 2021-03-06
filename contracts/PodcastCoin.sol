pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";

contract Podcast is ERC721Full, Ownable {
    
    constructor() ERC721Full("Podcast", "PDCT") public {}
    
    using Counters for Counters.Counter;
    Counters.Counter tokenId;
    
    struct Podcast {
        string Title;
        string Publisher;
    }

    uint _PurchasePrice;
    address contractAddress = address(this);
    address buyer;
    address payable creator;
    address [] buyers = new address [5];
    
    modifier onlyCreator {
        require msg.sender == creator;
    }
    
    event Received (address owner, uint tokenId, uint value, uint contractBalance);
    
    /// mapping(uint => Podcast) public podcast;
    
    mapping(string => uint) hashes;
    
    function createNFT(address creator, string memory hash, string memory metadata) public returns (uint) {
        require(hashes[hash] != 1);
        require(creator == msg.sender, "You are not the owner of this contract");
        hashes[hash] = 1;
        tokenId.increment();
        uint newItemId = tokenId.current();
        _mint(creator, newItemId);
        _setTokenURI(newItemId, metadata);
        return newItemId;
    }

    function setPurchasePrice (uint256 purchasePrice) public onlyCreator {
        require(_PurchasePrice = 1 ether/50);
        purchasePrice = _PurchasePrice;
    }
    
    function setCurrentPrice(uint256 currentPrice) public onlyOwner {
        require (currentPrice >= _PurchasePrice);
        currentPrice = msg.value;
    }

    
    function purchaseToken (uint256 tokenId, address tokenSeller) public payable {
        require (msg.value >= currentPrice); // forces to pay equal or more for nft
        require (contractAddress.exists(_tokenId)); // checks if token exists
        
        address TokenSeller = contractAddress.ownerOf(_tokenId); // seller has the token
        
        uint royalty = (msg.value/100) * 3;
        creator.transfer(royalty);
        
        tokenSeller.transfer(msg.value);
        
        safeTransferFrom(tokenSeller, msg.sender, tokenId); // transfering
        emit Received (msg.sender, _tokenId, msg.value, address(this).balance);
    }
    

    
    function distributeBonusEdition() public {
        
        
        if originalPurchaser = savedAddressesDictionary
        from savedAddressesDictionary
            select random
            distributeBonsusEdition
    }

    
    function burn(uint tokenId) public {
        
    }
    
}