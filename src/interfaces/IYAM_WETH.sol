// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {IERC20} from "./IERC20.sol";

/// @author philogy <https://github.com/philogy>
interface IYAM_WETH is IERC20 {
    /*//////////////////////////////////////////////////////////////
                            ERC2612
    //////////////////////////////////////////////////////////////*/

    function permit(
        address _owner,
        address _spender,
        uint _value,
        uint _deadline,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) external;

    function nonces(address _owner) external view returns (uint);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    /*//////////////////////////////////////////////////////////////
                        WRAPPED ETHER
    //////////////////////////////////////////////////////////////*/

    function deposit() external payable;

    function depositTo(address _to) external payable;

    function withdraw(uint256 _amount) external;

    function withdrawTo(address _to, uint256 _amount) external;

    function withdrawFrom(address _from, uint256 _amount) external;

    function withdrawFromTo(address _from, address _to, uint256 _amount) external;

    /*//////////////////////////////////////////////////////////////
                            UTILITY
    //////////////////////////////////////////////////////////////*/

    function multicall(bytes[] calldata _calls) external returns (bytes[] memory returnDatas);

    // Errors
    error InsufficientBalance();
    error InsufficientAllowance();
    error PermitExpired();
    error InvalidSignature();
}
