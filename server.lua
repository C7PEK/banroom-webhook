--  ░█████╗░██╗░░░██╗██████╗░███████╗██╗░░██╗░░░██╗░██╗░░█████╗░░█████╗░░█████╗░███████╗
--  ██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██║░██╔╝██████████╗██╔══██╗██╔══██╗██╔══██╗██╔════╝
--  ██║░░╚═╝░╚████╔╝░██████╔╝█████╗░░█████═╝░╚═██╔═██╔═╝╚██████║██║░░██║╚█████╔╝██████╗░
--  ██║░░██╗░░╚██╔╝░░██╔═══╝░██╔══╝░░██╔═██╗░██████████╗░╚═══██║██║░░██║██╔══██╗╚════██╗
--  ╚█████╔╝░░░██║░░░██║░░░░░███████╗██║░╚██╗╚██╔═██╔══╝░█████╔╝╚█████╔╝╚█████╔╝██████╔╝
--  ░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚══════╝╚═╝░░╚═╝░╚═╝░╚═╝░░░░╚════╝░░╚════╝░░╚════╝░╚═════╝░

ESX = nil

local banroom = "webhook"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("EasyAdmin:banPlayer")  -- Trigger od EasyAdmina
AddEventHandler('EasyAdmin:banPlayer', function(playerId,reason,expires,username) 
     local sourceXPlayer = ESX.GetPlayerFromId(source)
    local steamname = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    if expires and expires < os.time() then
        expires = os.time()+expires 
    elseif not expires then 
        expires = 10444633200
    end
    local identifier = GetPlayerIdentifiers(source)[1]
      for _, foundID in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(foundID, "license:") then
            licenserc = string.sub(foundID, 9)
      elseif string.match(foundID, "discord:") then
        discordid = string.sub(foundID, 9)
        end
    end
          local banroom_embed = 
          {
              {
                  ["title"]="YourRP - Banroom",
                  ["color"] = "",
                  ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S'),
                  ["fields"] = {
                      {
                          ["name"]= "Osoba Zbanowana",
                          ["value"]= username,
                          ["inline"] = true
                      },
                      {
                          ["name"]= "Osoba Banujaca",
                          ["value"]= '<@'..discordid..'>',
                          ["inline"] = false
                      },                      
          
                      {
                        ["name"]= "Długość Bana",
                        ["value"]=  os.date('%d/%m/%Y 	%H:%M:%S', expires ),
                        ["inline"] = false
                    },
                      {
                          ["name"]= "Powód Bana",
                          ["value"]= reason,
                          ["inline"] = false
                      },                   
                  },
                  ["footer"] = {
                      ["text"] = "YourRP",
                  },
              },
          }
          PerformHttpRequest(banroom, function(err, text, headers) end, 'POST', json.encode({username = "YourRP - Banroom", embeds = banroom_embed}), { ['Content-Type'] = 'application/json' })
  end)


--  ░█████╗░██╗░░░██╗██████╗░███████╗██╗░░██╗░░░██╗░██╗░░█████╗░░█████╗░░█████╗░███████╗
--  ██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██║░██╔╝██████████╗██╔══██╗██╔══██╗██╔══██╗██╔════╝
--  ██║░░╚═╝░╚████╔╝░██████╔╝█████╗░░█████═╝░╚═██╔═██╔═╝╚██████║██║░░██║╚█████╔╝██████╗░
--  ██║░░██╗░░╚██╔╝░░██╔═══╝░██╔══╝░░██╔═██╗░██████████╗░╚═══██║██║░░██║██╔══██╗╚════██╗
--  ╚█████╔╝░░░██║░░░██║░░░░░███████╗██║░╚██╗╚██╔═██╔══╝░█████╔╝╚█████╔╝╚█████╔╝██████╔╝
--  ░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚══════╝╚═╝░░╚═╝░╚═╝░╚═╝░░░░╚════╝░░╚════╝░░╚════╝░╚═════╝░