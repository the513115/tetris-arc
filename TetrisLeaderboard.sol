// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TetrisLeaderboard {
    struct Score {
        address player;
        uint256 score;
        string name;
        uint256 timestamp;
    }

    Score[] public topScores;
    mapping(address => uint256) public personalBest;
    mapping(address => uint256) public nonce;

    uint256 public constant MAX_ENTRIES = 20;

    event NewHighScore(address indexed player, uint256 score, string name);

    function submitScore(
        uint256 _score,
        string calldata _name,
        uint256 _timestamp,
        bytes calldata _signature
    ) external {
        require(_score > 0, "Score must be greater than 0");
        require(_timestamp + 300 > block.timestamp, "Signature expired");

        bytes32 messageHash = keccak256(
            abi.encodePacked(
                "\x19Ethereum Signed Message:\n32",
                keccak256(abi.encode(msg.sender, _score, _name, _timestamp, nonce[msg.sender]))
            )
        );

        address signer = recoverSigner(messageHash, _signature);
        require(signer == msg.sender, "Invalid signature");

        if (_score > personalBest[msg.sender]) {
            personalBest[msg.sender] = _score;
        }

        topScores.push(Score(msg.sender, _score, _name, block.timestamp));

        _sortAndTrim();
        nonce[msg.sender]++;

        emit NewHighScore(msg.sender, _score, _name);
    }

    function _sortAndTrim() internal {
        uint256 length = topScores.length;
        for (uint256 i = 0; i < length; i++) {
            for (uint256 j = i + 1; j < length; j++) {
                if (topScores[i].score < topScores[j].score) {
                    _swap(i, j);
                }
            }
        }
        while (topScores.length > MAX_ENTRIES) {
            topScores.pop();
        }
    }

    function _swap(uint256 i, uint256 j) internal {
        Score memory temp = topScores[i];
        topScores[i] = topScores[j];
        topScores[j] = temp;
    }

    function recoverSigner(bytes32 _messageHash, bytes calldata _signature) 
        internal pure returns (address) 
    {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);
        return ecrecover(_messageHash, v, r, s);
    }

    function splitSignature(bytes memory sig) 
        internal pure returns (bytes32 r, bytes32 s, uint8 v) 
    {
        require(sig.length == 65, "Invalid signature length");

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
    }

    // 查询函数
    function getTopScores() external view returns (Score[] memory) {
        return topScores;
    }

    function getMyBest(address _player) external view returns (uint256) {
        return personalBest[_player];
    }

    function getNonce(address _player) external view returns (uint256) {
        return nonce[_player];
    }
}