--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'" ضلو وسخو واني انظف وراكم😼 لو الله خالقني مكناسة ولا هلعيشة 😕', ok_cb, false)
  else
send_msg(extra.chatid, 'تم تنظيف المجموعة👍 طلعت تلمع 😼', ok_cb, false)
end
end
local function run(msg, matches)
  if matches[1] == 'تنظيف' and is_sudo(msg) then
    if msg.to.type == 'channel' then
    if tonumber(matches[2]) > 100000 or tonumber(matches[2]) < 1 then
        return "شسالفة ضلع بس لا تريد انظفلك البيت😼 خلي بس 100000 رسالة او اقل "
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return ""
    end
  else
    return "لا تبحبش عموو ✋😼️"
  end
end

return {
    patterns = {
        '^(تنظيف) (%d*)$'
    },
    run = run,
}
