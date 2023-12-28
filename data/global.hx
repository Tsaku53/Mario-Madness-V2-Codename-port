import funkin.backend.utils.NativeAPI;

static var initialized:Bool = false;

function new(){
    // settings that get set to true on first launch

    if (FlxG.save.data.flashingLights == null) FlxG.save.data.flashingLights = true;
}

static var redirectStates:Map<FlxState, String> = [
    TitleState => "customStates/MarioTitleState",
    MainMenuState => "customStates/MarioMainMenuState",
];

function update(elapsed) {
    if (FlxG.keys.justPressed.F6)
        NativeAPI.allocConsole();
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();
}

function preStateSwitch() {
    FlxG.camera.bgColor = 0xFF000000;

	if (!initialized) {
		initialized = true;
		FlxG.game._requestedState = new ModState('customStates/WarningState');
	} else
		for (redirectState in redirectStates.keys())
			if (FlxG.game._requestedState is redirectState)
				FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}