private ["_object","_array","_anchorb"]; 
 
_object = btc_create_object_point;
_anchorb = nearestObjects [position _object, ["LandVehicle","Air"], 10]; 

 
if (count _anchorb == 0) exitWith {hint "No wreck";}; 
 
{
  if (typeOf _x == "ACE_friesAnchorBar") then 
  { 
     hint "rogue anchorbar spotted";
     deleteVehicle _x; 
  };
} forEach _anchorb;

sleep 2;

_array = nearestObjects [position _object, ["LandVehicle","Air"], 10]; 

if (damage (_array select 0) != 1) exitWith {hint "It is not a wreck!"}; 
 
[[(_array select 0)],"btc_fnc_log_server_repair_wreck",false] spawn BIS_fnc_MP;