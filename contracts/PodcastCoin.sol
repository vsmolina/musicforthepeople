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
    
    modifier onlyCreator {
        require (msg.sender == creator);
        _;
    }
    
    event Received (address owner, uint tokenId, uint value, uint contractBalance);
    
    mapping(uint => Podcast) public podcast;
    
    // mapping(string => uint) hashes;
    
    function createNFT(/*address owner,*/ string memory title, string memory publisher, string memory tokenURI) public onlyCreator returns (uint) {
        // require(hashes[hash] != 1);
        // hashes[hash] = 1;
        
        tokenIds.increment();
        uint tokenId = tokenIds.current();
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        podcast[tokenId] = Podcast(title, publisher);
        
        return tokenId;
    }
    
    function createBonusEdition(address _creator, string memory title, string memory publisher, string memory tokenURI) public onlyCreator returns (uint) {
        // require(hashes[hash] != 1);
        // hashes[hash] = 1;
        
        tokenIds.increment();
        uint tokenId = tokenIds.current();
        _mint(_creator, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        podcast[tokenId] = Podcast(title, publisher);
        
        return tokenId;
    }
    /*
    function setPurchasePrice (uint256 _purchasePrice) public onlyCreator {
        require(_purchasePrice == 1 ether/50);
        purchasePrice = _purchasePrice;
    }
    */
    /*function setCurrentPrice(uint256 _currentPrice) public onlyOwner {
        require (_currentPrice >= purchasePrice);
        currentPrice = msg.value;
    }*/
    /*
    function purchaseToken (uint256 _tokenId, address payable tokenSeller) public payable onlyOwner {
        require (msg.value >= currentPrice);// forces to pay equal or more for nft
        require(currentPrice >= 1 ether/50);
        // require (podcast[_tokenId].exists); // checks if token exists
        
        // address TokenSeller = ownerOf(_tokenId); // seller has the token
        
        uint royalty = (msg.value/100) * 3;
        creator.transfer(royalty);
        
        tokenSeller.transfer(msg.value);
        
        safeTransferFrom(tokenSeller, msg.sender, _tokenId); // transfering
        if (_tokenId <= 5) {
            buyers.push(msg.sender);
        }
        
        emit Received (msg.sender, _tokenId, msg.value, address(this).balance);
    }
    */
    
    
    function distributeBonusEdition(address _creator, uint _tokenId) public onlyCreator {
        /*if originalPurchaser = savedAddressesDictionary
        from savedAddressesDictionary
            select random
            distributeBonsusEdition*/
        address luckyBuyer = buyers[randomNumber];
        
        safeTransferFrom(_creator, luckyBuyer, _tokenId);
        
        // emit Received (msg.sender, _tokenId, msg.value, address(this).balance);
            
    }
    
    //function burn(uint tokenId) public {
    //}
    
}