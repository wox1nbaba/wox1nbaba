-- Kare boyutlarını ve merkezini tanımla
local squareSize = Vector3.new(20, 20, 20) -- Kare boyutları
local squareCenter = Vector3.new(0, 10, 0) -- Kare merkezi

-- Oyuncuların isimlerini göstermek için kullanılacak fonksiyon
local function showPlayerNames()
    for _, player in ipairs(game.Players:GetPlayers()) do
        -- Oyuncunun karakterini kontrol et
        if player.Character then
            local character = player.Character
            -- Oyuncunun karakteri karenin içinde mi kontrol et
            if character:FindFirstChild("HumanoidRootPart") then
                local rootPart = character.HumanoidRootPart
                local rootPosition = rootPart.Position
                -- Kare içinde ise ismi göster
                if math.abs(rootPosition.X - squareCenter.X) <= squareSize.X / 2 and
                   math.abs(rootPosition.Z - squareCenter.Z) <= squareSize.Z / 2 then
                    -- Oyuncunun karakterinin başında bir BillboardGui oluştur
                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = rootPart
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 3, 0) -- Karakterin başından biraz yukarıda göstermek için

                    -- BillboardGui'ye bir TextLabel ekle
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = billboard
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.Text = player.Name -- Oyuncunun adını yaz
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Font = Enum.Font.SourceSansBold
                    textLabel.TextScaled = true
                end
            end
        end
    end
end

-- Oyuncuların isimlerini gösterme fonksiyonunu çağır
showPlayerNames()
