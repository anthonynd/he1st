extends Node

var title: String
var currentValue: int = 0
var goal: int = 0
var optional: bool = false
var discription: String = ""

func _init(_title: String, _goal: int, _optional: bool):
	self.title = _title
	self.goal = _goal
	self.optional = _optional

func add(delta: int):
	self.currentValue += delta

func isDone():
	return currentValue == goal