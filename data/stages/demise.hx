//this is my home -deadlyne

import flixel.addons.display.FlxBackdrop;

var path1:String = "stages/demise/1/";
var path2:String = "stages/demise/2/";
<<<<<<< HEAD
var shader:CustomShader = null; //suck ass
var shader2:CustomShader = null; //suck ass
=======
>>>>>>> f65d04f (demise)

function create() {

    //Lib.application.window.title="Friday Night Funkin': Mario's Madness | Demise | KennyL";    

<<<<<<< HEAD
    defaultCamZoom = 0.7;
=======
    defaultCamZoom = 0.3;
>>>>>>> f65d04f (demise)

    dad.x = 700;
    dad.y = -30;
    boyfriend.y = 300;

    remove(dad);
    remove(gf);
    remove(boyfriend);

    bg1 = new FlxBackdrop(Paths.image("stages/demise/1/Demise_BG_BG2"),1,1,false,true);
    bg1.scale.set(0.8,0.8);
    bg1.velocity.set(50, 0);
    bg1.y = -100;

    bg = new FlxBackdrop(Paths.image("stages/demise/1/Demise_BG_BGCaca"),1,0,false,true);
    bg.scale.set(0.8,0.8);
    bg.velocity.set(250, 0);

    bush = new FlxBackdrop(Paths.image("stages/demise/1/Demise_BG_BG1"),1,1,false,true);
    bush.scale.set(0.7,0.7);
    bush.velocity.set(1500, 0);
    bush.y = 400;
    
    floor = new FlxSprite();
    floor.frames = Paths.getFrames(path1 +'Demise_BG_suelo');
    floor.animation.addByPrefix('idle', "Floor", 48);
    floor.animation.play('idle');
    floor.antialiasing = false;
    //floor.screenCenter(); stupid idea
    floor.y = 700;
    floor.x = -450;
    floor.scale.set(0.7,0.7);
    floor.visible = true; //for the switch stages
    floor.updateHitbox();

    legs = new Character(dad.x + 20, dad.y + 400, "MXBody", true);
    legs.playAnim("Legs");
    legs.scale.set(0.8,0.8);

    arm = new Character(dad.x - 200, dad.y + 250, "MXBody", true);
    arm.playAnim("Right Arm");
    arm.scale.set(0.8,0.8);

    legs2 = new Character(boyfriend.x + 75, boyfriend.y - 625, "BFBody", true);
    legs2.playAnim("Legs");
    legs2.scale.set(0.8,0.8);

    arm2 = new Character(boyfriend.x, boyfriend.y + 125, "BFBody", true);
    arm2.playAnim("Right Arm");
    arm2.scale.set(0.8,0.8);

    dad.scale.set(0.8,0.8);
    boyfriend.scale.set(0.8,0.8);


    //FlxTween.tween(boyfriend, { x: 100}, 10, { type: FlxTween.PINGPONG, ease: FlxEase.sineInOut});
    

    add(bg1);
    add(bg);
    add(bush);
    add(floor);
    add(arm);
    add(legs);
    add(dad);
    add(arm2);
    add(legs2);
    add(boyfriend);
}

function update() { 
    arm.visible = dad.animation.curAnim.name == "idle";
    arm2.visible = boyfriend.animation.curAnim.name == "idle";
}

function onCameraMove(){
    if (curCameraTarget == 0)
           defaultCamZoom = 0.45;
    if (curCameraTarget == 1)
           defaultCamZoom = 0.7;
}