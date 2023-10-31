----------
-- INIT --
----------
local rx, ry = getResolution()
rxP = rx +250
ryP = ry +30
t = getTime()
time = math.cos(t)
local constants = require("cpml/constants")
background = createLayer()
local layer = createLayer()
local front = createLayer()
local text = createLayer()    -- Value layer
--local font = loadFont('FiraMono', 20)
font_size = 24
font = loadFont('TurretRoad', font_size)
font_size_big = 60
font_big = loadFont('TurretRoad-Bold', font_size_big)

local fontAH, fontDH = getFontMetrics(font)
local background_image = loadImage("assets.prod.novaquark.com/102348/3cf92ccf-e518-4456-9d90-f115b6324b0f.jpg")
local logo_image = loadImage("assets.prod.novaquark.com/102348/0aefd9db-95e5-4e3e-96ce-6ae1b248e94d.png")
Header = "SCOREBOARD"

-- Set default text color to red
setDefaultFillColor(layer, Shape_Text, 0, 0.8, 2, 1)

if not init then
    init = true
    data = {{"283453","!!!","TheGreatSardini"},{"23434","!!!","RyanPryde"}}
    buffer = ""
    comState = ""
end



local concat, format, floor = table.concat, string.format, math.floor

function internalSerialize(table, tC, t)
    t[tC] = "{"
    tC = tC + 1
    if #table == 0 then
        local hasValue = false
        for key, value in pairs(table) do
            hasValue = true
            local keyType = type(key)
            if keyType == "string" then
                t[tC] = key .. "="
            elseif keyType == "number" then
                t[tC] = "[" .. key .. "]="
            elseif keyType == "boolean" then
                t[tC] = "[" .. tostring(key) .. "]="
            else
                t[tC] = "notsupported="
            end
            tC = tC + 1
            local check = type(value)
            if check == "table" then
                tC = internalSerialize(value, tC, t)
            elseif check == "string" then
                t[tC] = '"' .. value .. '"'
            elseif check == "number" then
                t[tC] = value
            elseif check == "boolean" then
                t[tC] = tostring(value)
            else
                t[tC] = '"Not Supported by Deserializer"'
            end
            t[tC + 1] = ","
            tC = tC + 2
        end
        if hasValue then
            tC = tC - 1
        end
    else
        for i = 1, #table do
            local value = table[i]
            local check = type(value)
            if check == "table" then
                tC = internalSerialize(value, tC, t)
            elseif check == "string" then
                t[tC] = '"' .. value .. '"'
            elseif check == "number" then
                t[tC] = value
            elseif check == "boolean" then
                t[tC] = tostring(value)
            else
                t[tC] = '"Not Supported by Deserializer"'
            end
            t[tC + 1] = ","
            tC = tC + 2
        end
        tC = tC - 1
    end
    t[tC] = "}"
    return tC
end

function serialize(value)
    local t = {}
    local check = type(value)
    
    if check == "table" then
        internalSerialize(value, 1, t)
    elseif check == "string" then
        return '"' .. value .. '"'
    elseif check == "number" then
        return value
    elseif check == "boolean" then
        return tostring(value)
    else
        return '"Not Supported by Deserializer"'
    end
    return concat(t)
end

function deserialize(s)
    return load("return " .. s)()
end


--function SecondsToClock(seconds)
--  local seconds = tonumber(seconds)
--  if seconds <= 0 or floor(seconds/3600) > 24 then
--    return "00:00:00"
--  else
--    local hours = format("%02.f", floor(seconds/3600))
--    local mins = format("%02.f", floor(seconds/60 - (hours*60)))
--    local secs = format("%02.f", floor(seconds - hours*3600 - mins *60))
--    if tonumber(hours) > 0 then
--        return hours.."h : "..mins.."min : "..secs.."sec"
--    else
--         return mins.."min : "..secs.."sec"   
--    end
--  end
--end

function SecondsToClock(seconds)
    local seconds = tonumber(seconds)
    local miliSec = seconds - floor(seconds) 
    if seconds <= 0 then --or floor(seconds/3600) > 24 
        return "00min : 00sec"
    else
        local hours = format("%02.f", floor(seconds/3600))
        local mins = format("%02.f", floor(seconds/60 - (hours*60)))
        local secs = format("%02.f", floor(seconds - hours*3600 - mins *60))
        return format("%.0fmin : %.0fsec : %0.fms", hours*60+mins, secs, miliSec*1000)
    end
