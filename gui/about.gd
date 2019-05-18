extends Control

func _ready():
	$buttons/back.connect("pressed", self, "_setView", [["main"]])

func start():
	var licenseFile = File.new()
	licenseFile.open("res://LICENSE", File.READ);
	
	var distLicenseFile = File.new()
	distLicenseFile.open("res://dist.LICENSE", File.READ);
	
	$aboutPanel/info.text = "he1st LICENSE\n\n" + licenseFile.get_as_text() + \
		"\nOther LICENSES\n\n" + distLicenseFile.get_as_text()
	print()

func end():
	$aboutPanel/info.text = null

func _setView(views: Array):
	get_parent().setCurrentView(views)