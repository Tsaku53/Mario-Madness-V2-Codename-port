var __timer:Float = 0;
function update(elapsed:Float) {
    __timer += elapsed;
    strumLines.members[2].characters[0].x = (100+150*Math.sin(__timer));
    strumLines.members[2].characters[0].y = (275+50*Math.cos(__timer));
    strumLines.members[3].characters[0].x = (-50+250*Math.sin(__timer));
    strumLines.members[3].characters[0].y = (900+50*Math.cos(__timer));
}
function create(){
camHUD.alpha = 0.000;
defaultCamZoom = 1;
strumLines.members[2].characters[0].alpha = 0.000;
strumLines.members[3].characters[0].alpha = 1;
boyfriend.alpha = 0.000;
remove(BackBG);
remove(Alone_Fire);
remove(FrontBG);
remove(Skybox);
remove(gf);
remove(dad);
remove(boyfriend);
remove(strumLines.members[3].characters[0]);
add(Skybox);
add(BackBG);
add(strumLines.members[3].characters[0]);
add(FrontBG);
add(strumLines.members[2].characters[0]);
add(dad);
add(boyfriend);
for (i in playerStrums.members){
i.alpha = 0.000;
  }
}
function stepHit(){
if (curStep == 187){
FlxTween.tween(camHUD, {alpha: 1},5);
FlxTween.tween(boyfriend, {alpha: .5},3);
FlxTween.tween(strumLines.members[2].characters[0], {alpha: .8},3);
defaultCamZoom = 0.7;
for (i in playerStrums.members){
FlxTween.tween(i, {alpha: 1},5);
  }

 }
}