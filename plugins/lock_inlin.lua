--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]] 
do
local function pre_process(msg)

    local inline = 'mate:'..msg.to.id
    if msg.text == '[unsupported]' and redis:get(inline) and not is_momod(msg) then
            delete_msg(msg.id, ok_cb, true)
end
    return msg
    end
    
 local function maestro(msg, matches)
if is_momod(msg) and matches[1] == "قفل" and matches[2] == "الانلاين" then
local inline = 'mate:'..msg.to.id
redis:set(inline, true)
return "" 
end
if is_momod(msg) and matches[1] == "فتح" and matches[2] == "الانلاين" then
    local inline = 'mate:'..msg.to.id
    redis:del(inline)
    return "" 
  end
end
return {
    patterns ={
        '^(قفل) (الانلاين)$',
        '^(فتح) (الانلاين)$',
        '^[#!/](قفل) (الانلاين)$',
        '^[#!/](فتح) (الانلاين)$',
    },
run = maestro,
pre_process = pre_process 
}
end
