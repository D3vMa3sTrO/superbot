--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
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
  run = maestro

}
