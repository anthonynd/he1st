extends Control

onready var score = $CenterContainer/HBoxContainer/VBoxContainer/Score

func set_score(value: int):
	score.text = "Score: " + str(value)
