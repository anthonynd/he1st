extends Node

onready var Quest = load("res://globals/quest/quest.gd")

var QuestList = [];

func _ready():
	QuestList.append(Quest.new("Kill 2 enemies", 2, false))
	print(QuestList[0].title)
	print(QuestList[0].isDone())
	QuestList[0].add(2) # "Killing Enemies"
	print(QuestList[0].isDone())