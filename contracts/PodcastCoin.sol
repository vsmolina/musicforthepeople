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
    
    function sellPrice(uint price) public {
        
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