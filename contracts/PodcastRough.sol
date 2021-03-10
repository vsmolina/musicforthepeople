pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";

contract PodcastCoin is ERC721Full, Ownable {
    
    uint randomNumber;
    
    constructor(uint _randomNumber) ERC721Full("Podcast", "PDCT") public {
        require(_randomNumber < 5, "Set your random number between 0-4");
        randomNumber = _randomNumber;
    }
    
    using Counters for Counters.Counter;
    Counters.Counter tokenIds;
    
    struct Podcast {
        string Title;
        string Publisher;
    }
    
    uint purchasePrice;
    uint256 currentPrice;
    address contractAddress = address(this);
    // address buyer;
    address payable creator;
    address[] public buyers;
    /*
    modifier onlyCreator {
        require (msg.sender == creator);
        _;
    }
    */
    event Received (address owner, uint tokenId, uint value, uint contractBalance);
    
    mapping(uint => Podcast) public podcast;
    
    // mapping(string => uint) hashes;
    
    function createNFT(address owner, string memory title, string memory publisher, string memory tokenURI) public returns (uint) {
        // require(hashes[hash] != 1);
        // hashes[hash] = 1;
        
        tokenIds.increment();
        uint tokenId = tokenIds.current();
        _mint(owner, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        podcast[tokenId] = Podcast(title, publisher);
        
        return tokenId;
    }
    
    function createBonusEdition(address _creator, string memory title, string memory publisher, string memory tokenURI) public returns (uint) {
        // require(hashes[hash] != 1);
        // hashes[hash] = 1;
        
        tokenIds.increment();
        uint tokenId = tokenIds.current();
        _mint(_creator, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        podcast[tokenId] = Podcast(title, publisher);
        
        return tokenId;
    }
    
    function distributeBonusEdition(address _creator, uint _tokenId) public {
        /*if originalPurchaser = savedAddressesDictionary
        from savedAddressesDictionary
            select random
            distributeBonsusEdition*/
        address luckyBuyer = buyers[randomNumber];
        
        safeTransferFrom(_creator, luckyBuyer, _tokenId);
        
        // emit Received (msg.sender, _tokenId, msg.value, address(this).balance);
            
    }
}  