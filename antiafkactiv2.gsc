#include braxi\_dvar;
#include braxi\_mod;
#include braxi\_common;

//Youtube.com/darmuh!

init( modVers )
{
	addDvar( "antiafkacti", "antiafk_enable", 1, 0, 1, "int" );
	if( !level.dvar["antiafkacti"] )
		return;

	addDvar( "aa_traps", "antiafk_traps", 0, 0, 1, "int" );
	addDvar( "aa_warn", "antiafk_warn", 10, 3, 60, "int" );
	addDvar( "aa_time", "antiafk_time", 15, 5, 120, "int" );
	addDvar( "aa_team", "antiafk_team", 0, 0, 1, "int" );
	addDvar( "aa_trapdelay", "antiafk_trapdelay", 5, 1, 60, "int" );
	addDvar( "aa_teltotraps", "antiafk_teleporttotraps", 0, 0, 1, "int" );
	addDvar( "aa_wmsg", "antiafk_wmessage", "Please move your ass!", "", "", "string" );
	while(1)
	{
		level waittill( "activator", guy );
		thread finmapcheck();
		guy thread TrapActivation();
	}
}

NoTelMap()
{
return isSubStr( "godfather caelum long bigfall iwillrockyou sewers jurapark factory diehard azteca cherry backlot cosmic dragonball flow highrise disco darmuhv2 watercity sm_v2 ruin2", braxi\_maps::getMapNameString( level.mapName ) );
}

newacti()
{
	level notify( "picking activator" );
	level endon( "picking activator" );
	
	players = getAllPlayers();
	if( !isDefined( players ) || isDefined( players ) && !players.size || players.size <= 2 )
		return;

	num = randomInt( players.size );
	guy = players[num];

	if( level.dvar["dont_make_peoples_angry"] == 1 && guy getEntityNumber() == getDvarInt( "last_picked_player" ) )
	{	
		if( isDefined( players[num-1] ) && isPlayer( players[num-1] ) )
			guy = players[num-1];
		else if( isDefined( players[num+1] ) && isPlayer( players[num+1] ) )
			guy = players[num+1];
	}
	
	if( !isDefined( guy ) && !isPlayer( guy ) || level.dvar["dont_pick_spec"] && guy.sessionstate == "spectator"  || !guy isReallyAlive() )
	{
		level thread newacti();
		return;
	}
	
	bxLogPrint( ("A: " + guy.name + " ; guid: " + guy.guid) );
	iPrintlnBold( guy.name + "^2 was picked to be the new ^1Activator^2!" );
		
	guy thread braxi\_teams::setTeam( "axis" );
	guy spawnPlayer();
	guy braxi\_rank::giveRankXp( "activator" );
		
	setDvar( "last_picked_player", guy getEntityNumber() );
	level notify( "activator", guy );
	level.activ = guy;
	wait 0.1;
}

finmapcheck()
{
	trig = getent("endmap_trig", "targetname");
	
	trig waittill ( "trigger", player );
	level notify( "mapfin" );
}

