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
  if matches[1] == 'موقعي' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false)
      return "انت المطور ماتي فديت ربك😻🙊\n▫️اســمــك  "..msg.from.first_name.."\n" 
   .."▫️ايـديـك ("..msg.from.id..")\n" 
   .."▫️ ايدي الكروب  ("..msg.to.id..")\n" 
   .."▫️ اسم الكروب  ("..msg.to.title..")\n" 
   .."▫️معرفك (@"..(msg.from.username or "لا يوجد")..")\n" 
   .."▫️ رقمك ("..(msg.from.phone or "  لا يوجد ")..")\n"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg), "./files/me/support.webp", ok_cb, false)
      return "انــت اداري🙂\n▫️اســمــك  "..msg.from.first_name.."\n" 
   .."▫️ ايـديـك  ("..msg.from.id..")\n" 
   .."▫️ايدي الكروب ("..msg.to.id..")\n" 
   .."▫️اسم الكروب("..msg.to.title..")\n" 
   .."▫️ معرفك  (@"..(msg.from.username or "لا يوجد")..")\n" 
   .."▫️ رقمك ("..(msg.from.phone or "  لا يوجد ")..")\n"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./files/me/owner.webp", ok_cb, false)
      return "انــت مـديــر🙊\n▫️اســمــك  "..msg.from.first_name.."\n" 
   .."▫️ ايـديـك ("..msg.from.id..")\n" 
   .."▫️ايدي الكروب ("..msg.to.id..")\n" 
   .."▫️اسم الكروب ("..msg.to.title..")\n" 
   .."▫️معرفك (@"..(msg.from.username or "لا يوجد")..")\n" 
   .."▫️رقمك ("..(msg.from.phone or "  لا يوجد ")..")\n"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return " انــت ادمن☺️\n▫️اســمــك  "..msg.from.first_name.."\n" 
   .."▫️ايـديـك  ("..msg.from.id..")\n" 
   .."▫️ايدي الكروب ("..msg.to.id..")\n" 
   .."▫️اسم الكروب ("..msg.to.title..")\n" 
   .."▫️معرفك (@"..(msg.from.username or "لا يوجد")..")\n" 
   .."▫️رقمك  ("..(msg.from.phone or "  لا يوجد ")..")\n"
          else
    send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "خطيه انت عضو محد يعرفك 😹😹\n▫️اســمــك  "..msg.from.first_name.."\n" 
   .."▫️ايـديـك ("..msg.from.id..")\n" 
   .."▫️ايدي الكروب ("..msg.to.id..")\n" 
   .."▫️اسم الكروب ("..msg.to.title..")\n" 
   .."▫️ معرفك (@"..(msg.from.username or "لا يوجد")..")\n" 
   .."▫️رقمك ("..(msg.from.phone or "  لا يوجد ")..")\n"
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
  run = maestro
}
end
