pragma solidity ^0.4.24;
import "../MessagedSRS20.sol";
import "zeppelin-solidity/contracts/access/Whitelist.sol";

contract BasicWhitelistToken is MessagedSRS20, Whitelist {
    constructor () public {
        messagesAndCodes.addMessage(1, "ILLEGAL_TRANSFER_TO_NON_WHITELISTED_ADDRESS");
    }

    function detectTransferRestriction (address from, address to, uint value)
        public
        view
        returns (uint restrictionCode)
    {
        if (whitelist(to)) {
            restrictionCode = 1; // illegal transfer outside of whitelist
        } else {
            restrictionCode = 0; // successful transfer (required)
        }
    }
}