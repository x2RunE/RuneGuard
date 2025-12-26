local executor = getexecutorname() or identifyexecutor()
if executor:find('Seliware') then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/RuneGuard/refs/heads/main/script.lua"))()
else
  loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ef1142e6e0c5dc2c7feaa45ee24f1068.lua"))()
end
