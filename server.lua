-- local QBCore = exports['qb-core']:GetCoreObject()
ESX = exports["es_extended"]:getSharedObject()
local seatsTaken = {}

RegisterNetEvent('qb-sit:takePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('qb-sit:leavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

lib.callback.register('qb-sit:getPlace', function(source, cb, objectCoords)
	taken = nil

	if seatsTaken[objectCoords] then
		taken = true
	end

	cb(taken)
end)
