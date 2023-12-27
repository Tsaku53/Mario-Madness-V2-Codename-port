import flixel.FlxObject;

public var cameraMovementStrength=20;
public var cameraMovementEnabled=false;


function postCreate() {
    trace(cameraMovementEnabled);
}

function update(elapsed:Float){
}

function postUpdate(elapsed:Float){
    if (!cameraMovementEnabled)return;
    var anim=strumLines.members[curCameraTarget].characters[0].getAnimName();
    switch(anim){
        case "singLEFT"|"singLEFT-alt": 
            camFollow.x-=cameraMovementStrength;
        case "singDOWN"|"singDOWN-alt": 
            camFollow.y+=cameraMovementStrength;
        case "singUP"|"singUP-alt": 
            camFollow.y-=cameraMovementStrength;
        case "singRIGHT"|"singRIGHT-alt": 
            camFollow.x+=cameraMovementStrength;
        default:
    }
}
