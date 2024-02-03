/*
 
Scripted by Darmuh
xfire: irroy8

small help from lossy :)
 
*/
 
//________                                ______  
//___  __ \_____ ______________ _______  ____  /_
//__  / / /  __ `/_  ___/_  __ `__ \  / / /_  __ \
//_  /_/ // /_/ /_  /   _  / / / / / /_/ /_  / / /
///_____/ \__,_/ /_/    /_/ /_/ /_/\__,_/ /_/ /_/

#include braxi\_common;
                                               
init( version )
{
        level waittill( "round_started" );
        if( level.mapHasTimeTrigger == true )
        thread roundnumb();
        else
		iprintln( "^1WARNING: ^7Map does not have end trigger!" );
}
 
roundnumb()
{
        randomround = RandomInt( 10 );
        if( randomround == ( game["roundsplayed"] + 1 ) )
			thread fastestTime();
     /*   else if( level.freeRun == true ) //this is here so I can test :)
                thread fastestTime(); */
        else
			{
                iprintlnbold( "First Place Reward ^1Disabled^7." );
			}
}
 
 
fastestTime()
{
	trig = getEntArray( "endmap_trig", "targetname" );
	if( !trig.size || trig.size > 1 )
		return;

	level.mapHasTimeTrigger = true;

	trig = trig[0];
	 iprintlnbold( "First Place Reward ^2Enabled^7." );
	while( 1 )
	{
		trig waittill( "trigger", user );

		if( !user isReallyAlive() || user.pers["team"] == "axis" )
			continue;
		
		user thread firstPlace();
	}
}

firstplace()
{
		if( isDefined( level.finishedMapforxp ) )
		return;

		level.finishedMapforxp = true;
        thread braxi\_mod::drawInformation( 800, 0.8, 1, "^2" + self.name + " ^7finished first and received ^3250XP^7!" );
        thread braxi\_mod::drawInformation( 800, 0.8, -1, "^2" + self.name + " ^7finished first and received ^3250XP^7!" );
		self braxi\_rank::giveRankXP( "", 250 );
}