import flixel.addons.display.FlxBackdrop;
var bg1 = FlxBackdrop;
var blackBarThingie:FlxSprite;
function create() {
	bg1 = new FlxBackdrop(Paths.image('stages/beatus/bars')); //its a flxbackdrop because it loops!
	bg1.moves = true;
	bg1.setGraphicSize(Std.int(bg1.width * 3));
	bg1.active = true;
	bg1.visible = true;
	bg1.antialiasing = true;
	insert(members.indexOf(dad), bg1);
	insert(members.indexOf(gf), bg1);
	insert(members.indexOf(boyfriend), bg1);
	bg1.screenCenter();
	FlxTween.tween(bg1, {angle: 360}, 40, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});

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

