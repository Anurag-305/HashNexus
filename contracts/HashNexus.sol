Mapping of document hash to its details
    mapping(bytes32 => Document) private documents;

    event DocumentRegistered(bytes32 indexed docHash, address indexed owner, uint256 timestamp);

    /**
     * @dev Registers a document hash on the blockchain.
     * @param docHash The keccak256 hash of the document to register.
     */
    function registerDocument(bytes32 docHash) external {
        require(documents[docHash].timestamp == 0, "Document already registered.");
        documents[docHash] = Document(msg.sender, block.timestamp);
        emit DocumentRegistered(docHash, msg.sender, block.timestamp);
    }

    /**
     * @dev Verifies if a document hash exists and returns its details.
     * @param docHash The hash of the document to verify.
     * @return owner Address of the document uploader.
     * @return timestamp The registration time of the document.
     */
    function verifyDocument(bytes32 docHash) external view returns (address owner, uint256 timestamp) {
        require(documents[docHash].timestamp != 0, "Document not found.");
        Document memory doc = documents[docHash];
        return (doc.owner, doc.timestamp);
    }

    /**
     * @dev Checks whether a document hash is already registered.
     * @param docHash The hash to check.
     * @return True if the document exists, false otherwise.
     */
    function isRegistered(bytes32 docHash) external view returns (bool) {
        return documents[docHash].timestamp != 0;
    }
}
// 
update
// 
