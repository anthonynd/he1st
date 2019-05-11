extends Node

onready var Quest = load("res://globals/quest/quest.gd")

var QuestList = []
var gui = null

func _ready():
	gui = get_node("/root/globals").gui

func add_quest(title: String, quantity: int, optional := false):
	QuestList.append(Quest.new(title, quantity, optional))
	return QuestList.size() - 1

func progress_quest(quest_index: int, value: int):
	QuestList[quest_index].add_progress(value)

func clear_quests():
	QuestList = []

func print_quests():
	var inGameUI = gui.get_node("inGameUI")
	if(gui and inGameUI):
		inGameUI.updateQuestList()