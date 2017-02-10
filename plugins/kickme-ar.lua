--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
local function run(msg, matches) 
if matches[1] == 'اطردني' then 
local hash = 'kick:'..msg.to.id..':'..msg.from.id 
     redis:set(hash, "waite") 
      return '▫️ كبد عمري \n▫️ المعرف | @'..msg.from.username..'\n▫️  هل انت متاكد من رغبتك في المغادره😢\n▫️ ارسل ﴿ نعم ﴾ للتاكيد \n▫️ ارسل﴿ لا ﴾ لالغاء المغادره \n▫️ خليك ويانه ليش تغادر 😕😒' 
    end 

    if msg.text then 
   local hash = 'kick:'..msg.to.id..':'..msg.from.id 
      if msg.text:match("^نعم$") and redis:get(hash) == "waite" then 
     redis:set(hash, "ok") 
   elseif msg.text:match("^لا$") and redis:get(hash) == "waite" then 
   send_large_msg(get_receiver(msg), "زين سويت خليك ويانه ليش ماتدخل للقناة اسويك مطور @DevMaestro 🌚🙊") 
     redis:del(hash, true) 

      end 
    end 
   local hash = 'kick:'..msg.to.id..':'..msg.from.id 
    if redis:get(hash) then 
        if redis:get(hash) == "ok" then 
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false) 
         return 'تم طردك من المجموعه وبعد لا ترجع 😒👍🏿 ('..msg.to.title..')' 
        end 
      end 
    end 

return { 
  patterns = { 
  '^(اطردني)$', 
  '^(نعم)$', 
  '^(لا)$' ,
  '^[#!/](اطردني)$', 
  '^[#!/](نعم)$', 
  '^[#!/](لا)$'
  }, 
  run = run, 
}
--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
local function run(msg, matches) 
if matches[1] == 'اطردني' then 
local hash = 'kick:'..msg.to.id..':'..msg.from.id 
     redis:set(hash, "waite") 
      return '▫️ كبد عمري \n▫️ المعرف | @'..msg.from.username..'\n▫️  هل انت متاكد من رغبتك في المغادره😢\n▫️ ارسل ﴿ نعم ﴾ للتاكيد \n▫️ ارسل﴿ لا ﴾ لالغاء المغادره \n▫️ خليك ويانه ليش تغادر 😕😒' 
    end 

    if msg.text then 
   local hash = 'kick:'..msg.to.id..':'..msg.from.id 
      if msg.text:match("^نعم$") and redis:get(hash) == "waite" then 
     redis:set(hash, "ok") 
   elseif msg.text:match("^لا$") and redis:get(hash) == "waite" then 
   send_large_msg(get_receiver(msg), "زين سويت خليك ويانه ليش ماتدخل للقناة اسويك مطور @DevMaestro 🌚🙊") 
     redis:del(hash, true) 

      end 
    end 
   local hash = 'kick:'..msg.to.id..':'..msg.from.id 
    if redis:get(hash) then 
        if redis:get(hash) == "ok" then 
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false) 
         return 'تم طردك من المجموعه وبعد لا ترجع 😒👍🏿 ('..msg.to.title..')' 
        end 
      end 
    end 

return { 
  patterns = { 
  '^(اطردني)$', 
  '^(نعم)$', 
  '^(لا)$' ,
  '^[#!/](اطردني)$', 
  '^[#!/](نعم)$', 
  '^[#!/](لا)$'
  }, 
  run = run, 
}
