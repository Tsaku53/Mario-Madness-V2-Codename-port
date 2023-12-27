
var blackBarThingie:FlxSprite;
function create() {
	bg.screenCenter();

	bg.antialiasing = true;
	add(bg);
	FlxTween.tween(bg, {angle: 360}, 40, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});

    	blackBarThingie = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
	blackBarThingie.setGraphicSize(Std.int(blackBarThingie.width + 100));
	blackBarThingie.scrollFactor.set(0, 0);
	blackBarThingie.screenCenter();
	add(blackBarThingie);
}

var dummyvar = 0;
function postUpdate(elapsed:Float) {
    switch(curCameraTarget) {
        case 0:     dad.visible = true;
                    boyfriend.visible = false;
                    gf.visible = false;
                    
            if (dummyvar != -1) {
			blackBarThingie.alpha = 0.3;
                        FlxTween.tween(blackBarThingie, {alpha: 0},1, {ease: FlxEase.linear, type: FlxTween.ONESHOT});    
            		dummyvar = -1;
            }

                    alreadychange = false;

        case 1:
                    dad.visible = false;
                    boyfriend.alpha = 1;
                    boyfriend.visible = true;
                    gf.visible = true;
                    gf.alpha = 1;
                    
            if (dummyvar != 1) {
			blackBarThingie.alpha = 0.3;
                        FlxTween.tween(blackBarThingie, {alpha: 0},1, {ease: FlxEase.linear, type: FlxTween.ONESHOT});    
                        dummyvar = 1;
            }
    }
}
