import funkin.game.Stage;
var preloadedStages = [];

function postCreate() {
	for (event in events) {
		if (event.name == 'Change Stage') {
			var newstage = new Stage(event.params[0]);
			add(newstage);
			for (spr in newstage.stageSprites) {
				spr.alpha = 0.001;
				remove(spr);
				insert(0, spr);
			}
			preloadedStages.push(newstage);
		}
	}
}

function onEvent(_) {
	if (_.event.name == 'Change Stage') {
		var stuff = preloadedStages.pop();
		for (spr in stage.stageSprites) remove(spr);
		for (spr in stuff.stageSprites) spr.alpha = 1;
		stage = stuff;
		if (_.event.params[1] != false) for (sl in strumLines.members) for (char in sl.characters) stage.applyCharStuff(char, sl.data.position, 1);
	}
}