--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
--]]
do

local function mohammedboss(msg, matches)
  if matches[1] == 'موقعي' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false)
      return "🎈انت المطور مال اني 😻💋\n🎈 اسمك :"..msg.from.first_name.."\n" 
   .."🎈ايديك :("..msg.from.id..")\n" 
   .."🎈ايدي الكروب :("..msg.to.id..")\n" 
   .."🎈اسم الكروب :("..msg.to.title..")\n" 
   .."🎈معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."🎈رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
   .."🎈 الرساله :- "..msg.text.."\n" 
    elseif is_admin1(msg) then
    send_document(get_receiver(msg), "./files/me/support.webp", ok_cb, false)
      return "🎈أنت أداري 💋🌝\n🎈 اسمك :"..msg.from.first_name.."\n" 
   .."🎈ايديك :("..msg.from.id..")\n" 
   .."🎈ايدي الكروب :("..msg.to.id..")\n" 
   .."🎈اسم الكروب :("..msg.to.title..")\n" 
   .."🎈معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."🎈رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
   .."🎈 الرساله :- "..msg.text.."\n" 
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./files/me/owner.webp", ok_cb, false)
      return "🎈انت مديرهم 😻💋\n🎈 اسمك :"..msg.from.first_name.."\n" 
   .."🎈ايديك :("..msg.from.id..")\n" 
   .."🎈ايدي الكروب :("..msg.to.id..")\n" 
   .."🎈اسم الكروب :("..msg.to.title..")\n" 
   .."🎈معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."🎈رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
   .."🎈 الرساله :- "..msg.text.."\n" 
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return "🎈 أنت ادمن بس لتشمر👍🌝\n🎈 اسمك :"..msg.from.first_name.."\n" 
   .."🎈ايديك :("..msg.from.id..")\n" 
   .."🎈ايدي الكروب :("..msg.to.id..")\n" 
   .."🎈اسم الكروب :("..msg.to.title..")\n" 
   .."🎈معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."🎈رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
   .."🎈 الرساله :- "..msg.text.."\n" 
          else
    send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "🎈خطيه انت عضو 😂🚶\n🎈 اسمك :"..msg.from.first_name.."\n" 
   .."🎈ايديك :("..msg.from.id..")\n" 
   .."🎈ايدي الكروب :("..msg.to.id..")\n" 
   .."🎈اسم الكروب :("..msg.to.title..")\n" 
   .."🎈معرفك :(@"..(msg.from.username or "لا يوجد")..")\n" 
   .."🎈رقمك :("..(msg.from.phone or "  لا يوجد ")..")\n"
   .."🎈 الرساله :- "..msg.text.."\n" 
    end
  end
end

return {
  patterns = {
    "^(موقعي)$",
    "^(موقعي)$",
    "^[#!/](موقعي)$",
    "^[#!/](موقعي)$"
    },
  run = mohammedboss
}
end
