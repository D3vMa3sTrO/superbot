--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
do 
-------------Clean Msg -------------
local function clean_msg(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, ''..#result..' messages were deleted', ok_cb, false)
  else
    send_msg(extra.chatid, 'Error Deleting messages', ok_cb, false)  end end
-------------Save file-------------
local function save_file_reply(extra, success, result)
   msg = extra.msg
   name = extra.name
   adress = extra.adress
   receiver = get_receiver(msg)
  if success then
     file = './'..adress..'/'..name..''
    print('File saving to:', result)
    os.rename(result, file)
    print('File moved to:', file)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end

-----------------Reply_here-------------
local function reply_here(extra, success, result)
      reply_msg(extra.Reply, text, ok_cb, false)
end

------------- RUN -------------
function run(msg, matches) 
------------- GROUP TYPE -------------
  if matches[1] == "set" and matches[2] == "type" and matches[3] then
         if msg.to.type == "user" then 
return 
end
      if not is_sudo(msg) then 
    return 'You Are Not Allow To set Group Type !'
    end
 data = load_data(_config.moderation.data)
 group_type = data[tostring(msg.to.id)]['group_type']
data[tostring(msg.to.id)]['group_type'] = matches[3]
        save_data(_config.moderation.data, data)
        return 'Group Type Seted To : '..matches[3]
end
    -------------SET LINK    -------------
  if matches[1] == "set" and matches[2] == "link" and is_owner(msg) then
         if msg.to.type == "user" then 
return 
end
           if not is_owner(msg) then
    return "You Are Not Allow To Set Link"
  end
     waiting = redis:set('setlink:','waiting:'..msg.from.id)
    return 'Now Send Group Link!'
    else
     output = redis:get('setlink:')
    if output == 'waiting:'..msg.from.id then
    if msg.text then
	if msg.text:match("^(https://telegram.me/joinchat/%S+)$") and redis:set('setlink:','waiting:'..msg.from.id) and is_owner(msg) then
       setted = redis:set('setlink:',msg.text)
        return 'New Link Seted!'
      end end end
    -------------DEL LINK    -------------
if  matches[1] == "del" and matches[2] == "link" and is_owner(msg) then
       if msg.to.type == "user" then 
return 
end
         if not is_owner(msg) then
    return "You Are Not Allow To  Delete Group Link!"
  end
    redis:del('setlink:','waiting:'..msg.from.id)
    return "Group Link Has Been deleted"end end
    ------------- LINK    -------------
if  matches[1] == "link" and is_momod(msg) then
       output = redis:get('setlink:')
       receiver = get_receiver(msg)
    if output then
     send_msg(receiver,"Link for: ["..msg.to.title.."] \n➖➖➖➖➖➖\n"..output..'\n➖➖➖➖➖➖\n\n@StePh',ok_cb,false)
    else
    return ''
    end
end
    ------------- Git    -------------
        if matches[1] == "git" then
               if msg.to.type == "user" then 
                 return 
                 end
     url = "https://api.github.com/users/"..URL.escape(matches[2])
     jstr, res = https.request(url)
     jdat = JSON.decode(jstr)
  if jdat.message then
     return 'No data found' 
     end
    text = jdat.login..'\nFollowers: '..jdat.followers..'\nFollowings: '..jdat.following..'\nRepos: '..jdat.public_repos..'\nProfile URL: '..jdat.html_url..'\n\n@Hextor Team'
    file = download_to_file(jdat.avatar_url,'Hextor.jpg')
	
 if msg.to.type == "chat" then 
    send_photo('chat#id'..msg.to.id,file,ok_cb,false)
 elseif msg.to.type == "channel" then 
    send_photo('channel#id'..msg.to.id,file,ok_cb,false)
	return text
end
end
    ------------- Git User    -------------
  if matches[1] == "gituser" then
         if msg.to.type == "user" then 
         return 
         end
     url = "https://api.github.com/repos/"..URL.escape(matches[2]).."/"..URL.escape(matches[3])
     jstr, res = https.request(url)
     jdat = JSON.decode(jstr)
  if jdat.message then
return 'No data found'
end
     text = jdat.owner.login..' / '..jdat.name
  text = text..'\n______________________________\nLanguage: '..jdat.language
  ..'\nForks: '..jdat.forks_count
  ..'\nIssues: '..jdat.open_issues
  ..'\nRepo URL: '..jdat.html_url
   file = download_to_file(jdat.owner.avatar_url,'Hextor.jpg')
  if msg.to.type == "chat" then 
   photo_caption('chat#id'..msg.to.id,file,text,ok_cb,false)
elseif msg.to.type == "channel" then 
    photo_caption('channel#id'..msg.to.id,file,text,ok_cb,false)
end 
end 
    ------------- Git dl    -------------
  if matches[1] == "gitdl" then
   if msg.to.type == "user" then 
           return 
           end
       day = os.date("%I")
       hash = 'github:dl:'..day..':'..msg.from.id
       is_github = redis:get(hash)
   if is_github and not is_sudo(msg) then
      return "After 1Minute request \n(server Busy)"
   elseif not is_github  then
          redis:set(hash, true)
          end
  url = "https://codeload.github.com/"..matches[2]..'/'..matches[3].."/zip/master"
 	 file = download_to_file(url,matches[2]..'|@Hextor_ch.zip')
	if msg.to.type == 'channel' then
	send_document('channel#id'..msg.to.id,file,ok_cb,false)
	elseif msg.to.type == 'chat' then
	send_document('chat#id'..msg.to.id,file,ok_cb,false)
end
end 
       ------------- Add plugin     -------------
    if matches[1] == 'addplugin' and is_sudo(msg) then
        if not is_sudo(msg) then
           return "You Are Not Allow To Add Plugin"
           end
   name = matches[2]
   text = matches[3]
   file = io.open("./plugins/"..name, "w")
   file:write(text)
   file:flush()
   file:close()
   return "Add plugin successful "
   end
    ------------- Download plugin     -------------
      if matches[1] == "dl" and matches[2] == "plugin" and is_sudo(msg) then
     if not is_sudo(msg) then
    return "You Are Not Allow To Download Plugins!"
  end
   receiver = get_receiver(msg)
      send_document(receiver, "./plugins/"..matches[3]..".lua", ok_cb, false)
      send_document(receiver, "./plugins/"..matches[3], ok_cb, false)
    end
            -------------Show Plugins   -------------
    if matches [1] == "show" and is_sudo(msg) then
        	      if not is_sudo(msg) then 
 return "You Are Not Allow To show Plugins!"
end
		 file = io.open("./plugins/"..matches[2], "r")
		 text = file:read("*all")
		return text
	end
	    -------------save file Reply    -------------
	  if matches[1] == 'save' and is_sudo(msg) then
	      if not is_sudo(msg) then 
             return "You Are Not Allow To save Files!"
              end
    if msg.reply_id then
    adress = matches[2]
    name = matches[3]
    load_document(msg.reply_id, save_file_reply, {msg=msg,name=name,adress=adress})
        return 'الملف '..name..' ✅ تم ارساله الى المجلد: \n📂 '..adress
    end 
end
	    -------------Dl file Via Bot    -------------
    if matches [1] == "dlfile" and is_owner(msg) then
       if not is_owner(msg) then
          return "You Are Not Allow To Dl Files Via BOT"
          end
       file = download_to_file(matches[2],matches[3])
       send_document(get_receiver(msg),file,ok_cb,false)
       return "Uploading the File"
        end
		    if matches[1] == "dl" and matches[2] == "file" and is_sudo(msg) then
       if not is_sudo(msg) then
          return "You Are Not Allow To Dl Files Via BOT"
          end
      receiver = get_receiver(msg)
      send_document(receiver, ""..matches[3].."/"..matches[4], ok_cb, false)
        end
	    -------------Delete Plugins   -------------
	    if matches[1] == "delplugin" and is_sudo(msg) then
	      if not is_sudo(msg) then 
             return "You Are Not Allow To Delete Plugins!"
             end 
        io.popen("cd plugins && rm "..matches[2]..".lua")
        return "Delete plugin successful "
         end
        ------------- Feedback     -------------
  if matches[1] == "feedback" then
  if msg.reply_id then
  hour = os.date("%M")
  feedback_hash = 'feedback:'..hour..':'..msg.from.id
  is_feedback = redis:get(feedback_hash)
 if is_feedback then
    return "#Error\nIn one minute you can ask for your support"
    elseif not is_feedback then
     redis:set(feedback_hash, true)
  fwd_msg('user#id184413821', msg.reply_id, ok_cb, false)
return 'Your question was sent successfully (by Reply)'
end
 end
if #matches == 2 then
  hour = os.date("%M")
  feedback_hash = 'feedback:'..hour..':'..msg.from.id
  is_feedback = redis:get(feedback_hash)
if is_feedback then
    return "#Error\nIn one minute you can ask for your support"
    elseif not is_feedback then
     redis:set(feedback_hash, true)
text = "New Feedback \n----------------------\n"
text = text..'Name : '..user_print_name(msg.from)
text = text..'\nUsername : '..('@'..msg.from.username or ' ')
text = text..'\nID : '..msg.from.id
text = text..'\n\nPm :'..matches[2]
  send_large_msg('user#id184413821', text.."\n", ok_cb, false)
  end
return "Your question was sent successfully (Text)"
end  
end
        ------------- Short Link-------------
  if matches[1] == "short" then
     yeo = http.request('http://yeo.ir/api.php?url='..URL.escape(matches[2])..'=')
     opz = http.request('http://api.gpmod.ir/shorten/?url='..URL.escape(matches[2])..'&username=janjo.urmia2@gmail.com')
     u2s = http.request('http://u2s.ir/?api=1&return_text=1&url='..URL.escape(matches[2]))
     text = 'Your link was shortened to 4 website \n\nBase Link :'..matches[2]..'\n➖➖➖➖\n'..
     '\n\nShort By Yeo :\n'..yeo..
     '\n\nShort By Opizo :\n'..opz..
     '\n\nShort By U2s :\n'..u2s
return text 
end
    -------------Create File-------------
if matches[1]:lower() == "createfile" and matches[2] and is_owner(msg) then 
   if msg.to.type == "user" then 
      return 
      end
   if not is_owner(msg) then 
      return "You Are Not Allow To Create File!"
      end
   name = matches[2]
   text = matches[3]
   file = io.open("./data/"..name, "w")
   file:write(text)
   file:flush()
   file:close()
   send_document(get_receiver(msg), "./data/"..name, ok_cb, false)
   end
    -------------reply msg-------------
if matches[1] == "reply" and is_momod(msg) then 
    if msg.to.type == "user" then 
       return 
       end
    if not is_momod(msg) then 
       return "You Are Not Allow To use Reply "
       end
    if msg.reply_id then 
       receiver = get_receiver(msg)
       Reply = msg.reply_id
       text = matches[2]
       reply_msg(msg.reply_id,text,ok_cb,false)
       else
       text = matches[2]
    reply_msg(msg.id, text, ok_cb, false)
  end 
end
    -------------Translate-------------
   if matches[1] == "tr"  then 
     url = https.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang='..URL.escape(matches[2])..'&text='..URL.escape(matches[3]))
     data = json:decode(url)
   return 'Language : '..data.lang..'\nMeaning : '..data.text[1]
end
    -------------Echo-------------
 if matches[1] == "echo"  then 
   if msg.to.type == "user" then 
   return 
   end
 text = matches[2]
 b = 1
 while b ~= 0 do
 text = text:trim()
 text,b = text:gsub('^/+','')
 text,b = text:gsub('^!+','')
 text,b = text:gsub('^#+','')
 text,b = text:gsub('([Kk][Ii][Cc][Kk][Mm][Ee])','Bie')
 end
 return text
 end
    -------------Voice-------------
    if matches[1] == "voice" then
      if msg.to.type == "user" then 
         return 
         end
      if string.len(matches[2]) > 25 then 
         return "More than 25 characters are not allowed" 
         end
        hour = os.date("%M")
        hash_voice = 'voice::'..hour..':'..msg.from.id
        is_voice = redis:get(hash_voice)
      if is_voice then
      return "After 1Minute request \n(server Busy)"
    elseif not is_voice then
        redis:set(hash_voice, true)
        text = matches[2]
        b = 1
        while b ~= 0 do
        voice = text:trim()
        text,b = text:gsub(' ','.')
        end
     url = "http://tts.baidu.com/text2audio?lan=en&ie=UTF-8&text="..voice
     receiver = get_receiver(msg)
     file = download_to_file(url,'Hextor.ogg')
     send_audio(get_receiver(msg), file, ok_cb , false)
  end
end
    -------------Mean-------------
    if matches[1] == "mean" then
 http = http.request('http://api.vajehyab.com/v2/public/?q='..URL.escape(matches[2]))
   data = json:decode(http)
	return 'Word : '..(data.data.title or data.search.q)..'\n\nMeaning : '..(data.data.text or '----' )..'\n\nSource : '..(data.data.source or '----' )..'\n\n'..(data.error.message or '')..'\n'
end
    -------------Clean Msg-------------
  if matches[1] == 'clean' and matches[2] == "msg" and is_owner(msg) then
    if msg.to.type == "user" then 
      return 
      end
    if msg.to.type == 'chat' then
      return  "Only in the Super Group" 
      end
    if not is_owner(msg) then 
      return "You Are Not Allow To clean Msgs!"
      end
    if tonumber(matches[3]) > 100 or tonumber(matches[3]) < 10 then
      return "Minimum clean 10 and maximum clean is 100"
      end
   get_history(msg.to.peer_id, matches[3] + 1 , clean_msg , { chatid = msg.to.peer_id,con = matches[3]})
   end
    -------------Delete BAN&Gban list   -------------
 if matches[1]:lower() == 'del' then 
      data = load_data(_config.moderation.data)
  if matches[2] == 'gbanlist' then 
     if msg.to.type == "user" then 
       return 
       end
     if not is_sudo(msg) then
	   return "You Are Not Allow To clean GlobalBan List!"
	   end
     hash = 'gbanned'
     data[tostring(msg.to.id)]['gbanlist'] = nil
     save_data(_config.moderation.data, data)
     redis:del(hash)
     return "Global Ban List Has been Cleared!"
     end
  if matches[2] == 'banlist' and is_owner(msg) then
      if msg.to.type == "user" then 
       return 
       end
     if not is_owner(msg) then
	   return "You Are Not Allow To clean ban List!"
	   end
        hash = 'banned:'..msg.to.id
        data[tostring(msg.to.id)]['banlist'] = nil
        save_data(_config.moderation.data, data)
        redis:del(hash)
    return "Ban List Has been Cleared!"
  end
end
    -------------Link PV   -------------
    if matches[1] == 'link' and matches[2]== "link" or matches[1] == "linkpv" then
     if msg.to.type == "user" then 
        return 
        end
     if not is_momod(msg) then
        return "You Are Not Allow To Use Link PV!"
        end
      data = load_data(_config.moderation.data)
      group_link = data[tostring(msg.to.id)]['settings']['set_link']
     if not group_link then 
        return "Create a link using /newlink first!"
        end
      text = "Group Link :\n"..group_link
      send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
      return "Link Was Send To Your Pv!"
      end
    -------------Support   -------------
    if matches[1] == 'support' then
	  data = load_data(_config.moderation.data)
      support = '1065607686'
      group_link = data[tostring(support)]['settings']['set_link']
      text = "Supoort Link : \n"..group_link
      return text
      end
    -------------Converter   -------------
 if matches[1]:lower() == 'ar' and matches[2] then
   if msg.to.type == "user" then 
    return 
    end
    text = matches[2]:lower()
   if string.len(text) > 100 then 
      return "More than 100 characters are not allowed"
      end
if string.match(text, 'a') then    text = string.gsub(text, 'a', "ش")     end
if string.match(text, 'b') then    text = string.gsub(text, 'b', "ذ")     end
if string.match(text, 'c') then    text = string.gsub(text, 'c', "ز")     end
if string.match(text, 'd') then    text = string.gsub(text, 'd', "ی")     end
if string.match(text, 'e') then    text = string.gsub(text, 'e', "ث")     end
if string.match(text, 'f') then    text = string.gsub(text, 'f', "ب")     end
if string.match(text, 'g') then    text = string.gsub(text, 'g', "ل")     end
if string.match(text, 'h') then    text = string.gsub(text, 'h', "ا")     end
if string.match(text, 'i') then    text = string.gsub(text, 'i', "ه")     end
if string.match(text, 'j') then    text = string.gsub(text, 'j', "ت")     end
if string.match(text, 'k') then    text = string.gsub(text, 'k', "ن")     end
if string.match(text, 'l') then    text = string.gsub(text, 'l', "م")     end
if string.match(text, 'm') then    text = string.gsub(text, 'm', "ئ")     end
if string.match(text, 'n') then    text = string.gsub(text, 'n', "د")     end
if string.match(text, 'o') then    text = string.gsub(text, 'o', "خ")     end
if string.match(text, 'p') then    text = string.gsub(text, 'p', "ح")     end
if string.match(text, 'q') then    text = string.gsub(text, 'q', "ض")     end
if string.match(text, 'r') then    text = string.gsub(text, 'r', "ق")     end
if string.match(text, 's') then    text = string.gsub(text, 's', "س")     end
if string.match(text, 't') then    text = string.gsub(text, 't', "ف")     end
if string.match(text, 'u') then    text = string.gsub(text, 'u', "ع")     end
if string.match(text, 'v') then    text = string.gsub(text, 'v', "ر")     end
if string.match(text, 'w') then    text = string.gsub(text, 'w', "ص")     end
if string.match(text, 'x') then    text = string.gsub(text, 'x', "ط")     end
if string.match(text, 'y') then    text = string.gsub(text, 'y', "غ")     end
if string.match(text, 'z') then    text = string.gsub(text, 'z', "ظ")     end
if string.match(text, ',') then    text = string.gsub(text, ',', "و")     end
if string.match(text, "`") then    text = string.gsub(text, '`', "پ")     end
if string.match(text, "'") then    text = string.gsub(text, "'", "گ")     end
if string.match(text, ';') then    text = string.gsub(text, ';', "ک")     end
if string.match(text, ']') then    text = string.gsub(text, ']', "چ")     end
return text

 elseif matches[1]:lower() == 'en' and matches[2] then
     if msg.to.type == "user" then 
        return 
        end
     text = matches[2]:lower()
     if string.len(text) > 100 then 
        return "More than 100 characters are not allowed"
     end
if string.match(text, 'ش') then    text = string.gsub(text, 'ش', "a")     end
if string.match(text, 'ذ') then    text = string.gsub(text, 'ذ', "b")     end
if string.match(text, 'ز') then    text = string.gsub(text, 'ز', "c")     end
if string.match(text, 'ی') then    text = string.gsub(text, 'ی', "d")     end
if string.match(text, 'ث') then    text = string.gsub(text, 'ث', "e")     end
if string.match(text, 'ب') then    text = string.gsub(text, 'ب', "f")     end
if string.match(text, 'ل') then    text = string.gsub(text, 'ل', "g")     end
if string.match(text, 'ا') then    text = string.gsub(text, 'ا', "h")     end
if string.match(text, 'ه') then    text = string.gsub(text, 'ه', "i")     end
if string.match(text, 'ت') then    text = string.gsub(text, 'ت', "j")     end
if string.match(text, 'ن') then    text = string.gsub(text, 'ن', "k")     end
if string.match(text, 'م') then    text = string.gsub(text, 'م', "l")     end
if string.match(text, 'ئ') then    text = string.gsub(text, 'ئ', "m")     end
if string.match(text, "د") then    text = string.gsub(text, 'د', "n")     end
if string.match(text, 'خ') then    text = string.gsub(text, 'خ', "o")     end
if string.match(text, 'ح') then    text = string.gsub(text, 'ح', "p")     end
if string.match(text, 'ض') then    text = string.gsub(text, 'ض', "q")     end
if string.match(text, 'ق') then    text = string.gsub(text, 'ق', "r")     end
if string.match(text, 'س') then    text = string.gsub(text, 'س', "s")     end
if string.match(text, 'ف') then    text = string.gsub(text, 'ف', "t")     end
if string.match(text, 'ع') then    text = string.gsub(text, 'ع', "u")     end
if string.match(text, 'ر') then    text = string.gsub(text, 'ر', "v")     end
if string.match(text, 'ص') then    text = string.gsub(text, 'ص', "w")     end
if string.match(text, 'ط') then    text = string.gsub(text, 'ط', "x")     end
if string.match(text, 'غ') then    text = string.gsub(text, 'غ', "y")     end
if string.match(text, 'ظ') then    text = string.gsub(text, 'ظ', "z")     end
if string.match(text, 'چ') then    text = string.gsub(text, 'چ', "ch")    end
if string.match(text, 'خ') then    text = string.gsub(text, 'خ', "kh")    end
return text
end

      -------------reverse Character text   -------------
  if matches[1]:lower() == 'roll' then
     if msg.to.type == "user" then 
        return 
        end
     roll =  string.reverse(matches[2])
     return roll
     end
       -------------Count Character text   -------------
  if matches[1]:lower() == 'count' then
     if msg.to.type == "user" then 
        return 
        end
     count =  string.len(matches[2])
     return count
end
    -------------Terminal   -------------
if matches[1] == "run" and is_sudo(msg) then
     if msg.to.type == "user" then 
        return 
        end
      if not is_sudo(msg) then
         return "You aren't allowed!"
         end
     cmd = io.popen(matches[2])
     result = cmd:read('*all')
     cmd:close()
     send_large_msg(get_receiver(msg), result, ok_cb, false)
     return
  end
end
end
return {               
patterns = {
   "^[!/]([Aa]ddplugin) (.+) (.*)$",
   "^[!/]([Cc]reatefile) ([^%s]+) (.+)$",
   "^[!/]([Cc]lean) (msg) (%d*)$",
   "^[!/]([Cc]ount) (.*)",
   "^[!/]([Dd]el) ([Ll]ink)$",
   "^[!/]([Dd]l) ([Pp]lugin) (.*)$",
   "^[!/]([Dd]elplugin) (.*)$",
   "^[!/]([Dd]lfile) (.*) (.*)$",
   "^[!/]([Dd]l) (file) (.*)/(.*)$",
   "^[!/]([Dd]el) (.*)$",
   "^[!/]([Ee]cho) (.*)$",
   "^[!/]([Ee]n) (.*)$",
   "^[!/]([Ff]eedback)$",
   "^[!/]([Ff]eedback) (.*)$",
   "^[!/]([a]r) (.*)$",
   "^[!/]([Gg]it) (.*)",
   "^[!/]([Gg]ituser) (.*)/(.*)",
   "^[!/]([Gg]itdl) (.*)/(.*)",
   "^[!/]([Ll]ink)$",
   "^[!/]([Ll]inkpv)$",
   "^[!/]([Ll]ink) ([Pp]v)$",
   "^[!/]([Mm]ean) (.*)$",
   "^[!/]([Rr]eply) (.*)$",
   "^[!/]([Rr]oll) (.*)",  
   "^[!/]([Rr]un) (.*)$",
   "^[!/]([Ss]ave) (.*)/(.*)$",
   "^[!/]([Ss]et) ([Tt]ype) (.*)$",
   "^[!/]([Ss]et) ([Ll]ink)",
   "^[!/]([Ss]how) (.*)$",
   "^[!/]([Ss]hort) (.*)$",
   "^[!/]([Tt]r) ([^%s]+) (.*)$",
   
  "^[!/]([Vv]oice) (.*)$",
   "%[(document)%]",
   "%[(photo)%]",
   "^(https://telegram.me/joinchat/%S+)$",
   "^(.*)$",
 }, 
run = run,
}

--[[ 
    _____    _        _    _    _____    Dev @lIMyIl 
   |_   _|__| |__    / \  | | _| ____|   Dev @li_XxX_il
     | |/ __| '_ \  / _ \ | |/ /  _|     Dev @h_k_a
     | |\__ \ | | |/ ___ \|   <| |___    Dev @Aram_omar22
     |_||___/_| |_/_/   \_\_|\_\_____|   Dev @IXX_I_XXI
              CH > @lTSHAKEl_CH
--]]
