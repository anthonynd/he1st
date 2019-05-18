extends Control

func setCurrentView(guiName: Array):
	var children = get_children()
	for child in children:
		if(guiName.has(child.name)):
			child.visible = true
			if(child.has_method("start")):
				child.start()
		if(!guiName.has(child.name) and child.visible):
			child.visible = false
			if(child.has_method("exit")):
				child.exit()