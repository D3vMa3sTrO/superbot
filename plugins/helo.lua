--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
do
    
local function mohammedboss(msg,matches)
    if matches[1] == "chat_add_user"  then 
      return "اهــلـا وسـهـلـا فـي كــروبـ 😻❤️\n"..msg.to.title.."\n".."|🎐| ايــديــك | "..msg.from.id.."\n".."|🗣| مــعــرفــك | @"..(msg.action.user.username or "....... " ).."\n".."|📍| ايـديـ الـمـجـمـوعـه | "..msg.to.id.."\n"

    elseif matches[1] == "chat_add_user_link" then
      return "اهــلـا وسـهـلـا فـي كــروبـ 😻❤️\n"..msg.to.title.."\n".."|🎐| ايــديــك | "..msg.from.id.."\n".."|🗣| مــعــرفــك | @"..(msg.action.user.username or "....... " ).."\n".."|📍| ايـديـ الـمـجـمـوعـه | "..msg.to.id.."\n"

    end
    if matches[1] == "chat_del_user" then
        local text = 'الـلـه ويـاك يـا عـزيـزي 😁\n '..msg.action.user.first_name..'\n' ..'|🗣| مــعــرفــك | @'..(msg.action.user.username or "لا يوجد")..'\n' ..'|🎐| ايــديــك | '..msg.action.user.id..'\n'
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

--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
