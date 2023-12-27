FlxG.resizeWindow(640, 360);
FlxG.resizeGame(640, 360);
FlxG.scaleMode.width = 640;
FlxG.scaleMode.height = 360;

function create(){
    enterTxt = new FlxText(0, 0, 0, "Press Enter to Begin", 32);
    enterTxt.screenCenter();
    add(enterTxt);
}

function update(){
    if (controls.ACCEPT){
        FlxTween.tween(FlxG.camera, {alpha: 0}, .75, {ease: FlxEase.quintInOut});
        new FlxTimer().start(1, function(tmr:FlxTimer){
            FlxTween.tween(window, {width: 1280, height: 720}, 1, {ease: FlxEase.quartOut}).onComplete = function(){
                FlxG.resizeWindow(1280, 720);
                FlxG.scaleMode.width = 1280;
                FlxG.scaleMode.height = 720;
                FlxG.switchState(new MainMenuState());
            };
        });
    }
}