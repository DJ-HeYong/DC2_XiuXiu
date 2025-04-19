//内置修改器
document.addEventListener("keydown", function(t) {
    e.push(t.key),
    e.length > 6 && e.shift(),
    "opengg" == e.join("") && bmy1.networkManager.CCheckUseridByGM(void 0, function() {
        gm.uimgr.createPanel(gm.panels.main)
    })
})