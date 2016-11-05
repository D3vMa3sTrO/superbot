--[[   كتابه المطور :-  @HI_DEBYE
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
do
local function run(msg, matches, callback, extra)
local data = load_data(_config.moderation.data)
local rules = data[tostring(msg.to.id)]['rules']
local about = data[tostring(msg.to.id)]['description']
local hash = 'group:'..msg.to.id
local group_welcome = redis:hget(hash,'welcome')
if matches[1] == 'حذف الترحيب' and not matches[2] and is_momod(msg) then 
    
   redis:hdel(hash,'welcome')
        return 'تم حذف الترحيب بنجاح✅'
end

local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)

if is_momod(msg) and matches[1] == 'ضع ترحيب' then
redis:hset(hash,'welcome',matches[2])
        return 'تم حفظ الترحيب💡'
end

if matches[1] == 'chat_add_user' and msg.service then
group_welcome = string.gsub(group_welcome, '$userlink', "telegram.me/"..(msg.action.user.username or '').."")
group_welcome = string.gsub(group_welcome, '$gpname', msg.to.title)
group_welcome = string.gsub(group_welcome, '$name', ""..(msg.action.user.print_name or '').."")
  group_welcome = string.gsub(group_welcome, '$username', "@"..(msg.action.user.username or '').."")
  group_welcome = string.gsub(group_welcome, '$entime', ""..(jdat.ENtime).."")
  group_welcome = string.gsub(group_welcome, '$endate', ""..(jdat.ENdate).."")
  group_welcome = string.gsub(group_welcome, '$rules', ""..(rules or '').."")
  group_welcome = string.gsub(group_welcome, '$about', ""..(about or '').."")

elseif matches[1] == 'chat_add_user_link' and msg.service then
group_welcome = string.gsub(group_welcome, '$userlink', "telegram.me/"..(msg.from.username or '').."")
group_welcome = string.gsub(group_welcome, '$gpname', msg.to.title)
group_welcome = string.gsub(group_welcome, '$name', ""..(msg.from.print_name or '').."")
  group_welcome = string.gsub(group_welcome, '$username', "@"..(msg.from.username or '').."")
  group_welcome = string.gsub(group_welcome, '$entime', ""..(jdat.ENtime).."")
  group_welcome = string.gsub(group_welcome, '$endate', ""..(jdat.ENdate).."")
  group_welcome = string.gsub(group_welcome, '$rules', ""..(rules or '').."")
  group_welcome = string.gsub(group_welcome, '$about', ""..(about or '').."")

 end
return group_welcome
end
return {
  patterns = {
  "^[!/#](ضع ترحيب) +(.*)$",
  "^[!/#](حذف الترحيب)$",
  "^(ضع ترحيب) +(.*)$",
  "^(حذف الترحيب)$",
  "^!!tgservice (chat_add_user)$",
  "^!!tgservice (chat_add_user_link)$",
  },
  run = run
}
end
--[[   كتابه المطور :-  @HI_DEBYE
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
