--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
       تعديل       CH > @lTSHAKEl_CH
--]]
local function sudoteam(msg, matches)
local mtn = matches[2]
local link = matches[3]
if not is_momod(msg) then
return 'للادمنيه فقط '
end
if matches[1] == 'b' then
  return '<b>'..mtn..'</b>'

elseif matches[1] == 'co' then
  return '<code>'..mtn..'</code>'

elseif matches[1] == 'hyper' then
  return '<a href="'..link..'">'..mtn..'</a>'
elseif matches[1] == 'i' then
  return '<i>'..mtn..'</i>'
end
end
return {
  description = "تست", 
  usage = "تست",
  patterns = {
    "^[!#/]([Cc]o) (.*)$",
    "^[!#/]([Ii]) (.*)$",
    "^[!#/]([Bb]) (.*)$",
    "^[!#/]([Hh]yper) (.*) (.*)$"
  }, 
  run = sudoteam 
}
--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
       تعديل       CH > @lTSHAKEl_CH
--]]
