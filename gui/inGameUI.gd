extends Control

func _ready():
	$questPanel/questList.bbcode_enabled = true;
	pass

func updateQuestList():
	var qList = "[b]Objectives[/b]\n"
	for quest in questManager.QuestList:
		var currentQuest = "%s: %s / %s" % [quest.title, quest.currentValue, quest.goal]
		if quest.optional:
			currentQuest += " (optional)"
		if quest.isDone():
			currentQuest = "[color=#88ffffff]%s[/color]" % currentQuest
		
		qList += currentQuest + "\n"
	$questPanel/questList.bbcode_text = qList

func playerHealth(current, total):
	$playerInfo.text = "HP: %s/%s" % [current, total]

func setGunName(name: String):
	$gunInfo/gunName.text = "%s" % [name]

func setGunAmmo(mag, ammo):
	$gunInfo/gunAmmo.text = "%s/%s" % [mag, ammo]