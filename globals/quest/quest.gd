extends Node

var title: String
var currentValue: int = 0
var goal: int = 0
var optional: bool = false
var description: String = ""

func _init(_title: String, _goal: int, _optional := false):
	self.title = _title
	self.goal = _goal
	self.optional = _optional

func add_progress(delta: int):
	self.currentValue += delta

func isDone():
	return currentValue == goal