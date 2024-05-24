shared.VapeIndependent = true
shared.CustomSaveVape = "Game-SaveFile"
local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()



local Combat = GuiLibrary.ObjectsThatCanBeSaved.CombatWindow.Api
local Blatant = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api
local Render = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api
local Utility = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api
local World = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api




local TextChatService = game:GetService('TextChatService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Workspace = game:GetService('Workspace')



if game.PlaceId == 5736409216 then
    Utility.CreateOptionsButton({
        Name = 'Auto-Collect',
        Function = function(callback)
            if callback then
                while callback and task.wait(0.5) do
                    if ReplicatedStorage:FindFirstChild('RemoteEvent') then
                        local args = {
                            [1] = 'RequestCollectCash'
                        }

                        ReplicatedStorage:WaitForChild('RemoteEvent'):FireServer(unpack(args))
                    end

                    if not callback then
                        break
                    end
                end
            end
        end,
        HoverText = 'Automaticly Collects the Money'
    })


    Render.CreateOptionsButton({
        Name = 'Button-ESP',
        Function = function(callback)
            if callback then
                while callback and task.wait(0.5) do
                    local Floors = Workspace['Tycoon'..tostring(game:GetService('Players').LocalPlayer.Name)]:GetDescendants()
                    local FloorTable = {}
                    local ButtonTable = {}


                    for i, v in Floors do
                        if v and v.ClassName == 'Model' then
                            if string.find(v.Name, 'Floor') then
                                table.insert(FloorTable, v)
                            end
                        end
                    end


                    for i = 1, #FloorTable do
                        local Target = FloorTable[i]


                        if Target:FindFirstChild('Contents') then
                            for _, Button_Models in Target:FindFirstChild('Contents'):GetChildren() do
                                if Button_Models and Button_Models.ClassName == 'Model' then
                                    if Button_Models:FindFirstChild('Button') then
                                        table.insert(ButtonTable, Button_Models:FindFirstChild('Button'))
                                    end
                                end
                            end
                        end
                    end


                    local function Apply_ESP(part)
                        if part then
                            if not part:FindFirstChild('ESP') then
                                local ESP = Instance.new('Highlight', part)
                                ESP.Name = 'ESP'
                                ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                ESP.FillTransparency = 1
                                ESP.OutlineTransparency = 0
                                ESP.OutlineColor = Color3.new(1, 1, 1)
                                ESP.Adornee = part
                            end
                        end
                    end


                    for i = 1, #ButtonTable do
                        if ButtonTable[i] and ButtonTable[i].ClassName == 'MeshPart' then
                            Apply_ESP(ButtonTable[i])
                        else
                            print('Missed entity from Buttons Table: '..tostring(ButtonTable[i])..' WITH THE ClassName OF: '..tostring(ButtonTable[i].ClassName))
                        end
                    end
                end
            else

            end
        end,
        HoverText = 'Apply ESP to Buttons'
    })
end


-- loadstring(game:HttpGet('https://raw.githubusercontent.com/SubnauticaLaserMain/VapeV4-MoreGames-Support/main/main2.lua', true))()
