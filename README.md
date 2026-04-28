# 俄罗斯方块排行榜（Arc Testnet）

一个基于 **Arc Testnet** 的俄罗斯方块游戏排行榜 dApp，支持钱包连接、签名提交分数和实时排行榜显示。

## 项目特点

- 部署在 **Arc Testnet**（Circle 推出的 USDC 原生 L1 链）
- 使用 Solidity 智能合约实现防作弊排行榜（带 ECDSA 签名验证）
- 前端使用纯 HTML + ethers.js 实现
- 支持 MetaMask 钱包连接与签名提交分数
- 简单易部署，适合学习 Web3 游戏开发

## 快速体验

1. 打开以下链接（推荐用 Chrome + MetaMask）：
   [tetris-arc.html](tetris-arc.html)

2. 点击 **“连接 MetaMask 钱包”**
3. 切换到 **Arc Testnet** 网络
4. 玩俄罗斯方块后提交你的最高分！

## 合约信息

- **合约地址**： `0x00839dcfe60Dc09037D4C31A12BbcD9617CFaafA`
- **网络**： Arc Testnet (Chain ID: 5042002)
- **区块浏览器**： [https://testnet.arcscan.app](https://testnet.arcscan.app)

## 项目文件

- `tetris-arc.html` —— 主页面（包含连接钱包、提交分数、排行榜）
- `TetrisLeaderboard.sol` —— 智能合约源码（带防刷分签名验证）

## 如何本地运行

1. 把 `tetris-arc.html` 下载到本地
2. 使用本地服务器打开（推荐）：
   ```bash
   python -m http.server 8000
