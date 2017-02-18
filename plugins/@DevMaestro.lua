--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
do 

local function maestro(msg, matches) 
 local sudo = 281266686
 local r = get_receiver(msg)
  send_large_msg(r, "انتضر  🙂هسه آروح اصيحلك مطوري اكله منو يريدك؟ 🙊")
send_large_msg("user#id"..sudo, "📝 لك مطوري  🕵  يردونك ضروري  🤖🍷\n\n ".." 👥 معرفه المحتاجك  : @"..msg.from.username.."\n 🆔 الايدي   : "..msg.from.id.."\n 📝 اسم المجموعه  : "..msg.to.title.."\n 🆔 ايدي المجموعه  : "..msg.from.id..'\n 🕑 الوقت : '..os.date(' %T*', os.time())..'\n 📅  التاريخ  : '..os.date('!%A, %B %d, %Y*\n', timestamp))end 

return { 
  patterns = { 
     "^(@devmaestr0)$" 
  }, 
  run = maestro, 
} 

end
-- BY Dev -maestro (@devmaestr0)
