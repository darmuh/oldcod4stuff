/*

Scripted by Darmuh
xfire: irroy8

//help from rycoon

*/

//________                                ______  
//___  __ \_____ ______________ _______  ____  /_ 
//__  / / /  __ `/_  ___/_  __ `__ \  / / /_  __ \
//_  /_/ // /_/ /_  /   _  / / / / / /_/ /_  / / /
///_____/ \__,_/ /_/    /_/ /_/ /_/\__,_/ /_/ /_/ 
                                                
init( version )
{
	level waittill( "round_started" );
	if( level.freerun )
		thread actiall();

}

actiall()
{
	wait 2;
	iprintlnbold ( "Traps will now be ^1activated^7" );
	for( i = 0; i < level.trapTriggers.size; i++ )
	{
		wait 2;
		if( !isDefined( level.trapTriggers[i] ) )
			continue;

		players = getEntArray( "player", "classname" );
		if( !isDefined( players ) || !players.size )
			continue;

		level.trapTriggers[i] UseBy( players[0] ); //thanks braxi for that one. useby wasn't working with level.player or level.activator	
		iPrintln( "Trap " + (i+1) + " activated!" );
	}
	iprintlnbold ( " [^1" + level.trapTriggers.size + "^7] ^1traps ^7activated" );
}