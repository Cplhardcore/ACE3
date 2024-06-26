#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Check whether local player is currently allowed to create a Zeus Module
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Allowed to create module <BOOL>
 *
 * Example:
 * call ace_zeus_fnc_canCreateModule
 *
 * Public: No
 */

// Don't allow if we already are a zeus, intentionally using player instead of ace_player
 if (!isNull getAssignedCuratorLogic player) exitWith { false };

(isNil QGVAR(zeus)) && {
    switch (GVAR(canCreateZeus)) do {
        case CAN_CREATE_ADMIN:   {isServer || {IS_ADMIN_LOGGED}};
        case CAN_CREATE_CONSOLE: {call BIS_fnc_isDebugConsoleAllowed};
        case CAN_CREATE_ALL:     {true};
        default {false};
    }
}
