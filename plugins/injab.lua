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
if is_sudo(msg) then 
return [[ 
   انتة المطورو تأمرني امر💋 هاهيه انجبيت ☺️
]] 
     end 
     if is_owner(msg) then 
return [[ 
راح اسكتلك 😒 لخاطرالمطؤر  لان احترمك و ضافني لك  🚶 
]] 
     end 

if is_momod(msg) then 
return [[ 
خاب ولي انت ادمن و ب الؤاسطات رفعؤك 😐 ف سد حلكك احسلك 😐🖕 
]] 
     end 
 
if not is_momod(msg) then 
return [[ 
لك انت هم عضؤ ؤ هم تشمر عليه .. دسد حلكك و احترم نفسك لا ادفرك 🖕🚶 
]] 
     end 
     end 



return { 
  patterns = { 
       "^انجب$", 
  }, 
  run = maestro, 
} 

end 
