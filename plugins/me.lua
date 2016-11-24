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
      return "انـ🗣ـت الـمـطـور مـ💋ـال انـي\n👤 اســمــك :"..msg.from.first_name.."\n" 
   .."🎐| ايـديـك :("..msg.from.id..")\n" 
   .."💠| ايدي الكروب :("..msg.to.id..")\n" 
   .."👥| اسم الكروب :("..msg.to.title..")\n" 
   .."👤| معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."📝| رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg), "./files/me/support.webp", ok_cb, false)
      return "انـ🗣ـت اداري😍\n👤 اســمــك :"..msg.from.first_name.."\n" 
   .."🎐| ايـديـك :("..msg.from.id..")\n" 
   .."💠| ايدي الكروب :("..msg.to.id..")\n" 
   .."👥| اسم الكروب :("..msg.to.title..")\n" 
   .."👤| معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."📝| رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./files/me/owner.webp", ok_cb, false)
      return "انـ🗣ـت مـديـ🌝ـرهـم\n👤 اســمــك :"..msg.from.first_name.."\n" 
   .."🎐| ايـديـك :("..msg.from.id..")\n" 
   .."💠| ايدي الكروب :("..msg.to.id..")\n" 
   .."👥| اسم الكروب :("..msg.to.title..")\n" 
   .."👤| معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."📝| رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return " انـ🗣ـت ادمن😸بـس لـتـ⚠️ـشـمـر\n👤 اســمــك :"..msg.from.first_name.."\n" 
   .."🎐| ايـديـك :("..msg.from.id..")\n" 
   .."💠| ايدي الكروب :("..msg.to.id..")\n" 
   .."👥| اسم الكروب :("..msg.to.title..")\n" 
   .."👤| معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."📝| رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
          else
    send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "خـطـ⚠️ـيـه انـ🗣ـت عــضــو 😸\n👤 اســمــك :"..msg.from.first_name.."\n" 
   .."🎐| ايـديـك :("..msg.from.id..")\n" 
   .."💠| ايدي الكروب :("..msg.to.id..")\n" 
   .."👥| اسم الكروب :("..msg.to.title..")\n" 
   .."👤| معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."📝| رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
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
