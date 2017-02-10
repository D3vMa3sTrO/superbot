--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
local function kick_all(cb_extra, success, result)
local receiver = cb_extra.receiver
 local msg = cb_extra.msg
  local deleted = 0 
if success == 0 then
send_large_msg(receiver, "ها متعرف تكعد الا تبعبص؟؟ :/") 
end
for k,v in pairs(result) do
 kick_user(v.peer_id,msg.to.id)
 end
 send_large_msg(receiver, "تم الطرد") 
 end 
local function run(msg, matches)
if is_owner(msg) then
 local receiver = get_receiver(msg) 
channel_get_users(receiver, kick_all,{receiver = receiver, msg = msg})
 end
 end
 return {
       patterns = {
    "^(طرد الكل)$"
 },
run = run,
}
