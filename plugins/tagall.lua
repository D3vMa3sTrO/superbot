--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
local function tagall(cb_extra, success, result) 
    local receiver = cb_extra.receiver 
    local text = '' 
local msgss = 0 
    for k,v in pairs(result.members) do 
        if v.username then 
       msgss = msgss + 1 
   text = text..msgss.."-  @"..v.username.."\n" 
  end 
    end 
 text = text.."\n"..cb_extra.msg_text 
 send_large_msg(receiver, text) 
end 

local function tagall2(cb_extra, success, result) 
    local receiver = cb_extra.receiver 
    local text = '' 
local msgss = 0 
    for k,v in pairs(result) do 
        if v.username then 
       msgss = msgss + 1 
   text = text..msgss.."-  @"..v.username.."\n" 
  end 
    end 
 text = text.."\n"..cb_extra.msg_text 
 send_large_msg(receiver, text) 
end 
local function maestro(msg, matches) 
    local receiver = get_receiver(msg) 
 if not is_momod(msg) then 
  return "لا تبحبش عموو بس للادمنية"
 end 
 if matches[1] then 
 if msg.to.type == 'chat' then 
 chat_info(receiver, tagall, {receiver = receiver,msg_text = matches[1]}) 
 elseif msg.to.type == 'channel' then 
 channel_get_users(receiver, tagall2, {receiver = receiver,msg_text = matches[1]}) 
 end 
 end 
 return 
end 

return { 
  description = "Will tag all ppl with a msg.", 
  usage = { 
    "تاك [msg]." 
  }, 
  patterns = { 
    "^تاك +(.+)$" 
  }, 
  run = maestro 
}
