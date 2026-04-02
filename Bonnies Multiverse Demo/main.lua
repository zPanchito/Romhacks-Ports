-- name: Bonnies Multiverse Demo
-- description: A small but enjoyable romhack with 14 stars, perfect for passing the time. \n\nRomhack made by: Crossbonnie\n\Port by: \\#00ff00\\zPan\\#ffff00\\cho!
-- incompatible: romhack

gLevelValues.fixCollisionBugs = true
gServerSettings.skipIntro = 1
gServerSettings.stayInLevelAfterStar = 1
hook_event(HOOK_MARIO_UPDATE, function (m) m.peakHeight = m.pos.y end)