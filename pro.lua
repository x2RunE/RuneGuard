local executor = getexecutorname() or identifyexecutor()
if executor:find('Seliware') or executor:find('Potassium') then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/430615b200c84fe7"))()
else
  loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ef1142e6e0c5dc2c7feaa45ee24f1068.lua"))()
end
