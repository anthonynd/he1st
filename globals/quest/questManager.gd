extends Node

onready var Quest = load("res://globals/quest/quest.gd")

var QuestList = []

func add_quest(title: String, quantity: int, optional := false):
	QuestList.append(Quest.new(title, quantity, optional))
	return QuestList.size() - 1

func progress_quest(quest_index: int, value: int):
	QuestList[quest_index].add_progress(value)

func clear_quests():
	QuestList = []

func print_quests():
	for quest in QuestList:
		if quest.optional:
			get_node("/root/globals").printOnScreen("%s: %s / %s (optional)" % [quest.title, quest.currentValue, quest.goal])
		else:
			get_node("/root/globals").printOnScreen("%s: %s / %s" % [quest.title, quest.currentValue, quest.goal])