--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
local function check_member_superrem2(cb_extra, success, result)
local receiver = cb_extra.receiver
local data = cb_extra.data
local msg = cb_extra.msg
for k,v in pairs(result) do
local member_id = v.id
if member_id ~= our_id then
-- Group configuration removal
data[tostring(msg.to.id)] = nil
save_data(_config.moderation.data, data)
local groups = 'groups'
if not data[tostring(groups)] then
data[tostring(groups)] = nil
save_data(_config.moderation.data, data)
end
data[tostring(groups)][tostring(msg.to.id)] = nil
save_data(_config.moderation.data, data)
chat_del_user(get_receiver(msg), 'user#id'..235431064, ok_cb, false)
leave_channel(get_receiver(msg), ok_cb, false)
end
end
end

local function superrem2(msg)
local data = load_data(_config.moderation.data)
local receiver = get_receiver(msg)
channel_get_users(receiver, check_member_superrem2,{receiver = receiver, data = data, msg = msg})
end

local function pre_process(msg)
local timetoexpire = 'unknown'
local expiretime = redis:hget ('expiretime', get_receiver(msg))
local now = tonumber(os.time())
if expiretime then 
timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
if tonumber("0") > tonumber(timetoexpire) then
if get_receiver(msg) then
redis:del('expiretime', get_receiver(msg))
rem_mutes(msg.to.id)
superrem2(msg)
return send_large_msg(get_receiver(msg), 'تـم ✅ انـتـهـاء تـاريـخ الـصـلاحـيـة فـي المـجـمـوعـة👥 ')
else
return
end
end
if tonumber(timetoexpire) == 0 then
if redis:hget('expires0',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '.')
redis:hset('expires0',msg.to.id,'5')
end
if tonumber(timetoexpire) == 1 then
if redis:hget('expires1',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '🗣 خـلـصـن ايـام الـتـفـعـيـل لـهـذه الـمجـموعه \n اطـلـب مـن المـطـور  تـجـديـد الـوقـت👥')
redis:hset('expires1',msg.to.id,'5')
end
if tonumber(timetoexpire) == 2 then
if redis:hget('expires2',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '🗣يـومـيـن وتـنـتـهـي صـلاحيـه الـمـجـمـوعـه \n اطلـب مـن المـطـور  تـجديد الوقت👥')
redis:hset('expires2',msg.to.id,'5')
end
if tonumber(timetoexpire) == 3 then
if redis:hget('expires3',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '🗣 ثـلـاثـه  ايـام وتـنـتـهـي صلاحـيـه المـجـمـوعـه \n اطلـب من المـطـور  تجـديـد الـوقـت👥')
redis:hset('expires3',msg.to.id,'5')
end
if tonumber(timetoexpire) == 4 then
if redis:hget('expires4',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '🗣 اربـعـه  ايـام وتـنـتـهـي صلاحـيـه المـجـمـوعـه \n اطلـب من المـطـور  تجـديـد الـوقـت👥')
redis:hset('expires4',msg.to.id,'5')
end
if tonumber(timetoexpire) == 5 then
if redis:hget('expires5',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '🗣 خـمـسـه  ايـام وتـنـتـهـي صلاحـيـه المـجـمـوعـه \n اطلـب من المـطـور  تجـديـد الـوقـت👥')
redis:hset('expires5',msg.to.id,'5')
end
end
return msg
end
function run(msg, matches)
if matches[1]:lower() == 'وضع وقت'  then
if not is_sudo(msg) then return end
local time = os.time()
local buytime = tonumber(os.time())
local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
redis:hset('expiretime',get_receiver(msg),timeexpire)
return " تـم ✅ وضـع مـدة انـتـهاء صلاحـية الكـروب الـى  👥("..matches[2].. ") "
end
if matches[1]:lower() == 'تجديد'  then
local expiretime = redis:hget ('expiretime', get_receiver(msg))
if not expiretime then return ' لـم يـتـم ❎ تـحـديـد التـاريـخ بنـجـاح' else
local now = tonumber(os.time())
return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. "تـم ✅ تـجديـد مـده الـصـلاحـيـه الـى👥"
end
end

end
return {
patterns = {
"^(وضع وقت) (.*)$",
"^(تجديد)$",
"^[#!/](وضع وقت) (.*)$",
"^[#!/](تجديد)$",
},
run = run,
pre_process = pre_process
}

--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
