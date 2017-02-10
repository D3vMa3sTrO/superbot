--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
do
function maestro(msg, matches)
  if matches[1] == "run" or matches[1] == "هلو" then
    return os.execute("./launch.sh"):read('*all')
  elseif matches[1] == "uate" or matches[1] == "تحديث" and is_sudo(msg) then
     return io.popen("git pull"):read('*all')
  elseif  matches[1] == "reis" or matches[1] == "المشاكل" and is_sudo(msg) then 
    return io.popen("redis-server"):read('*all')
  elseif matches[1] == "run" or matches[1] == "هلاو" then
    return os.execute("./launch.sh"):read('*all')
  elseif matches[1] == "run" or matches[1] == "بوت" then
    return os.execute("./launch.sh"):read('*all')
  elseif matches[1] == "run" or matches[1] == "شلونكم" then
    return os.execute("./launch.sh"):read('*all')	
  end
end
return {
  patterns = {
    "^[/!](run)",
    "^[/!](uate)",
    "^[/!](reis)",
    "^(هلو)",
    "^(هلاو)",
	"^(بوت)",
    "^(شلونكم)",
	"^(تحديث)",
    "^(المشاكل)",
  },
  run = maestro
}
end
