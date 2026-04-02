local __add_scroll_target = add_scroll_target
local name_to_level = {
    ["bob"] = LEVEL_BOB,
    ["wf"] = LEVEL_WF,
    ["jrb"] = LEVEL_JRB,
    ["ccm"] = LEVEL_CCM,
    ["bbh"] = LEVEL_BBH,
    ["hmc"] = LEVEL_HMC,
    ["lll"] = LEVEL_LLL,
    ["ssl"] = LEVEL_SSL,
    ["ddd"] = LEVEL_DDD,
    ["sl"] = LEVEL_SL,
    ["wdw"] = LEVEL_WDW,
    ["ttm"] = LEVEL_TTM,
    ["thi"] = LEVEL_THI,
    ["ttc"] = LEVEL_TTC,
    ["rr"] = LEVEL_RR,
    ["bitdw"] = LEVEL_BITDW,
    ["bitfs"] = LEVEL_BITFS,
    ["bits"] = LEVEL_BITS,
    ["bowser_1"] = LEVEL_BOWSER_1,
    ["bowser_2"] = LEVEL_BOWSER_2,
    ["bowser_3"] = LEVEL_BOWSER_3,
    ["totwc"] = LEVEL_TOTWC,
    ["cotmc"] = LEVEL_COTMC,
    ["vcutm"] = LEVEL_VCUTM,
    ["sa"] = LEVEL_SA,
    ["pss"] = LEVEL_PSS,
    ["wmotr"] = LEVEL_WMOTR,
    ["ending"] = LEVEL_ENDING,
    ["castle_grounds"] = LEVEL_CASTLE_GROUNDS,
    ["castle_inside"] = LEVEL_CASTLE,
    ["castle_courtyard"] = LEVEL_CASTLE_COURTYARD,
}

local has_inited_levels = {}
local has_finished_levels = {}
local prev_level = 0

---@param index integer
---@param vb string
local function add_scroll_target(index, vb)
    local level_name_start = vb:find("_") + 1
    if not level_name_start then return end
    local level_name_end = vb:find("_", level_name_start + 1) - 1
    local level_name = vb:sub(level_name_start, level_name_end)
    if level_name == "castle" or level_name == "bowser" then
        level_name_end = vb:find("_", level_name_end + 2) - 1
        level_name = vb:sub(level_name_start, level_name_end)
    end
    local level = name_to_level[level_name]
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if np.currLevelNum ~= level or has_finished_levels[level] then return end
    if level ~= prev_level then
        if prev_level ~= 0 then
            if has_inited_levels[level] then
                has_finished_levels[level] = true
            else
                has_inited_levels[level] = true
            end
        end
        prev_level = level
    end

    __add_scroll_target(index, vb)
end

local function on_level_init()
add_scroll_target(0, "VB_bob_1_0xe036d80")
add_scroll_target(0, "VB_bob_1_0xe036e30")
add_scroll_target(1, "VB_bob_1_0xe028d80")
add_scroll_target(1, "VB_bob_1_0xe028e10")
add_scroll_target(1, "VB_bob_1_0xe028ec0")
add_scroll_target(1, "VB_bob_1_0xe028f50")
add_scroll_target(2, "VB_bob_1_0xe036e60")
add_scroll_target(2, "VB_bob_1_0xe036f30")
add_scroll_target(3, "VB_wf_1_0xe03e1e0")
add_scroll_target(3, "VB_wf_1_0xe03e270")
add_scroll_target(3, "VB_wf_1_0xe03e360")
add_scroll_target(3, "VB_wf_1_0xe03e430")
add_scroll_target(3, "VB_wf_1_0xe03e500")
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)