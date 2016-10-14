--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
	   _config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
	return 'البوت بالتاكيد تم ☑️ تشغيله في المجموعه 🎈'
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "تم ☑️ تشغيل البوت في المجموعه 🎈"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
       _config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "تم ☑️ اطفاء البوت في المجموعه 🎈 "
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is moderator then re-enable the channel
	--if is_sudo(msg) then
	if is_momod(msg) then
	  if msg.text == "تشغيل البوت" then
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end

	return msg
end

local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	if matches[1] == 'تشغيل البوت' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1] == 'اطفاء البوت' then
		return disable_channel(receiver)
	end
end

return {
	description = "Plugin to manage Bot.", 
	usage = {
		"Bot on: enable BOT In a Group",
		"Bot off: disable Bot In a Group" },
	patterns = {
		"^(تشغيل البوت)",
		"^(اطفاء البوت)" }, 
	run = run,
	privileged = true,
	--moderated = true,
	pre_process = pre_process
}