TrapActivation()
{
	level endon( "newactivator" );
	level endon( "intermission" );
	level endon( "game over" );
	level endon( "mapfin" );
	level endon( "endround" );
	self endon( "disconnect" );
	self endon( "trapsdone" );
	self endon( "death" );
	

	if( !isDefined( self ) || !isPlayer( self ) || !isAlive( self ) )
		return;

	if (level.jumpers <= 2 )
			return;	
	self checkAFK();

	if( level.dvar["aa_traps"] == 1 )
		{
			if(  level.trapsDisabled || !isDefined( level.trapTriggers ) || !level.trapTriggers.size )
			{
				if (level.jumpers < 2)
					return;
				iprintlnbold( "^1>> ^2Picking new Activator due to inactivity (AFK)!" );
				thread newacti();
				if( isAlive( self ) )
					self suicide();
				level.activators = 0;
				level.activatorKilled = false;
				level.activ = undefined;
				team = "allies";
				if( getdvarInt("aa_team") == 1 )
					team = "spectator";
				self.pers["team"] = team;
				self.team = team;
				self.sessionteam = team;
				self spawnSpectator( level.spawn["spectator"].origin, level.spawn["spectator"].angles );
				level notify( "newactivator" );
				return;
			}

			if( !isDefined( self ) || !isPlayer( self ) || !isAlive( self ) )
				return;
				
			iprintlnbold( "^7Server now activating for Activator(AFK)!" );
			for(i=0;i<level.trapTriggers.size;i++)
			{
				if( !isDefined( self ) || !isAlive( self ) )
					return;

				if( !isDefined( level.trapTriggers[i] ) )
					continue;

				origin = level.trapTriggers[i].origin;
				pos = PlayerPhysicsTrace( origin+(0,0,100), origin-(0,0,40) );
				level.trapTriggers[i] UseBy( self );
				self iPrintln( "Trap #" + (i+1) );
				if( getdvarInt("aa_teltotraps") == 0  || NoTelMap() )
				{
					oldang = self.angles;
					oldpos = self.origin;
					wait level.dvar["aa_trapdelay"];
					if( oldpos != self.origin || oldang != self.angles)
					{
						iPrintlnbold( "Activator is back!" );
						return;
					}
				}
				else
				{
					self setOrigin( pos );
					wait 0.25;
					oldang = self.angles;
					oldpos = self.origin;			
					wait level.dvar["aa_trapdelay"];
					if( oldpos != self.origin || oldang != self.angles )
					{
						iPrintlnbold( "Activator is back!" );
						return;
					}
				}
			}
			iPrintlnbold( "End of trap activation!" );

		}
	else if( level.dvar["aa_traps"] == 0 )
		{
			if (level.jumpers < 2)
					return;
				iprintlnbold( "^1>> ^2Picking new Activator due to inactivity (AFK)!" );
				thread newacti();
				if( isAlive( self ) )
					self suicide();
				level.activators = 0;
				level.activatorKilled = false;
				level.activ = undefined;
				team = "allies";
				if( getdvarInt("aa_team") == 1 )
					team = "spectator";
				self.pers["team"] = team;
				self.team = team;
				self.sessionteam = team;
				self spawnSpectator( level.spawn["spectator"].origin, level.spawn["spectator"].angles );
				level notify( "newactivator" );
				return;
		}
	else
		{
			if(  level.trapsDisabled || !isDefined( level.trapTriggers ) || !level.trapTriggers.size )
			{
				if (level.jumpers < 2)
					return;
				iprintlnbold( "^1>> ^2Picking new Activator due to inactivity (AFK)!" );
				thread newacti();
				if( isAlive( self ) )
					self suicide();
				level.activators = 0;
				level.activatorKilled = false;
				level.activ = undefined;
				team = "allies";
				if( getdvarInt("aa_team") == 1 )
					team = "spectator";
				self.pers["team"] = team;
				self.team = team;
				self.sessionteam = team;
				self spawnSpectator( level.spawn["spectator"].origin, level.spawn["spectator"].angles );
				level notify( "newactivator" );
				return;
			}

			if( !isDefined( self ) || !isPlayer( self ) || !isAlive( self ) )
				return;
				
			iprintlnbold( "^7Server now activating for Activator(AFK)!" );
			for(i=0;i<level.trapTriggers.size;i++)
			{
				if( !isDefined( self ) || !isAlive( self ) )
					return;

				if( !isDefined( level.trapTriggers[i] ) )
					continue;

				origin = level.trapTriggers[i].origin;
				pos = PlayerPhysicsTrace( origin+(0,0,100), origin-(0,0,40) );
				level.trapTriggers[i] UseBy( self );
				self iPrintln( "Trap #" + (i+1) );
				if( getdvarInt("aa_teltotraps") == 0  || NoTelMap() )
				{
					oldang = self.angles;
					oldpos = self.origin;
					wait level.dvar["aa_trapdelay"];
					if( oldpos != self.origin || oldang != self.angles)
					{
						iPrintlnbold( "Activator is back!" );
						return;
					}
				}
				else
				{
					self setOrigin( pos );
					wait 0.25;
					oldang = self.angles;
					oldpos = self.origin;			
					wait level.dvar["aa_trapdelay"];
					if( oldpos != self.origin || oldang != self.angles )
					{
						iPrintlnbold( "Activator is back!" );
						return;
					}
				}
			}
			iPrintlnbold( "End of trap activation!" );

		}
}

checkAFK()
{
	self endon( "disconnect" );
	self endon( "death" );

	wmessage = (level.dvar["aa_wmsg"]);
	oldpos = self.origin;
	oldang = self.angles;
	time = 0;

	while(1)
	{
		wait 1;
		if( Distance( self.origin, oldpos ) < 10 && self.angles == oldang )
		{
			time++;
			if( time == level.dvar["aa_time"] )
				return;
			else if( time == level.dvar["aa_warn"] )
				self iPrintlnBold( wmessage );
		}
		else
		{
			oldpos = self.origin;
			oldang = self.angles;
			time = 0;
		}
	}
}