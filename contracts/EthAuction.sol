/**
 *Submitted for verification at sepolia.scrollscan.com on 2024-11-11
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//pragma solidity ^0.8.0;

/**
 * @title EthAuction
 * @dev Auction contract for Eth course - Hugo Jaca
 * Funciones:
 *      Constructor. Inicializa la subasta con los parámetros necesario para su funcionamiento.
 *      Función para ofertar: Permite a los participantes ofertar por el artículo. Para que una oferta sea válida debe ser mayor que la mayor oferta actual al menos en 5% y debe realizarse mientras la subasta esté activa.
 *      Mostrar ganador: Muestra el ofertante ganador y el valor de la oferta ganadora.
 *      Mostrar ofertas: Muestra la lista de ofertantes y los montos ofrecidos.
 *      Devolver depósitos: Al finalizar la subasta se devuelve el depósito a los ofertantes que no ganaron, descontando una comisión del 2% para el gas.
 * Manejo de depósitos:
 *      Las ofertas se depositan en el contrato y se almacenan con las direcciones de los ofertantes.
 * Eventos:
 *      Nueva Oferta: Se emite cuando se realiza una nueva oferta.
 *      Subasta Finalizada: Se emite cuando finaliza la subasta.
 */
contract EthAuction {
    // var definition
    mapping (address => uint256) public bidsList;
    mapping (address => uint256) public bidsAmount;

    uint256 public starTime;
    uint256 public endTime;
    uint256 public bidHighestBid;
    uint256 public bidMinPercent2;
    uint256 public bidMinPercent;

    bool public isActive;

    address public bidOwner;
    address public bidHighestBider;

    address[] public bidBiders;

    // modifiers
    modifier onlyOwner() {
        require(msg.sender == bidOwner, "You are not the bid owner");
        _;
    }

    modifier isAuctionActive() {
        require(isActive, "The auction is not active");
        _;
    }

    modifier isAuctionFinished() {
        require(!isActive, "The auction is active");
        _;
    }

    // constructor
    constructor (uint256 bidTime) {
        isActive = true;
        starTime = block.timestamp;
        endTime = block.timestamp + bidTime;
        bidOwner = msg.sender;
        bidHighestBid = 0;
       
    }

    // functions
    // sendBid: send a new bid for auction
    function sendBid() external payable isAuctionActive {
        require(isActive, "The auction is not active");
        require(endTime > block.timestamp, "The auction is finished");
        require(msg.value > bidHighestBid * 105 / 100, "Your bid must be 5% higher than the highest bid");
        
        // is the highest bid amount?
        if (msg.value > bidHighestBid) {
            bidHighestBid   = msg.value;
            bidHighestBider = msg.sender;
        }

        // save bid in list and generate event
        bidsList[msg.sender] = msg.value;
        bidsAmount[msg.sender] += msg.value;

        emit newBid(msg.sender, msg.value);

        // it's first bid of sender
        if (bidsList[msg.sender] == 0) {
            bidBiders.push(msg.sender);
        }

        // leave 10 min for other bids
        if (endTime <= block.timestamp + 10 minutes) {
            endTime = block.timestamp + 10 minutes;
        }
    }

    // showWinner: print winner and amount
    function getWinner() external view isAuctionFinished returns (address) {
//      require(IsAuctionFinished, "Winner can be shown after auction is finished");
        return bidHighestBider;    
    }

    // showBidList: print the list of biders and amounts
    function getBids() external view returns (address[] memory, uint256[] memory) {
        uint256 _biders = bidBiders.length;
        uint256[] memory _bidAmount = new uint256[](_biders);
        address[] memory _bidBiders = new address[](_biders);

        for (uint256 i = 0; i < _biders; i++) {
            _bidBiders[i] = bidBiders[i];
            _bidAmount[i] = bidsAmount[bidBiders[i]];
        }
        return (_bidBiders, _bidAmount);
    }

    // showBidList: print the list of biders and amounts
    function getHighestBid() external view returns (uint256) {
        return bidHighestBid;
    }

    // sendBalanceToOwner: send final balance to owner
    function sendBalanceToOwner() internal isAuctionFinished {
                
        payable(bidOwner).transfer(address(this).balance);
    }
    // returnBids: return bid's amount to biders that do not win
    function returnBids() internal isAuctionFinished {
        uint256 _biders = bidBiders.length;
        
        for (uint256 i = 0; i < _biders; i++) {
            address _bider = bidBiders[i];
            uint256 _amount = bidsAmount[_bider];

            // do not return amount to winner 
            if (_bider != bidHighestBider) {
                payable(_bider).transfer(_amount * 98 / 100);
                bidsAmount[_bider] = 0;
            }
        }
    }

    // finishAuction: mark the auction finished
    function finishAuction() external onlyOwner isAuctionActive {
        // change auction state to not active, generate event & return deposits
        isActive = false;

        emit IsAuctionFinished(bidHighestBider, bidHighestBid);
        
        returnBids();
    }

    // withdrawDeposit: for a bider, keep the last bid and withdraw the previous amount
    function withdrawDeposit() external isAuctionFinished {
        uint256 amount = bidsAmount[msg.sender] - bidsList[msg.sender];
        
        payable (msg.sender).transfer(amount);
        bidsAmount[msg.sender] = bidsList[msg.sender];
    }

    // events
    event newBid(address indexed bider, uint256 amount);
    event IsAuctionFinished(address indexed bider, uint256 amount);
   
}