var camZoom:Float;
//var camHUDZ:Float; idk how to fix the hudZoom so I just scrap it

function onEvent(eventEvent) {
    if (eventEvent.event.name == "Add Cam Zoom") {
        //FlxTween.tween(camera, {zoom: eventEvent.event.params[0]}, eventEvent.event.params[2], {ease: FlxEase.sineInOut});
        //FlxTween.tween(camHUD, {zoom: eventEvent.event.params[1]}, eventEvent.event.params[2], {ease: FlxEase.sineInOut});
            //FlxG.camera.zoom += eventEvent.event.params[0];
            //camHUD.zoom += eventEvent.event.params[1];
            zoom(eventEvent);
        }
}
function zoom(eventEvent) {
    var hudZoom:Float = 0;
        if (FlxG.camera.zoom < 1.35) {
            camZoom = Std.parseFloat(eventEvent.event.params[0]);
            //camHUDZ = Std.parseFloat(eventEvent.event.params[1]);
            if (Math.isNaN(camZoom))
            camZoom = 0.015;
            //if (Math.isNaN(camHUDZ))
            //camHUDZ = 0.03;
            FlxG.camera.zoom += camZoom;
            //PlayState.camHUD.zoom += camHUDZ;
        }
    }