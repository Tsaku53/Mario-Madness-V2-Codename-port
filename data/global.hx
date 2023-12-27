import funkin.backend.utils.NativeAPI;

static var redirectStates:Map<FlxState, String> = [
    TitleState => "customStates/MarioTitleState",
];

function update(elapsed) {
    if (FlxG.keys.justPressed.F6)
        NativeAPI.allocConsole();
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();
    if (FlxG.keys.justPressed.F7)
        FlxG.switchState(new MainMenuState());
}

function preStateSwitch() {
    FlxG.camera.bgColor = 0xFF000000;

	for (redirectState in redirectStates.keys())
		if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}