pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/lifecycle/Pausable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract PodcastCoinDeployer is Ownable, Pausable/*, Destructible */{
    event Sent(address indexed payee, uint256 amount, uint256 balance);
    event royaltySent(address indexed payee, uint256 amount, uint256 balance);
    event Received(address indexed payer, uint tokenId, uint256 amount, uint256 balance);
    ERC721 public nftAddress;
    uint256 public currentPrice;
    address payable creator = msg.sender;
    // Input the address of the nft and the price it is going to be sold at
    constructor(address _nftAddress, uint256 _currentPrice) public {
        require(_nftAddress != address(0) && _nftAddress != address(this));
        require(_currentPrice > 0);
        nftAddress = ERC721(_nftAddress);
        currentPrice = _currentPrice;
    }
    // Allows someone to purchase a token at a set price
    // instead of simply transferring ownership
    function purchaseToken(uint256 _tokenId) public payable whenNotPaused {
        require(msg.sender != address(0) && msg.sender != address(this));
        require(msg.value >= currentPrice);
        // require(nftAddress._exists(_tokenId));
        address tokenSeller = nftAddress.ownerOf(_tokenId);
        nftAddress.safeTransferFrom(tokenSeller, msg.sender, _tokenId);
        emit Received(msg.sender, _tokenId, msg.value, address(this).balance);
    }
    // sends payment to the correct address
    function sendTo(address payable _payee, uint256 _amount) public onlyOwner {
        require(_payee != address(0) && _payee != address(this));
        require(_amount > 0 && _amount <= address(this).balance);
        uint royalty = (_amount/100) * 3;
        creator.transfer(royalty);
        uint remainder = _amount - royalty;
        _payee.transfer(remainder);
        emit royaltySent(_payee, royalty, address(this).balance);
        emit Sent(_payee, remainder, address(this).balance);
    }
    // sets the purchase price based on market conditions
    function setCurrentPrice(uint256 _currentPrice) public onlyOwner {
        require(_currentPrice > 0);
        currentPrice = _currentPrice;
    }
}
