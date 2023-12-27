import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

var firstTxt:FlxText;
var secondTxt:FlxText;
var thirdTxt:FlxText;
var size = 175;
function create() {
	firstTxt = new FlxText(0, 250, 2000, "", 1000);
	firstTxt.setFormat(Paths.font("Retro Gaming.ttf"), size, FlxColor.WHITE, "center");
	firstTxt.screenCenter();
	firstTxt.y -= size;
	firstTxt.scrollFactor.set();
	add(firstTxt);
	firstTxt.cameras = [camGame];
	secondTxt = new FlxText(0, 250, 2000, "", 1000);
	secondTxt.setFormat(Paths.font("Retro Gaming.ttf"), size, FlxColor.WHITE, "center");
	secondTxt.screenCenter();
	secondTxt.scrollFactor.set();
	add(secondTxt);
	secondTxt.cameras = [camGame];
	thirdTxt = new FlxText(0, 250, 2000, "", 1000);
	thirdTxt.setFormat(Paths.font("Retro Gaming.ttf"), size, FlxColor.WHITE, "center");
	thirdTxt.screenCenter();
	thirdTxt.scrollFactor.set();
	thirdTxt.y += size;
	add(thirdTxt);
	thirdTxt.cameras = [camGame];
}

function onEvent(e) {
	if (e.event.name == 'text') {
		firstTxt.text = e.event.params[0];
		secondTxt.text = e.event.params[1];
		thirdTxt.text = e.event.params[2];
	}
}

function update() {
}