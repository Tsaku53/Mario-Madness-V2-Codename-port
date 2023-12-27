import funkin.options.OptionsMenu;

var canDoShit:Bool = true;
var optionsPressed:Bool = false;

function create(){
    warningTxt = new Alphabet(450, 300, "WARNING", true);
    warningTxt.scrollFactor.set(0.05, 0.05);
    add(warningTxt);

    warningDesc1 = new FunkinText(-550, 205, 550,
        "In case if you never heard about Codename Engine, this is a W.I.P engine that has bugs and unfinished things. If you see any bugs found from the engine, please report them to the discord server or in the github's issues page.",
        30);
    add(warningDesc1);

    warningDesc2 = new FunkinText(1350, 400, 550,
        "This port has flashing lights that can affect some people. You can press ESCAPE right now to open up the options menu if you need to turn anything off.",
        30);
    add(warningDesc2);

    enterTxt = new FunkinText(225, 725, 0, "Press ENTER to bootup the port.", 48);
    enterTxt.alignment = 'middle';
    add(enterTxt);
}

function update(){
    new FlxTimer().start(.2, function() {FlxTween.tween(warningTxt, {alpha: 1}, .75);});

    new FlxTimer().start(1, function(){
        FlxTween.tween(warningTxt, {y: 100}, 1, {ease: FlxEase.sineOut});
        FlxTween.tween(warningDesc1, {x: 75}, 1, {ease: FlxEase.sineOut});
        FlxTween.tween(warningDesc2, {x: 675}, 1, {ease: FlxEase.sineOut});
        FlxTween.tween(enterTxt, {y: 625}, 1, {ease: FlxEase.sineOut});
    });

    if (FlxG.keys.justPressed.ENTER && canDoShit) pressedEnter();
    else if (FlxG.keys.justPressed.ESCAPE) pressedEscape();
}

function pressedEnter(){
	canDoShit = false;
    FlxTween.tween(FlxG.camera, {alpha: 0}, .75, {ease: FlxEase.quintOut});
	CoolUtil.playMenuSFX(1);
    FlxTween.tween(window, {x: 650, y: 325, width: 640, height: 360}, 1, {ease: FlxEase.sineOut});
	new FlxTimer().start(2, function() {
		FlxG.switchState(new TitleState());
	});
}

function pressedEscape(){
	FlxG.switchState(new OptionsMenu());
	optionsPressed = true;
}