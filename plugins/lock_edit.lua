--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
do



function promote(receiver, member_username, user_id)

  local data = load_data(_config.moderation.data)

  local group = string.gsub(receiver, 'channel#id', '')

  local member_tag_username = string.gsub(member_username, '@', '(at)')

  if not data[group] then

    return 

  end

  if data[group]['moderators'][tostring(user_id)] then

    return 

  end

  data[group]['moderators'][tostring(user_id)] = member_tag_username

  save_data(_config.moderation.data, data)

end



function lock_edit(msg)

  if not is_momod(msg) then

    return

  end

  if not redis:get("lock:edit:"..msg.to.id) then

    return '#h \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'
  else

      promote(msg.to.id,"@DeleteEditbot",290793242) 

    channel_invite(get_receiver(msg),"user#id322287948",ok_cb,false)

    redis:del("lock:edit:"..msg.to.id,true)

    return 'تم قفل التعديل في المجموعة 🏌 \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'

  end

end



function unlock_edit(msg)

  if not is_momod(msg) then

    return

  end

  if redis:get("lock:edit:"..msg.to.id) then

    return 'لا تلح التعديل مفتوح في المجموعة  \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'

  else

    redis:set("lock:edit:"..msg.to.id,false)

    return 'تم فتح التعديل في المجموعة🏌 \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'

  end

end



function pre_process(msg)

  if msg.from.id == 290793242 then

    if redis:get("lock:edit:"..msg.to.id) then

    if is_momod2(tonumber(msg.text),msg.to.id) then

        delete_msg(msg.id,ok_cb,false)

    else

      delete_msg(msg.id,ok_cb,false)

    delete_msg(msg.reply_id,ok_cb,false)

    end

  else

      delete_msg(msg.id,ok_cb,false)

  end

  end

  return msg

end



function run(msg,matches)

  if matches[2] == "التعديل" and is_momod(msg) then

  if matches[1] == "قفل" then

    if msg.to.type == "channel" then

    return lock_edit(msg)

    else

      return "You can't Manage Bot in <b>Private</b>"

    end

  elseif matches[1] == "فتح" then

    if msg.to.type == "channel" then

    return unlock_edit(msg)

    else

      return "You can't Manage Bot in <b>Private</b>"

    end

    end

  end

end



return {

  patterns = {

    "^(قفل) (التعديل)$",

    "^(فتح) (التعديل)$",

  },

  run = run,

  pre_process = pre_process

}



end
