--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
do

local function mohammedboss(msg, matches)
  if matches[1] == 'me' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false)
      return "<b>your sudo me</b>\n<b>Name</b> :"..msg.from.first_name.."\n" 
   .."<b>your id</b> :("..msg.from.id..")\n" 
   .."<b>ID Group</b> :("..msg.to.id..")\n" 
   .."<b>Name Group</b> :("..msg.to.title..")\n" 
   .."<b>UserName</b> :(@"..(msg.from.username or ".......")..")\n" 
   .."<b>Number Phone</b> :("..(msg.from.phone or " .......... ")..")\n"
   .."<b>msg</b> : "..msg.text.."\n" 
    elseif is_admin1(msg) then
    send_document(get_receiver(msg), "./files/me/support.webp", ok_cb, false)
      return "<b>your Moderator</b>\n<b>Name</b> :"..msg.from.first_name.."\n" 
   .."<b>your id</b> :("..msg.from.id..")\n" 
   .."<b>ID Group</b> :("..msg.to.id..")\n" 
   .."<b>Name Group</b> :("..msg.to.title..")\n" 
   .."<b>UserName</b> :(@"..(msg.from.username or ".......")..")\n" 
   .."<b>Number Phone</b> :("..(msg.from.phone or " .......... ")..")\n"
   .."<b>msg</b> : "..msg.text.."\n" 
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./files/me/owner.webp", ok_cb, false)
      return "<b>your Owner</b>\n<b>Name</b> :"..msg.from.first_name.."\n" 
   .."<b>your id</b> :("..msg.from.id..")\n" 
   .."<b>ID Group</b> :("..msg.to.id..")\n" 
   .."<b>Name Group</b> :("..msg.to.title..")\n" 
   .."<b>UserName</b> :(@"..(msg.from.username or ".......")..")\n" 
   .."<b>Number Phone</b> :("..(msg.from.phone or " .......... ")..")\n"
   .."<b>msg</b> : "..msg.text.."\n" 
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return "<b>your Admin</b>\n<b>Name</b> :"..msg.from.first_name.."\n" 
   .."<b>your id</b> :("..msg.from.id..")\n" 
   .."<b>ID Group</b> :("..msg.to.id..")\n" 
   .."<b>Name Group</b> :("..msg.to.title..")\n" 
   .."<b>UserName</b> :(@"..(msg.from.username or ".......")..")\n" 
   .."<b>Number Phone</b> :("..(msg.from.phone or " .......... ")..")\n"
   .."<b>msg</b> : "..msg.text.."\n" 
          else
    send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "<b>your Member</b>\n<b>Name</b> :"..msg.from.first_name.."\n" 
   .."<b>your id</b> :("..msg.from.id..")\n" 
   .."<b>ID Group</b> :("..msg.to.id..")\n" 
   .."<b>Name Group</b> :("..msg.to.title..")\n" 
   .."<b>UserName</b> :(@"..(msg.from.username or ".......")..")\n" 
   .."<b>Number Phone</b> :("..(msg.from.phone or " .......... ")..")\n"
   .."<b>msg</b> : "..msg.text.."\n" 
    end
  end
end

return {
  patterns = {
    "^(me)$",
    "^(me)$",
    "^[#!/](me)$",
    "^[#!/](me)$"
    },
  run = mohammedboss
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
