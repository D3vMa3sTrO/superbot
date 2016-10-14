--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
do
local function pre_process(msg)

    local inline = 'mate:'..msg.to.id
    if msg.text == '[unsupported]' and redis:get(inline) and not is_momod(msg) then
            delete_msg(msg.id, ok_cb, true)
end
    return msg
    end
    
 local function medo(msg, matches)
if is_momod(msg) and matches[1] == "قفل" and matches[2] == "الانلاين" then
local inline = 'mate:'..msg.to.id
redis:set(inline, true)
return "" 
end
if is_momod(msg) and matches[1] == "فتح" and matches[2] == "الانلاين" then
    local inline = 'mate:'..msg.to.id
    redis:del(inline)
    return "" 
  end
end
return {
    patterns ={
        '^(قفل) (الانلاين)$',
        '^(فتح) (الانلاين)$',
        '^[#!/](قفل) (الانلاين)$',
        '^[#!/](فتح) (الانلاين)$',
    },
run = medo,
pre_process = pre_process 
}
end
