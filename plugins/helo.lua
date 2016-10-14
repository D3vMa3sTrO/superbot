--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
do
    
local function mohammedboss(msg,matches)
    if matches[1] == "chat_add_user"  then 
      return "<b>Hi Welcome Group</b>\n".."<b>Name</b> :- "..msg.action.user.print_name.."\n".."<b>your ID</b> :- "..msg.from.id.."\n".."<b>UserName</b> :- @"..(msg.action.user.username or "....... " ).."\n".."<b>Name Group</b> :- "..msg.to.title.."\n".."<b>ID Group</b> :- "..msg.to.id.."\n"

    elseif matches[1] == "chat_add_user_link" then
      return "<b>Hi Welcome Group</b>\n".."<b>Name</b> :- "..msg.action.user.print_name.."\n".."<b>your ID</b> :- "..msg.from.id.."\n".."<b>UserName</b> :- @"..(msg.action.user.username or "....... " ).."\n".."<b>Name Group</b> :- "..msg.to.title.."\n".."<b>ID Group</b> :- "..msg.to.id.."\n"

    end
    if matches[1] == "chat_del_user" then
        local text = 'الله وياك/ج 🌚🍃 '..msg.action.user.first_name..'\n' ..'معرفك : @'..(msg.action.user.username or "لا يوجد")..'\n' ..'الايدي : '..msg.action.user.id..'\n'
    return reply_msg(msg.id, text, ok_cb, false)
end
end
return {
    patterns = {
        "^!!tgservice (chat_add_user)$",
        "^!!tgservice (chat_add_user_link)$",
        "^!!tgservice (chat_del_user)$"
       
    },
 run = mohammedboss,
}
end
