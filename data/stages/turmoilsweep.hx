var charging:bool = false;
var chargesfx:FlxSound;
var blastsfx:FlxSound;
var ddge:Float = 0;
var dBar:FlxSprite;
var dTimer:Float = 0;
var blastTimer:Float = 0;
var blastin:Bool = false;
function create(){
defaultCamZoom = 0.4;
}
function postCreate() {
	chargesfx = FlxG.sound.play(Paths.sound("Metronome_Tick"), 1);
	chargesfx.volume = 0;
	blastsfx = FlxG.sound.play(Paths.sound("blast"), 1);
	blastsfx.volume = 0;

    	dBar = new FlxSprite();
	dBar.makeGraphic(500, 50, FlxColor.CYAN);
	dBar.x = 750;
	dBar.y = 350;
	dBar.camera = camGame;
	dBar.origin.set(0, 0);
	add(dBar);
    	tBar = new FlxSprite();
	tBar.makeGraphic(500, 25, FlxColor.WHITE);
	tBar.x = 800;
	tBar.y = 325;
	tBar.origin.set(0, 0);
	add(tBar);
}

function charge() {
	charging = true;
}
function blast() {
	charging = false;
	if (ddge == 0) {
		blastsfx = FlxG.sound.play(Paths.sound("blast"), 1);
		blastsfx.volume = 1;
		blastTimer = 1;
                dad.animation.play('attack', true);
		blastin = true;
	}
	if (ddge > 0) {
		ddge = 1;
		camGame.flash(FlxColor.fromRGB(255,255,255), 1);
		blastsfx = FlxG.sound.play(Paths.sound("blast"), 1);
		blastsfx.volume = 1;
                dad.playAnim("attack");
		dTimer = dTimer / 2;
	}
}

function update() {
	if (FlxG.keys.justPressed.SPACE && ddge == 0 && dTimer == 0) {
		ddge = 1;
		dTimer = 8;
		boyfriend.animation.play('dodge', true);
		chargesfx.volume = 1;
	}
	if (ddge > 0) {
		trace(ddge);
		ddge -= 0.025;
		boyfriend.animation.play('dodge', true);
		
	} else if (ddge <= 0 && dTimer > 0) {
	
	} else if (dTimer == 0) {
	
	}

	if (ddge < 0) {
		ddge = 0;
	}
	if (dTimer > 0) {
		dTimer -= 0.025;
	} else if (dTimer < 0) {
		dTimer = 0;
	}
	
	dBar.x = boyfriend.x + 150;
	dBar.scale.x = ddge;
	tBar.x = boyfriend.x + 150;
	tBar.scale.x = dTimer/8;

	if (blastTimer > 0) {
		blastTimer -= 0.1;
	} else if (blastTimer < 0) {
		blastTimer = 0;
	}
	if (blastTimer <= 0 && ddge == 0 && blastin) {
		health -= 1;
		blastin = false;
	}
	if (blastTimer <= 0 && ddge != 0 && blastin) {
		blastin = false;
		dTimer = dTimer / 2;
	}
}

function beatHit(curBeat) {
	if (charging) {
		chargesfx = FlxG.sound.play(Paths.sound("Metronome_Tick"), 1);
		chargesfx.volume = 7;
	}
}