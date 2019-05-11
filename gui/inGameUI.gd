extends Control

func _ready():
	$questList.bbcode_enabled = true;
	pass

func updateQuestList():
	var qList = "[b]Quests[/b]\n"
	for quest in questManager.QuestList:
		var currentQuest = "%s: %s / %s" % [quest.title, quest.currentValue, quest.goal]
		if quest.optional:
			currentQuest += " (optional)"
		if quest.isDone():
			currentQuest = "[color=#88ffffff]%s[/color]" % currentQuest
		
		qList += currentQuest + "\n"
	$questList.bbcode_text = qList