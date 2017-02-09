--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
do
    
local function maestro(msg,matches)
    if matches[1] == "chat_add_user"  then 
      return "اهلا وسهلا كبد عمري نورت 😻🙊\n"..msg.to.title.."\n".."🆔 ايديك  "..msg.from.id.."\n".."🌀#معرفك @"..(msg.action.user.username or "....... " ).."\n".."👥 ايدي المجموعة  "..msg.to.id.."\n"

    elseif matches[1] == "chat_add_user_link" then
      return "اهلا وسهلا كبد عمري نورت 😻🙊\n"..msg.to.title.."\n".."🆔 ايديك  "..msg.from.id.."\n".."🌀#معرفك @"..(msg.action.user.username or "....... " ).."\n".."👥 ايدي المجموعة  "..msg.to.id.."\n"

    end
    if matches[1] == "chat_del_user" then
        local text = 'الله الله الله وياك 😹\n '..msg.action.user.first_name..'\n' ..'🌀 مــعــرفــك  @'..(msg.action.user.username or "لا يوجد")..'\n' ..'🆔 ايــديــك  '..msg.action.user.id..'\n'
    return reply_msg(msg.id, text, ok_cb, false)
end
end
return {
    patterns = {
        "^!!tgservice (chat_add_user)$",
        "^!!tgservice (chat_add_user_link)$",
        "^!!tgservice (chat_del_user)$"
       
    },
 run = maestro
}
end
