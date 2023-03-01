local config = {
	-- true = para o player ser teleportado após o termino da vip
	-- false = para o player não ser teleportado
	useTeleport = true,
	-- posição para onde o player ira ser teleportado
	expirationPosition = Position(32369, 32241, 7),

	-- true = para o player receber a mensagem de termino
	-- false = para o player nao receber a mensagem
	useMessage = true,
	expirationMessage = 'Your vip days ran out.',
	expirationMessageType = MESSAGE_STATUS_WARNING
}

if not VipData then
	VipData = { }
end

function Player.onRemoveVip(self)

	if config.useTeleport then
		self:teleportTo(config.expirationPosition)
		self:setDirection(SOUTH)
		config.expirationPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	if config.useMessage then
		self:sendTextMessage(config.expirationMessageType, config.expirationMessage)
	end

	local outfitsToDelete = { 963, 965, 967, 969, 971, 973, 975, 962, 964, 966, 968, 970, 972, 974 } -- retro outfits ids
	local mountsToDelete = { 168, 169, 170 } -- mounts id

	for i = 1, #outfitsToDelete do
		self:removeOutfit(outfitsToDelete[i])
	end

	for i = 1, #mountsToDelete do
		self:removeMount(mountsToDelete[i])
	end

	local currentSex = self:getSex()
	local playerOutfit = self:getOutfit()

	playerOutfit.lookAddons = 0
	if currentSex == PLAYERSEX_FEMALE then
		playerOutfit.lookType = 136
	else
		playerOutfit.lookType = 128
	end
	self:setOutfit(playerOutfit)

end

function Player.addAddonMount(self)

	local outfitsToUpgrade = { 963, 965, 967, 969, 971, 973, 975, 962, 964, 966, 968, 970, 972, 974 } -- add outfits ids
	local mountsToUpgrade = { 168, 169, 170 } -- add mounts ids

	if self:getVipDays() > 0 then
		for i = 1, #outfitsToUpgrade do
			local outfit = self:hasOutfit(outfitsToUpgrade[i], 3)
			if outfit == false then
				self:addOutfitAddon(outfitsToUpgrade[i], 3)
			end
		end
		for i = 1, #mountsToUpgrade do
			local outfit = self:hasMount(mountsToUpgrade[i])
			if outfit == false then
				self:addMount(mountsToUpgrade[i])
			end
		end
	end
end

function Player.getVipDays(self)
	return VipData[self:getId()].days
end

function Player.getLastVipDay(self)
	return VipData[self:getId()].lastDay
end

function Player.isVip(self)
	return self:getVipDays() > 0
end

function Player.addInfiniteVip(self)
	local data = VipData[self:getId()]
	data.days = 0xFFFF
	data.lastDay = 0

	db.query(string.format('UPDATE `accounts` SET `vipdays` = %i, `viplastday` = %i WHERE `id` = %i;', 0xFFFF, 0, self:getAccountId()))
end

function Player.addVipDays(self, days)
	local data = VipData[self:getId()]
	local amount = math.min(0xFFFE - data.days, days)
	if amount > 0 then
		local lastDay
		if data.days == 0 then
			lastDay = os.time() + (amount * 24 * 60 * 60)
		else
			lastDay = data.lastDay + (amount * 24 * 60 * 60)
		end
		db.query(string.format('UPDATE `accounts` SET `vipdays` = `vipdays` + %i, `viplastday` = %i WHERE `id` = %i;', amount, lastDay, self:getAccountId()))
		VipData[self:getId()] = {
			days = data.days + amount,
			lastDay = lastDay
		}
	end

	return true
end

function Player.removeVipDays(self, days)
	local data = VipData[self:getId()]
	if data.days == 0xFFFF then
		return false
	end

	local amount = math.min(data.days, days)
	if amount > 0 then
		local lastDay = data.lastDay - (amount * 24 * 60 * 60)
		db.query(string.format('UPDATE `accounts` SET `vipdays` = `vipdays` + %i, `viplastday` = %i WHERE `id` = %i;', amount, lastDay, self:getAccountId()))
		data.days = data.days - amount
		data.lastDay = lastDay

		if data.days == 0 then
			self:onRemoveVip()
		end
	end

	return true
end

function Player.removeVip(self)
	local data = VipData[self:getId()]
	if data.days == 0 then
		return
	end

	data.days = 0
	data.lastDay = 0

	self:onRemoveVip()

	db.query(string.format('UPDATE `accounts` SET `vipdays` = 0, `viplastday` = 0 WHERE `id` = %i;', self:getAccountId()))
end

function Player.loadVipData(self)
	local resultId = db.storeQuery(string.format('SELECT `vipdays`, `viplastday` FROM `accounts` WHERE `id` = %i;', self:getAccountId()))
	if resultId then
		VipData[self:getId()] = {
			days = result.getDataInt(resultId, 'vipdays'),
			lastDay = result.getDataInt(resultId, 'viplastday')
		}

		result.free(resultId)
		return true
	end

	VipData[self:getId()] = { days = 0, lastDay = 0 }
	return false
end

function Player.updateVipTime(self)
	local save = false

	local data = VipData[self:getId()]
	local days, lastDay = data.days, data.lastDay
	local daysBefore = days
	if days == 0 or days == 0xFFFF then
		if lastDay ~= 0 then
			lastDay = 0
			save = true
		end
	elseif lastDay == 0 then
		lastDay = os.time()
		save = true
	else
		local time = os.time()
		local elapsedDays = math.floor((time - lastDay) / 86400)
		if elapsedDays > 0 then
			if elapsedDays >= days then
				days = 0
				lastDay = 0
			else
				days = days - elapsedDays
				lastDay = time - ((time - lastDay) % 86400)
			end
			save = true
		end
	end

	if save then
		if daysBefore > 0 and days == 0 then
			self:onRemoveVip()
		end

		db.query(string.format('UPDATE `accounts` SET `vipdays` = %i, `viplastday` = %i WHERE `id` = %i;', days, lastDay, self:getAccountId()))
		data.days = days
		data.lastDay = lastDay
	end
end
