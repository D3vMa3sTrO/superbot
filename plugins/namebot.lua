--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
local function run(msg, matches)
if matches[1]:lower() == "تشاكي" then
  local text = "حياته 😻 وعيونه 🙄 وكلبه ❤️"
    return reply_msg(msg.id, text, ok_cb, false)
end
end
return {
  patterns = {
    "^(.*)$",
  },
  run = run
}
