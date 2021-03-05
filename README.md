# Music for the People
Mint Audio NFTs for sale, with a bit of a smart contract royalties coming back to the artist.
Mark, Jorge, Victor, James

## Why
There have always been issues for artists when they share their music. From people stealing copyrighted work, to illegally downloading songs, to having to compete in an overcrowded market. 

Now, how can we fix the problem? Create scarcity in the product by uploading music onto the blockchain creating a limited supply, and at the same time you will avoid the possibility of illegal reproduction of the work.

This will be appealing to artists, and could be the future of the music industry as not only does it keep the market and people honest, but it is also more profitable. Therefore, with the help of smart contracts and blockchain a wave of new opportunities for distribution will be possible.

## Goal
We want to test the limits of what an NFT is and might become. This project is founded upon the premise of NFT exploration. We think NFTs might be the future and we plan to use our last two weeks as Owls to experiment within this niche of blockchain technology that allows artists to prove unique ownership and distribution rights of their work while giving customers the chance to purchase one of a kind, digitally-based art.

Our main objective will be to put an audio file, may it be a slam poem spoken aloud by James or the recording of Mark’s 7th grade talent show where he sang California Girls, on the Kovan Testnet using a smart contract.

Our secondary objective will be to fine-tune our smart contract to create 5 NFTs of the audio file and put them up for sale on the test net, allowing our fellow classmates to purchase our NFT.

Our third objective is writing a white paper of sorts that explains the current construction of our smart contract in plain English. Furthermore, the white paper would analyze the current state of NFTs and how our audio smart contract could be used in the future.


## How
Smart contract for artist


Mint NFT tokens - direct sale of audio files (same audio file). We’ll have 5 editions, plus 1 bonus edition remix that will randomly go to one of the first buyers of the 5 editions.


Tokens have associated edition art that goes with them - buyer gets art and music. Five editions get the same art, bonus edition gets other art.


Bonus edition - you get unreleased audio file and unreleased art.


Royalties (seller doesn’t receive these amounts from tx)
5 regular editions 3% royalty to artist
1 bonus edition 6% royalty to artist

## Next Steps:
Send proposal to Cam
Mark gets audio file or doesn't and practices slam poetry
James - contract pseudo and finding details we may need, see how audio and art may combine, send proposal to Cam
Call Victor and bring up to date
Test the concept of putting an audio file on blockchain (done by Saturday March 6th)
Whitepaper outline + research 
Create presentation and practice delivery

### General Links on audio NFTs:
https://www.cblackmoore.com/single-post/audionfts
https://foundation.app/jacquesgreene/promise-640
https://mintable.app/music/item/ALORIUM-melody-pack-by-Illmind-A-collection-of-10-melody-compositions/dr84jcf7jJP96rG
https://cointelegraph.com/news/grammy-winning-producer-illmind-auctions-rights-to-new-samples-as-nft
https://www.youtube.com/watch?v=6b8OANmw2kM
https://medium.com/pinata/how-to-mint-an-audio-nft-to-sell-1733cd864090

## functions:

sellPrice -Mark
Sell
payRoyaties -James
distributedBonusEdition
Mint
Burn



Features
 
* Artist will mint 5 tokens -- with a bonus token added randomly to one of the five
* Artist will sell tokens -- at a set price (~$50), hardcoded that you cannot sell for less than this (#numbergoup)
* Customer will sell token -- each producing a 3% royalty back to creator -- 6% for bonus
* Artist receives royalties automatically as each tx occurs
