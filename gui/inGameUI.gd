extends Control

onready var QM = get_node("/root/questManager")

func _ready():
	$questList.bbcode_enabled = true;
	pass

func updateQuestList():
	var qList = "[b]Quests[/b]\n"
	for quest in QM.QuestList:
		if quest.optional:
			qList += "%s: %s / %s (optional)\n" % [quest.title, quest.currentValue, quest.goal]
		else:
			qList += "%s: %s / %s\n" % [quest.title, quest.currentValue, quest.goal]
	$questList.bbcode_text = qList;