end 

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

--rx, ry = getResolution()
data2Display = ""
--------Input values
input = getInput()
getInputData = {players={}}
bestTimeData = {}
lapData = {}
totalLaps = 0
circuitName = ""
startTime = 0
raceMode = ""


setLayerOrigin(text, rx * 0.5, ry * 0.5)
setLayerRotation(text, 90 * constants.deg2rad) --Text Rotation(90°)
--setLayerRotation(Ltext, 3.14/2) --Text Rotation(90°)


if input ~= "" then
    getInputData = deserialize(input)
    if type(getInputData) == "table" then
        if getInputData.p[1] and getInputData.p[1].n and getInputData.p[1].bT and not getInputData.p[1].l then
            bestTimeData = getInputData
            
        elseif getInputData.p[1] and getInputData.p[1].n and getInputData.p[1].bT and getInputData.p[1].l and getInputData.p[1].tT then
            lapData = getInputData
        end
        if getInputData.circuitName then
            circuitName = getInputData.cN
            raceMode = getInputData.rM
            totalLaps = getInputData.l
            startTime = getInputData.sT
            data2Display = raceMode.." mode active for: "..circuitName
        end
    end
end


-------------








if raceMode == "lap" then
    -- displayed a score table with name/lap/best time/total time columns
    -- use lapData table
    setNextTextAlign(text, AlignH_Center, AlignV_Middle)
    addText(text, font, data2Display, rx/2, ry/2)
elseif raceMode == "bestTime" then
    -- displayed a score table with name/best time columns
    -- use bestTimeData table
    setNextTextAlign(text, AlignH_Center, AlignV_Middle)
    addText(text, font, data2Display, rx/2, ry/2)
end
-------------------Deko Frame-------------------
setNextStrokeWidth(front,5)
setNextStrokeColor(front,0, 0.4, 1, 1)
setNextFillColor(front,0,0,0,0)
addBoxRounded(front,10,10,rx -20,ry -20,40)
---------------------------------------------
setNextStrokeWidth(text,2)
setNextStrokeColor(text,1, 1, 1, time)
setNextFillColor(text, 0, 0.4, 1, 1)
setNextTextAlign(text, AlignH_Center, AlignV_Middle)
addText(text, font_big, Header, rx/2-50, ry/2-450)
---------------------------------------------
setNextFillColor(text,1,1,1,1)
addImage(text,logo_image,rx-350,ry-790,120,60) -- logo Image
setNextFillColor(background,1,1,1,0.3)
addImage(background,background_image,0,0,rx,ry) -- Background Image


--test ="bla="..tostring(raceMode)
--setNextTextAlign(text, AlignH_Center, AlignV_Middle)
--    addText(text, font, test, rx/2, ry/2)
setLayerOrigin(layer, rx * 0.5, ry * 0.5)
setLayerRotation(layer, 90 * constants.deg2rad) --Text Rotation(90°) 

for k, v in ipairs(getInputData.p) do
    -- How many fit vertically
    local fit = math.floor(ryP/fontAH)
    if k > fit*2 then break end

    --local text = string.format('%s %s %s', k, v.n, SecondsToClock(v.bT))
    local textX = 10+math.floor((k-1)/fit)*rxP/2
    local textY = (fontAH+10)*(((k-1)%fit)+1)

    if v[4] then setNextFillColor(layer, 0, 1, 0, 1) end
    if k == 1 then setNextFillColor(layer, 1, 0, 0, 1) end
    addText(layer, font, tostring(k), textX+230, textY-120)
    if k == 1 then setNextFillColor(layer, 1, 0, 0, 1) end
    addText(layer, font, tostring(string.sub(v.n,1,15)), textX+290, textY-120)
    if k == 1 then setNextFillColor(layer, 1, 0, 0, 1) end
    addText(layer, font, tostring(SecondsToClock(v.bT)), textX+530, textY-120)
end

requestAnimationFrame(10)
