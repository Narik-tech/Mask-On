extends  Label

func _ready():
	text = ""
	var temp_text := ""
	for action in InputMap.get_actions():
		if action.begins_with("ui_"):
			continue
		temp_text += action + ": "
		var events = InputMap.action_get_events(action)
		var names := []
		for event in events:
			names.append(event.as_text().replace(" - Physical", ""))
		temp_text += ", ".join(names) + "\n"
	text = temp_text
