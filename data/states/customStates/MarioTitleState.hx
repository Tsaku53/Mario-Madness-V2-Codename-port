var canDoShit:Bool = true;

function new() CoolUtil.playMenuSong();

function create(){
    enterTxt = new FlxText(0, 0, 0, "Press Enter to Begin", 32);
    enterTxt.screenCenter();
    add(enterTxt);
}

function update(){
    if (controls.ACCEPT && canDoShit){
        canDoShit = false;
        if (FlxG.save.data.flashingLights) FlxG.camera.flash(FlxColor.WHITE, 1);
		CoolUtil.playMenuSFX(1);
        new FlxTimer().start(.75, function(tmr:FlxTimer){FlxTween.tween(FlxG.camera, {alpha: 0}, .75, {ease: FlxEase.quintInOut});});
        new FlxTimer().start(1.5, function(tmr:FlxTimer){
            FlxTween.tween(window, {x: 350, y: 200, width: 1280, height: 720}, 1, {ease: FlxEase.quartOut}).onComplete = function(){
                FlxG.resizeWindow(1280, 720);
                FlxG.scaleMode.width = 1280;
                FlxG.scaleMode.height = 720;
                FlxG.switchState(new MainMenuState());
            };
        });
    }
}