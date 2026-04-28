# Tetris Leaderboard on Arc Testnet

A simple yet fun Web3 Tetris leaderboard dApp built on **Arc Testnet**, featuring wallet connection, anti-cheat signature verification, and real-time ranking.

![HTML](https://img.shields.io/badge/HTML-100%25-orange)
![Solidity](https://img.shields.io/badge/Solidity-0.8.24-363636)
![Arc Testnet](https://img.shields.io/badge/Arc%20Testnet-Active-00D4FF)

## ✨ Features

- Connect with **MetaMask** wallet
- Submit scores with **ECDSA signature verification** (anti-cheat protection)
- Real-time **Top 20 Leaderboard**
- Fully deployed on **Arc Testnet** (USDC as native gas token)
- Lightweight frontend (pure HTML + ethers.js)

## 🚀 Quick Start

1. Open the [demo page](tetris-arc.html)
2. Click **"Connect MetaMask Wallet"**
3. Switch network to **Arc Testnet**
4. Play Tetris and submit your high score!

## 📜 Contract Information

- **Contract Address**: `0x00839dcfe60Dc09037D4C31A12BbcD9617CFaafA`
- **Network**: Arc Testnet (Chain ID: 5042002)
- **Explorer**: [https://testnet.arcscan.app](https://testnet.arcscan.app)

## 📁 Project Files

- `tetris-arc.html` — Main frontend (wallet connection, score submission, leaderboard)
- `TetrisLeaderboard.sol` — Solidity smart contract with anti-cheat mechanism

## 🛠️ How to Run Locally

```bash
# Run in the project directory
python -m http.server 8000
