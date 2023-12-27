function postUpdate(elapsed:Float) {
	switch(curCameraTarget) {
		case 0: 	dad.visible = true;
					boyfriend.visible = false;
					gf.visible = false;
					blackBarThingie.alpha = 0;

					alreadychange = false;

		case 1:
					dad.visible = false;
					boyfriend.alpha = 1;
					boyfriend.visible = true;
					gf.visible = true;
					gf.alpha = 1;
					blackBarThingie.alpha = 0.3;

	}
}

function postCreate() {
    var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/beatus/bars'));
	bg.scale.set(3, 3);
	bg.screenCenter();
	bg.scrollFactor.set(0, 0);
	bg.antialiasing = true;
	insert(members.indexOf(dad) - 1, bg);
	add(bg);

}