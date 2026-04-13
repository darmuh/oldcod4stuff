/*

Map created by Darmuh
Scripted by Darmuh
xfire: irroy8

www.YouTube.com/user/Darmuh

www.Raid-Gaming.net

*/

//________                                ______  
//___  __ \_____ ______________ _______  ____  /_ 
//__  / / /  __ `/_  ___/_  __ `__ \  / / /_  __ \
//_  /_/ // /_/ /_  /   _  / / / / / /_/ /_  / / /
///_____/ \__,_/ /_/    /_/ /_/ /_/\__,_/ /_/ /_/ 

#include braxi\_common;

main()
{
	maps\mp\_load::main();
	
	level.plaguefx = LoadFX( "smoke/smoke_trail_black_heli" );
	level.ufoapp = LoadFX( "explosions/ufo_appear" );
	level.ufofx = LoadFX( "ufo/ufo_hover" );
	level.elecfx = LoadFX( "explosions/custom_electricity" );
	level.actifx = LoadFX( "deathrun/actideath_fx" );
	level.twitchfx = LoadFX( "deathrun/twitch_trail_fx" );
	level.secretfx = LoadFX( "deathrun/twitch_woah" );
	level.lightsfx = LoadFX( "deathrun/twitch_room_fx" );
	level.cowsfx = LoadFX ( "deathrun/twitch_room_s" );
	level.loopfx = LoadFX( "deathrun/twitch_trail_loop" );
	level.meteorfx = LoadFX( "fire/meteor_shower" );
	level.vip_trail = LoadFX( "deathrun/vip_trail" );
	level.b_explode = LoadFX( "explosions/aerial_explosion" );
	level.t9bull = LoadFX( "impacts/twitch_bullets" );
	
	level.ufo = getent( "ufo_model", "targetname" );
	level.laser = getent( "ufo_laser", "targetname" );
	
	level.sound = getent( "trap_sorg", "targetname" );
	
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );
	
	precacheModel( "ufo_model" );
	precacheModel( "com_french_toiletbowl" );
	precacheModel( "chicken_static" );
	precacheItem( "darmuh_mp" );
	precacheItem( "m40a3_mp" );
	
	//jumpercow
	//acticow
	
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	SetExpFog( 250, 300, 0.1, 0.1, 0.1, 5 );

	
	level.trapstatus = 1;
	level.ufodone = 0;
	level.ufodone_r = 0;
	level.ufodone_f = 0;
	level.doorstatus = 1;
	level.s_lefthalf = 0;
	level.s_righthalf = 0;
	level.d_righthalf = 0;
	level.d_lefthalf = 0;
	level.u_lefthalf = 0;
	level.u_righthalf = 0;
	level.deathtrap = 0;
	level.wallgood = 0;
	level.oldnum = 0;
	level.roomsnum = 0;
	level.firstenter = true;
	
	level.time = 150; //2.5 MINS
	level.hudYOffset = 10;
	
				/* One Time only traps */
	
	level.trig03 = getent( "trap03", "targetname" );
	level.trig08 = getent( "trap08", "targetname" );
	level.trig09 = getent( "trap09", "targetname" );
	
				/* One Time only traps */
				
	level.trap4hurt1 = getent( "burn_1", "targetname" );
	level.trap4hurt2 = getent( "burn_2", "targetname" );
	level.laser2 = getent( "laser_2", "targetname" );
	level.laser1 = getent( "laser_1", "targetname" );
	level.trap4hurtt1 = getent( "burnn_1", "targetname" );
	level.trap4hurtt2 = getent( "burnn_2", "targetname" );
	level.trap01splat = getent( "splatter", "targetname" );
	level.trap01hurt = getent( "splatterhurt", "targetname" );
	level.trap06hurt = getent( "trigger_ufo_laser", "targetname" );
	level.trap05hurt = getent( "elechurt", "targetname" );
	level.trap05hurtb = getent( "elechurtb", "targetname" );
	level.trap08clip = getent( "trap8clip", "targetname" );
	level.trap07clip = getent( "trap07clip", "targetname" );
	level.trap08org = getent( "trap8acti", "targetname" );
	level.trap8fin = getent( "trap8fin", "targetname" );
	level.slidehurtl = getent( "slidelefthurt", "targetname" );
	level.slidehurtr = getent( "sliderighthurt", "targetname" );
	level.slideright = getent( "slideright", "targetname" );
	level.slideleft = getent( "slideleft", "targetname" );
	level.roomba = getent( "roomba", "targetname" );
	level.roomba_h = getent( "slide_hurt", "targetname" );
	
	level.safe_area = getent( "safe_area", "targetname" );
	//level.ufo_safe = getent( "ufo_safearea", "targetname" );
	
	level.old = getent( "oldwall", "targetname" );
	level.rooms = getent( "roomswall", "targetname" );
	level.roomsfx = getent( "roombowl", "targetname" );
	
	//level.ufo_safe notsolid();
	level.safe_area solid();
	level.rooms notsolid();
	level.rooms hide();
	
	level.roomba_h enablelinkto();
	level.roomba_h linkto( level.roomba );
	level.slidehurtl enablelinkto();
	level.slidehurtr enablelinkto();
	level.slidehurtr linkto( level.slideright );
	level.slidehurtl linkto( level.slideleft );
	level.trap06hurt enablelinkto();
	level.trap06hurt linkto( level.laser );
	level.laser linkto( level.ufo );
	level.trap01hurt enablelinkto();
	level.trap01hurt linkto(level.trap01splat);
	level.trap4hurt1 enablelinkto();
	level.trap4hurt2 enablelinkto();
	level.trap4hurt1 linkto( level.trap4hurtt1 );
	level.trap4hurt2 linkto( level.trap4hurtt2 );
	level.trap05hurt enablelinkto();
	level.trap05hurt linkto( level.trap05hurtb );
	level.roomfx = PlayLoopedFX( level.actifx, 0.1, level.roomsfx.origin );
	//level.playmeteorfx = PlayLoopedFX( level.meteorfx, 0.5, level.trap8fin.origin );
	
	addTriggerToList( "trap04" );
	addTriggerToList( "trap02" );
	addTriggerToList( "trap09" );
	addTriggerToList( "trap03" );
	addTriggerToList( "trap08" );
	addTriggerToList( "trap05" );
	addTriggerToList( "trap06" );
	addTriggerToList( "trap07" );
	addTriggerToList( "trap01" );
	
	ambientPlay( "twitch", 15 );
	
	thread notevenmad();
	
	thread trap01();
	thread trap02();
	thread trap03();
	thread trap04();
	thread trap05();
	thread trap06();
	thread trap07();
	thread trap08();
	thread trap09();
	thread onplayerconnect();
	thread client_map();
	thread client_round();
	//thread freezebots();
	//thread addTestClients();
	//thread testtrap();
	thread definetime();
	SetDvar ("g_gravity", "800" );
	SetDvar ("g_speed", "190" );
	thread endround();
	thread timehud();
	thread texthud();
	thread timewarn();
	thread mapend();
	thread cowboyroom();
	thread surfroom();
	
	level.trap4hurtt1 notsolid();
	level.trap4hurtt2 notsolid();
	level.trap08clip notsolid();
	level.trap07clip notsolid();
	level.trap05hurtb notsolid();
	
}

notevenmad()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	trig = getent( "notevenmad", "targetname" );

	for(;;)
	{
		trig waittill( "trigger", player );
		if( isAlive(player) )
		{
			if( player.pers["didsecret"] == 0 )
			{
				player iprintlnbold( "^7I'm not even mad; that's ^2impressive^7!" );
				wait 1;
				player iprintlnbold( "^7Here have ^2this ^3C:" );
				player TakeAllWeapons();
				player giveweapon( "darmuh_mp" );
				player switchToWeapon( "darmuh_mp" );
				player SetWeaponAmmoClip( "darmuh_mp", 5 );
				player SetWeaponAmmoStock( "darmuh_mp", 0 );
				player thread nukebul2();
				player thread sustainammo();
				player.pers["didsecret"] = 1;
				player SetOrigin( level.trap08org.origin );
			}
			else
			{
				player iprintlnbold( "^7Ok time to stop pal..." );
				wait 0.35;
				player SetOrigin( level.trap08org.origin );
			}
		}
		else
			player iprintln( "shoo" );

		wait 0.05; //added this to stop infinite loops
	}
}

secretcombo()
{
 level endon( "endmap" );
 level endon( "secretdone" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( self IsOnGround() )
			wait 0.1;
		else
			{
				if ( self UseButtonPressed() ) 
				{
					iprintln( "^20" );
					wait 0.01;
					if ( self UseButtonPressed() ) 
					{
						iprintln( "^28" );
						self thread watchcombo();
						break;
					}
				}
				else
					wait 0.05;
			}
		wait 0.05;
	}
}

watchcombo()
{
 level endon( "endmap" );
 level endon( "secretdone" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if(( self GetStance() == "prone") && self MeleeButtonPressed() )
			{
				iprintln( "^20" );
				wait 0.1;
				thread lastcombo();
			}
		else
			{
				if( self.pers["combo"] < 100 )
				{
					wait 0.1;
					self.pers["combo"]++;
				}
				else
					break;
			}
		wait 0.05;
	}
}

lastcombo()
{
 level endon( "endmap" );
 level endon( "secretdone" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if(( self GetStance() == "crouch") && self FragButtonPressed() )
			{
				iprintln( "^28" );
				self thread secretdone();
				break;
			}
		else
			{
				if( self.pers["combo"] < 100 )
				{
					wait 0.1;
					self.pers["combo"]++;
				}
				else
					break;
			}
		wait 0.05;
	}
}

secretdone()
{
 level endon( "endmap" );
 level endon( "secretdone" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	ufostart = getent( "ufostart", "targetname" );
	
	iprintlnbold( "^3" + self.name + "^7 knows the secret combo!" );
	SetExpFog( 5000, 9000, 0.1, 0.1, 0.1, 5 );
	AmbientStop( 2 );
	wait 2;
	AmbientPlay( "goob" );
	wait 1.5;
	playFx( level.secretfx , ufostart.origin );
	playFx( level.secretfx , level.surffx.origin );
	//playFx( level.secretfx , level.cowfx.origin );
	if( self.pers["team"] == "allies" )
	{
		self iprintlnbold( "^7Here have ^2this ^3C:" );
		self TakeAllWeapons();
		self giveweapon( "darmuh_mp" );
		self switchToWeapon( "darmuh_mp" );
		self SetWeaponAmmoClip( "darmuh_mp", 5 );
		self SetWeaponAmmoStock( "darmuh_mp", 0 );
		self.pers["didsecret"] = 1;
		self thread nukebul2();
		self thread sustainammo();
	}
	else
		self iprintln( "luff u" );
	level.activ thread activatorcansee();
	level notify( "secretdone" );
}

activatorcansee()
{
	self setClientDvar( "r_distortion", "0" );
	level waittill( "endround" );
	self setClientDvar( "r_distortion", "1" );
}

mapend()
{
	level waittill( "game over" );
	SetDvar ("g_gravity", "800" );
	SetDvar ("g_speed", "190" );
	iprintlnbold( "Thanks for playing Twitch by Darmuh!" );
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

cowboyroom()
{
 level endon( "endmap" );
 level endon( "endround" );
 
 level.cow_trig = getent( "cowboy", "targetname");
 level.cowfx = getent( "room_cow", "targetname" );
 level.jcow = getEnt( "jumpercow", "targetname" );
 level.acow = getEnt( "acticow", "targetname" );
 //expl = getEnt( "snipesion", "targetname" );
   
	level.cow_trig sethintstring( "FaZe Cowboy BATTLES" );
   
   
 
        level.cow_trig waittill( "trigger", player );
        if( !isDefined( level.cow_trig ) )
            return;
                       
                if(level.firstenter==true)
                {
					level.surf_trig delete();
					level notify( "notold" );
					level.firstenter=false;
                }
		if (level.freerun==true)
		{
			SetExpFog( 5000, 9000, 0.1, 0.1, 0.1, 5 );
			AmbientStop(1);
			MusicStop(1);
			mapsong = (1+randomInt(10));
			ambientPlay( "end_round_" + mapsong );
			//AmbientStop( 2 );
			//AmbientPlay( "cargoship_finale_music" );
			iPrintlnBold( " ^5" + player.name + " picked a 1v1 room during freerun LOL" );
			player thread twitchtrail();
			player SetPlayerAngles( level.jcow.angles );
			player setOrigin( level.jcow.origin );
			//level.activ setPlayerangles( level.acow.angles );
			//level.activ setOrigin( level.acow.origin );
			player freezeControls(true);
			//level.activ freezeControls(true);
			player TakeAllWeapons();
			//level.activ TakeAllWeapons();
			player GiveWeapon( "darmuh_mp" );
			//level.activ GiveWeapon( "darmuh_mp" );
			player switchToWeapon( "darmuh_mp" );
			//level.activ SwitchToWeapon( "darmuh_mp" );
			PlayLoopedFX( level.cowsfx, 1, level.cowfx.origin );
			wait 1;
			iprintlnbold( "3" );
			wait 1;
			iprintlnbold( "2" );
			wait 1;
			iprintlnbold( "1" );
			wait 1;
			iprintlnbold( "GO" );
			player freezeControls(false);
			//level.activ freezeControls(false);
			//thread intimept();
			player thread onDeath_snipe();
			wait 0.1;
       }
	   else
	   {
			SetExpFog( 5000, 9000, 0.1, 0.1, 0.1, 5 );
			AmbientStop(0.5);
			MusicStop(0.5);
			mapsong = (1+randomInt(10));
			ambientPlay( "end_round_" + mapsong );
			iPrintlnBold( " ^5" + player.name + " picked ^3FaZe Cowboy 1V1 BATTLE^7!" );
			player AllowJump(false);
			player thread twitchtrail();
			player SetPlayerAngles( level.jcow.angles );
			player setOrigin( level.jcow.origin );
			level.activ thread twitchtrail();
			level.activ setPlayerangles( level.acow.angles );
			level.activ setOrigin( level.acow.origin );
			player freezeControls(true);
			level.activ freezeControls(true);
			level.activ AllowJump(false);
			player TakeAllWeapons();
			level.activ TakeAllWeapons();
			player GiveWeapon( "darmuh_mp" );
			level.activ GiveWeapon( "darmuh_mp" );
			player switchToWeapon( "darmuh_mp" );
			level.activ SwitchToWeapon( "darmuh_mp" );
			PlayLoopedFX( level.cowsfx, 1, level.cowfx.origin );
			wait 1;
			iprintlnbold( "3" );
			wait 1;
			iprintlnbold( "2" );
			wait 1;
			iprintlnbold( "1" );
			wait 1;
			iprintlnbold( "GO" );
			player freezeControls(false);
			level.activ freezeControls(false);
			//thread intimept();
			player thread onDeath_snipe();
			wait 0.1;
	   }
	   
    for(;;)
    {
                wait .1;              
                while(isAlive(player))
                {
                        wait 1;
                }
               
    }
}

vip_trail()
{
 level endon( "endmap" );
 level endon( "endround" );
 self endon("disconnect");
 self endon( "death" );
 self endon("joined_spectators");
 self endon("killed_player");
 
	while(isAlive(self))
	{
		playFx( level.vip_trail , self.origin );
		wait .1;
	}
}

twitchtrail()
{
	self endon("disconnect");
	self endon( "death" );
	self endon("joined_spectators");
	self endon("killed_player");

	while( isAlive(self) )
	{
		PlayFXOnTag( level.twitchfx, self, "tag_origin" );
		wait 0.2;
	}
}

loop_trail()
{
	self endon("disconnect");
	self endon( "death" );
	self endon("joined_spectators");
	self endon("killed_player");
	PlayLoopedFX( level.loopfx, 1000, self.origin );
}

onplayerconnect()
{
	while(1)
	{
		level waittill("connected", player);
		player.pers["got_weapon"] = 0;
		player.pers["combo"] = 0;
		player.pers["didsecret"] = 0;
		player setclientdvar( "r_distortion", "1" );
	}
}

surfroom()
{
 level endon( "endmap" );
 level endon( "endround" );
 level.surf_trig = getent( "surf", "targetname");
 level.surffx = getent( "room_surf", "targetname" );
 level.jsurf = getEnt( "jsurf", "targetname" );
 level.asurf = getEnt( "asurf", "targetname" );
 //expl = getEnt( "snipesion", "targetname" );
   
	level.surf_trig sethintstring( "SURF BATTLE" );
	
   
 
        level.surf_trig waittill( "trigger", player );
        if( !isDefined( level.surf_trig ) )
            return;
                       
                if(level.firstenter==true)
                {
					level.cow_trig delete();
					level notify( "notold" );
					level.firstenter=false;
                }
		if (level.freerun==true)
		{
			AmbientStop(3);
			MusicStop(3);
			SetExpFog( 5000, 9000, 0.1, 0.1, 0.1, 5 );
			iPrintlnBold( " ^5" + player.name + " picked ^3SURF BATTLE^7!!!" );
			//PlayFXOnTag( level.loopfx, player, "tag_origin" );
			//player thread loop_trail();
			player SetPlayerAngles( level.jsurf.angles );
			player setOrigin( level.jsurf.origin );
			//level.activ setPlayerangles( level.asurf.angles );
			//level.activ setOrigin( level.asurf.origin );
			player freezeControls(true);
			//level.activ freezeControls(true);
			player TakeAllWeapons();
			//level.activ TakeAllWeapons();
			player GiveWeapon( "claymore_mp" );
			player SetWeaponAmmoClip( "claymore_mp", 0 );
			player SetWeaponAmmoStock( "claymore_mp", 0 );   
			//level.activ GiveWeapon( "deserteaglegold_mp" );
			//level.activ SetWeaponAmmoClip( "deserteaglegold_mp", 0 );
			//level.activ SetWeaponAmmoStock( "deserteaglegold_mp", 0 );
			player switchToWeapon( "claymore_mp" );
			//level.activ SwitchToWeapon( "deserteaglegold_mp" );
			SetDvar( "g_speed", "600" );
			SetDvar( "g_gravity", "500" );
			PlayFX( level.lightsfx, level.surffx.origin );
			wait 1;
			iprintlnbold( "3" );
			wait 1;
			iprintlnbold( "2" );
			wait 1;
			mapsong = (1+randomInt(3));
			ambientPlay( "end_map_" + mapsong );
			iprintlnbold( "1" );
			wait 1;
			iprintlnbold( "GO" );
			player freezeControls(false);
			player thread vip_trail();
			player thread nukebul();
			PlayFxOnTag( level.loopfx, player, "j_spinelower" );
			PlayFX( level.lightsfx, player.origin + (3500, 0, 1250) );
			//PlayFX( level.lightsfx, level.activ.origin + (0, 0, 2000) );
			//level.activ freezeControls(false);
			//thread intimept();
			thread surfopen();
			thread surfreset();
			thread surfsnipe();
			thread surfboostera();
			thread surfboosterb();
		}
		else
		{
			AmbientStop(3);
			MusicStop(3);
			SetExpFog( 5000, 9000, 0.1, 0.1, 0.1, 5 );
			iPrintlnBold( " ^5" + player.name + " picked ^3SURF BATTLE^7!!!" );
			player thread loop_trail();
			level.activ thread loop_trail();
			player SetPlayerAngles( level.jsurf.angles );
			player setOrigin( level.jsurf.origin );
			level.activ setPlayerangles( level.asurf.angles + (0, -180, 0 ) );
			level.activ setOrigin( level.asurf.origin );
			player freezeControls(true);
			level.activ freezeControls(true);
			player TakeAllWeapons();
			level.activ TakeAllWeapons();
			player GiveWeapon( "claymore_mp" );
			player SetWeaponAmmoClip( "claymore_mp", 0 );
			player SetWeaponAmmoStock( "claymore_mp", 0 );   
			level.activ GiveWeapon( "claymore_mp" );
			level.activ SetWeaponAmmoClip( "claymore_mp", 0 );
			level.activ SetWeaponAmmoStock( "claymore_mp", 0 );
			player switchToWeapon( "claymore_mp" );
			level.activ SwitchToWeapon( "claymore_mp" );
			SetDvar( "g_speed", "600" );
			SetDvar( "g_gravity", "500" );
			PlayFX( level.lightsfx, level.surffx.origin );
			//PlayFX( level.lightsfx, level.surffx.origin + (-900, 0, 0 ));
			//PlayFX( level.lightsfx, level.surffx.origin + (900, 0, 0 ));
			wait 1;
			mapsong = (1+randomInt(3));
			iprintlnbold( "3" );
			wait 1;
			ambientPlay( "end_map_" + mapsong );
			iprintlnbold( "2" );
			wait 1;
			iprintlnbold( "1" );
			wait 1;
			iprintlnbold( "GO" );
			player freezeControls(false);
			player thread vip_trail();
			PlayFxOnTag( level.loopfx, player, "j_spinelower" );
			//PlayFX( level.lightsfx, player.origin + (3500, 0, 1250) );
			//PlayFX( level.lightsfx, level.activ.origin + (-3500, 0, 1250) );
			level.activ freezeControls(false);
			level.activ thread vip_trail();
			player thread nukebul();
			level.activ thread nukebul();
			PlayFxOnTag( level.loopfx, level.activ, "j_spinelower" );
			//thread intimept();
			thread surfopen();
			thread surfreset();
			thread surfsnipe();
			thread surfboostera();
			thread surfboosterb();
		}
}

onDeath_snipe()
{
	self endon( "disconnect" );
	self endon( "joined_spectators" );
       
		self waittill("death");
		thread cowboyroom();
}

/*
ShootNukeBullets()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill ( "weapon_fired" );
		vec = anglestoforward(self getPlayerAngles());
		end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
		SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
		explode = loadfx( "explosions/aerial_explosion" );
		playfx(explode, SPLOSIONlocation,2000,2000); 
		self thread DamageArea(SPLOSIONlocation,500,800,200,"artillery_mp",false);
		earthquake (0.3, 1, SPLOSIONlocation, 100); 
	}
}
*/

ShootNukeBullets() 
{
		level endon( "endmap" );
		level endon( "endround" );
		self endon("disconnect");
        self endon("death"); 
        for(;;) 
        { 
                self waittill ( "weapon_fired" ); 
                vec = anglestoforward(self getPlayerAngles()); 
                end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000); 
                SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ]; 
                playfx(level.ufoapp, SPLOSIONlocation); 
                RadiusDamage( SPLOSIONlocation, 500, 500, 60, self ); 
                earthquake (0.8, 1, SPLOSIONlocation, 5000);
				//self playsound( "spark" );				
        } 
} 

ShootSplosive() 
{
		level endon( "notold" );
		level endon( "endmap" );
		level endon( "endround" );
		self endon("disconnect");
        self endon("death"); 
        for(;;) 
        { 
                self waittill ( "weapon_fired" ); 
                vec = anglestoforward(self getPlayerAngles()); 
                end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000); 
                SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ]; 
                playfx(level.ufoapp, SPLOSIONlocation); 
                RadiusDamage( SPLOSIONlocation, 220, 220, 20, self ); 
                earthquake (0.6, 1, SPLOSIONlocation, 700); 
				//self playsound( "spark" );
        } 
} 
	
surfboostera()
{
	level endon( "endround" );
	trig = getent("boostera", "targetname");
	
	for(;;)
	{
		trig waittill( "trigger", player );
		wait 0.15;
		player bounce( vectorNormalize( player.origin - (player.origin - (0,0,20)) ), 5000 );
		player bounce( vectorNormalize( player.origin - (player.origin - (0,0,20)) ), 5000 );
		player bounce( vectorNormalize( player.origin - (player.origin - (0,0,20)) ), 5000 );
		wait 0.5;
	}
}

surfboosterb()
{
	level endon( "endround" );
	trig = getent("boosterb", "targetname");
	
	for(;;)
	{
		trig waittill( "trigger", player );
		wait 0.15;
		player bounce( vectorNormalize( player.origin - (player.origin - (0,0,20)) ), 5000 );
		player bounce( vectorNormalize( player.origin - (player.origin - (0,0,20)) ), 5000 );
		player bounce( vectorNormalize( player.origin - (player.origin - (0,0,20)) ), 5000 );
		wait 0.5;
	}
}

surfopen()
{
	while(1)
	{
		level.surf_trig waittill( "trigger", player );
		iPrintlnBold( " ^5" + player.name + " joined the ^3SURF BATTLE^7!!!" );
		player SetPlayerAngles( level.jsurf.angles );
		player setOrigin( level.jsurf.origin );
		player thread nukebul();
		player thread vip_trail();
		player TakeAllWeapons();
		player GiveWeapon( "claymore_mp" );
		player SetWeaponAmmoClip( "claymore_mp", 0 );
		player SetWeaponAmmoStock( "claymore_mp", 0 );
		player switchToWeapon( "claymore_mp" );
		wait 0.05;
	}
}

surfreset()
{
 trig = getent("surf_fail", "targetname");
 
        for(;;)
        {
			trig waittill( "trigger", player );
			if (level.freerun==true)
			{
				player setplayerangles( level.jsurf.angles, 3 );
				player setorigin( level.jsurf.origin, 3 );
			}
			else
			{
				if(player == level.activ)
				{
					level.activ setPlayerangles( level.asurf.angles + (0, -180, 0 )  );
					level.activ setOrigin( level.asurf.origin );
				}
				else
				{
					player setplayerangles( level.jsurf.angles, 3 );
					player setorigin( level.jsurf.origin, 3 );
				}
			}
		}
}

surfsnipe()
{
	level endon( "endround" );
	self endon("joined_spectators");
	
	for(;;)
	{
		trig = getent( "trig_surfsnip", "targetname" );
		trig waittill( "trigger", player );
		if( player.pers["got_weapon"] == 0 )
		{
			player giveWeapon( "darmuh_mp" );
			player switchToWeapon( "darmuh_mp" );
			player SetWeaponAmmoStock( "darmuh_mp", 999 );
			player.pers["got_weapon"] = 1;
			wait 1;
			player thread sustainammo();
			//player thread nukebul();
		}
		else
			continue;
		
		wait 0.1;
	}
}

sustainammo()
{
 level endon( "endmap" );
 level endon( "endround" );
 self endon("disconnect");
 self endon("death"); 

	cws = self GetCurrentWeapon();
	cwclips = self GetWeaponAmmoClip( cws );
	max = cwclips;
	
	while(isalive(self))
	{
		cw = self GetCurrentWeapon();
		cwclip = self GetWeaponAmmoClip( cw );
		
		if( cwclip < max )
			self SetWeaponAmmoClip( cw, max );
		else
			wait 1;
		
		wait 1;
		//iprintlnbold( "Current Wep:^1 " + cw + " ^7cwclip:^1 " + cwclip + " ^7max:^2 " + max + "^7." );
	}

}

nukebul()
{
	self thread ShootNukeBullets();
}

nukebul2()
{
	self thread ShootSplosive();
}

definetime()
{
	for(;;)
	{
		level.time--;
		wait 1;
	}
}

timewarn()
{
	for(;;)
	{
		if ( level.time <= 30 )
		{
			level.sound playsound( "secremain" );
			iprintln( "^0[^5TwitchOS^0]^7: TIME IS ALMOST OUT!" );
			break;
		}
		else
			wait 1;
	}
}

testtrap()
{
	trig = getent( "trap09", "targetname" );
	level waittill( "activator", guy );
	guy SetOrigin( trig.origin );

}

client_map()
{
level waittill( "game over" );
players = getentarray("player","classname");
	wait 2;
	for(i=0;i<players.size;i++)
		{
			if( isDefined(players[i].pers["isBot"]) && players[i].pers["isBot"] == true )
				players[i] iprintlnbold( "you're a bot" );
			else
				{
					////level.ufo_safe solid();
					//players[i] SetClientDvar( "player_sustainAmmo", "0" );
				}
			wait 0.1;
		}
}

client_round()
{
	level waittill( "round_started" );
	players = getentarray("player","classname");
	wait 2;
	for(i=0;i<players.size;i++)
		{
			if( isDefined(players[i].pers["isBot"]) && players[i].pers["isBot"] == true )
				players[i] DisableWeapons();
			else
				{
					////level.ufo_safe solid();
					players[i] thread secretcombo();
					//players[i] SetClientDvar( "player_sustainAmmo", "0" );
				}
			wait 0.1;
		}
}

freezebots()
{
	level waittill( "round_started" );
	players = getentarray("player","classname");
	player_start = getent( "ufo_playerstart", "targetname" );
	wait 2;
	for(i=0;i<players.size;i++)
		{
			if( isDefined(players[i].pers["isBot"]) && players[i].pers["isBot"] == true )
				players[i] freezecontrols(true);
			else
				{
					////level.ufo_safe solid();
					players[i] iprintlnbold( "human detected" );
					players[i] thread nukebul();
				}
			wait 0.1;
		}
}

timehud()
{
	level waittill( "round_started" );
	SetDvar ("g_gravity", "800" );
	SetDvar ("g_speed", "190" );
	level.time_hud = newHudElem();
    level.time_hud.foreground = true;
	level.time_hud.alignX = "left";
	level.time_hud.alignY = "top";
	level.time_hud.horzAlign = "left";
    level.time_hud.vertAlign = "top";
    level.time_hud.x = 0;
    level.time_hud.y = 60 + level.hudYOffset;
    level.time_hud.sort = 0;
  	level.time_hud.fontScale = 3;
	level.time_hud.color = (2.5, 0.8, 0.8);
	level.time_hud.font = "objective";
	level.time_hud.glowColor = (2, 0.8, 0.8);
	level.time_hud.glowAlpha = 1;
 	level.time_hud.hidewheninmenu = false;
	level.time_hud setTimer( level.time );
	wait level.time;
	level.old notsolid();
	level.old hide();
	wait 1;
	thread endtime();
}

texthud()
{		
	level waittill( "round_started" );
	level.acti_hud = newHudElem();
    level.acti_hud.foreground = true;
	level.acti_hud.alignX = "left";
	level.acti_hud.alignY = "top";
	level.acti_hud.horzAlign = "left";
    level.acti_hud.vertAlign = "top";
    level.acti_hud.x = 0;
    level.acti_hud.y = 45 + level.hudYOffset;
    level.acti_hud.sort = 0;
  	level.acti_hud.fontScale = 1.4;
	level.acti_hud.color = (2.5, 0.8, 0.8);
	level.acti_hud.font = "objective";
	level.acti_hud.glowColor = (2, 0.8, 0.8);
	level.acti_hud.glowAlpha = 1;
 	level.acti_hud.hidewheninmenu = false;
	
		if( isDefined( level.freeRun ) && level.freeRun )
			level.acti_hud setText( "Activation Time" );
		else
		{
			level waittill( "activator" );
			level.activ thread nodog();
			level.acti_hud setText( "^7" + level.activ.name + "'s Activation Time" );
		}
}

nodog()
{
	self.isWolf = false;
	self.isDog = false;
	self setModel( "body_mp_usmc_cqb" );
}

endround()
{
	level waittill( "endround" );
	thread deletehuds();
}
	
endtime()
{
	thread doortop();
	thread doorbot();
	//ambientStop( 3 );
	level.sound playsound( "playball" );
	iprintln( "^0[^5TwitchOS^0]^7: PREPARE TO FIGHT!" );
	level notify( "trap_time_over" );
	level thread nomoretraps();
	thread deletehuds();
	level.activ unlink();
	level.activ setModel( "body_mp_usmc_cqb" );
	level.activ show();
	if( level.jumpers >=5 )
		thread oldonly();
	else
	{
		thread roomorold();
		thread checkrooms();
		thread checkold();
	}
}

nomoretraps()
{
	for(;;)
	{
		if( level.trapstatus != 0 )
			{
				level.trapstatus = 0;
				wait 0.05;
				continue;
			}
		else
			{
				wait 0.05;
				continue;
			}
	}
}

roomorold()
{
	oldtrig = getent( "oldtrig", "targetname" );
	
	for(;;)
	{
		wait 0.05;
		
		if( level.roomsnum == 1 )
		{
			level.old solid();
			level.old show();
			break;
		}
		else if( level.oldnum == 1 )
		{
			level.rooms solid();
			level.rooms show();
			break;
		}
		else
		{
			continue;
		}
	
	}
}

checkrooms()
{
	roomtrig = getent( "roomstrig", "targetname" );
	
	while( level.oldnum != 1 || level.roomsnum != 1 )
	{
		roomtrig waittill( "trigger", player );
		if( isAlive( player ) )
		{
			level.roomsnum = 1;
		}
		else
			continue;
	}

}

checkold()
{
	oldtrig = getent( "oldtrig", "targetname" );
	
	while( level.roomsnum != 1 || level.oldnum != 1 )
	{
		oldtrig waittill( "trigger", player );
		if( isAlive( player ) )
		{
			if( player.pers["team"] == "allies" )
				level.oldnum = 1;
			else
				player setOrigin( level.trap8fin.origin );
		}
	}

}

oldonly()
{
	level.rooms solid();
	level.rooms show();
}

deletehuds()
{
	if( isDefined(level.acti_hud) )
		level.acti_hud destroy();
	if( isDefined(level.time_hud) )
		level.time_hud destroy();
}

getorg( num )
{
	if( num == 1 )
		level.uforg = level.ufo_1;
	else if( num == 2 )
		level.uforg = level.ufo_2;
	else if( num == 3 )
		level.uforg = level.ufo_3;
	else if( num == 4 )
		level.uforg = level.ufo_4;
	else
		{
			iprintln( "The number is ^3" + num + "..." );
		}
}

checkTrap( tru )
{
	if( level.trapstatus != tru )
	{
		self iprintlnbold( "Please wait until the previous trap is finished!!" );
		return false;
	}
	else
	{
		level.trapstatus = 0;
		return true;
	}
}

addTestClients()
{
	setDvar("scr_testclients", "");
	wait 1;
	for(;;)
	{
		if(getdvarInt("scr_testclients") > 0)
		break;
		wait 1;
	}
	testclients = getdvarInt("scr_testclients");
	setDvar( "scr_testclients", 0 );
	for(i=0;i<testclients;i++)
	{
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			println("Could not add test client");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread TestClient("autoassign");
	}
	thread addTestClients();
}

TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))

	wait .05;
        
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}

trap01()
{
	level endon( "endmap" );
	self endon( "disconnect" );
	self endon( "joined_spectators" );
	self endon( "death" );
 

	trig = getent( "trap01", "targetname" );
	trig SetHintString( "Make dem go splat" );
	
	while(1)
	{
		trig waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		level.sound playsound( "smash_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: ^1SLAM ^7DUNK ^1SLAM ^7DUNK!" );
		wait 2;
		thread trap01stuff();
	}
}

trap02()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
 
 trig = getent( "trap02", "targetname" );
 trig SetHintString( "Drop the floor on em!" );

	while(1)
	{
		trig waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		level.safe_area notSolid();
		level.d_righthalf = 0;
		level.d_lefthalf = 0;
		level.sound playsound( "dropper_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: WHERE'S THE ^3FLOOR? ^7>:3" );
		wait 1;
		thread right();
		thread left();
		thread checkdrop();
		wait 5;
	}
}

trap03()
{
 level.trig03 SetHintString( "Bring the Plague!" );
 
	for(;;)
	{
		level.trig03 waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		
		if( level.jumpers <= 2 )
			{
				level.trig03 SetHintString( "Unable to be Activated" );
				player iprintlnbold( "Not enough jumpers alive!" );
				wait 1;
				level.trapstatus = 1;
				continue;
			}
		else
			wait 1;
		
		iprintlnbold( "^1" + player.name + " ^7 has brought the plague upon you!" );
		level.sound playsound( "plague_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: IN ^0SICKNESS ^7AND ^2HEALTH!" );
		wait 2;
		thread pickplague();
		break;	
	}
}

pickplague()
{
	level endon( "endmap" );
	level endon( "trap_time_over" );
	self endon( "disconnect" );
	self endon( "joined_spectators" );
	self endon( "death" );
 
	target = getent( "plague", "targetname" );
	
	for(;;)
	{
		target waittill( "trigger", guy );
		wait 0.1;
		if( isDefined(guy) && isAlive(guy) )
		{
			if(  level.jumpers >= 5 && level.jumpers <= 14 )
				{
					if( guy.pers["plague_health"] >= 2 )						
					{
						iprintln( "You become resistant to the plague after having gone through it a few times." );
						level thread pickplague();
						return;
					}
				}
			else if ( level.jumpers >= 15 )
				{
					if( guy.pers["plague_health"] >= 1 )						
					{
						iprintln( "You become resistant to the plague after having gone through it once before." );
						level thread pickplague();
						return;
					}
				}
			else
				iprintln( "The plague is relentless." );
			
			guy.pers["plague_health"]++;
			iPrintlnBold( "^7" + guy.name + " ^7is ^1INFECTED^0! [^3" + guy.pers["plague_health"] + "^0]." );
			guy TakeAllWeapons();
			guy thread plaguefx();
			guy PlayLocalSound("last_alive");
			wait 2;
			guy thread hurttodeath();
			wait 5;
			level.trapstatus = 1;
			level.trig03 SetHintString( "^1Activated" );
			break;
		}
	}
}
/*
pickplague2()
{
 level endon( "endmap" );
 level endon( "trap_time_over" );
	guy = RandomIntRange( 0, level.jumpers +1 );
	for(i=0;i<=level.jumpers;i++)
		{
			if( i == guy )
				{
					if( isDefined(i) && isAlive(i) )
						{
							iprintln( "^5plague^0_^2success" );
							i TakeAllWeapons();
							i iprintlnbold( "^7You've got the ^0PLAGUE^7!!!" );
							i thread plaguefx();
							i PlaySound("last_alive");
							wait 2;
							i thread hurttodeath();
							wait 5;
							level.trapstatus = 1;
							level.trig03 delete();
							break;
						}
					else
						{
							iprintln( "^5plague^0_^1failure" );
							level thread pickplague2();
							return;
						}
				}
			else
				continue;
			wait 0.1;
		}
}
*/

trap04()
{
 
 trig = getent( "trap04", "targetname" );
 lazers1 = getent( "lazers1", "targetname" );
 lazers2 = getent( "lazers2", "targetname" );

	lazers1 hide();
	lazers2 hide();
	lazers1 notsolid();
	lazers2 notsolid();
	trig SetHintString( "FIRE YOUR LAZERS!" );

	while(1)
	{
		trig waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		times = RandomIntRange( 3, 5 );
		level.sound playsound( "lasers_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: ^1VADER ^7COME TO ME!" );
		wait 2;
		
		for( i=0;i<times;i++ )
			{
				px = RandomIntRange( 10, 55 );
				nx = px - (px*2);
				time = RandomIntRange( 2, 3 );
				level.trap4hurtt1 movez( 386, 0.05 );
				level.trap4hurtt2 movez( 386, 0.05 );
				level.trap4hurtt1 waittill( "movedone" );
				lazers1 show();
				lazers2 show();
				lazers1 playsound( "lasers" );
				lazers2 playsound( "lasers" );
				level.laser1 linkto( level.trap4hurtt1 );
				level.laser2 linkto( level.trap4hurtt2 );
				lazers1 linkto ( level.trap4hurtt1 );
				lazers2 linkto( level.trap4hurtt2 );
				level.trap4hurtt1 movex( px, time/2, (time/2)-1, (time/2)-1 );
				level.trap4hurtt2 movex( nx, time/2, (time/2)-1, (time/2)-1 );
				level.trap4hurtt1 waittill( "movedone" );
				level.trap4hurtt1 movex( nx, time/2, (time/2)-1, (time/2)-1 );
				level.trap4hurtt2 movex( px, time/2, (time/2)-1, (time/2)-1 );
				level.trap4hurtt1 waittill( "movedone" );
				level.laser2 unlink();
				level.laser1 unlink();
				lazers1 unlink();
				lazers2 unlink();
				lazers1 hide();
				lazers2 hide();
				level.trap4hurtt1 movez( -386, 0.05 );
				level.trap4hurtt2 movez( -386, 0.05 );
				wait time;
			}
		wait 5;
		level.trapstatus = 1;
	}
}

trap05()
{
 trig = getent( "trap05", "targetname" );
 trig SetHintString( "Electocute dem boiz" );
 org1 = getent( "electricityfx_1", "targetname" );
 org2 = getent( "electricityfx_2", "targetname" );
 org3 = getent( "electricityfx_3", "targetname" );
 
 
	
	while(1)
	{
		trig waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		
		level.sound playsound( "elec_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: ^5BZZZ ^7BZZZ! ^5BZZZ ^7BZZZ!" );
		wait 2;
		level.trap05hurtb movez( 512, 0.1 );
		for( i=0;i<30;i++ )
		{
			playFx( level.elecfx , org1.origin );
			org1 playsound( "spark" );
			playFx( level.elecfx , org2.origin );
			org2 playsound( "spark" );
			playFx( level.elecfx , org3.origin );
			org3 playsound( "spark" );
			wait .3;
		}
		level.trap05hurtb movez( -512, 0.1 );
		wait 5;
		level.trapstatus = 1;
	}
}

trap06() //ufo trap
{
	level endon( "trap_time_over" );
	
	trig = getent( "trap06", "targetname" );
	level.botorg = getent( "fogbot", "targetname" );
	ufostart = getent( "ufostart", "targetname" );
	level.ufo_1 = getent( "ufo_1", "targetname" );
	level.ufo_2 = getent( "ufo_2", "targetname" );
	level.ufo_3 = getent( "ufo_3", "targetname" );
	level.ufo_4 = getent( "ufo_4", "targetname" );
	ufoend = getent( "ufoend", "targetname" );
	right = getent( "floorright", "targetname" );
	left = getent( "floorleft", "targetname" );
	player_start = getent( "ufo_playerstart", "targetname" );
	level.ufo hide();
	level.laser hide();
	trig SetHintString( "BRING ZE ALIENZ" );
	for(;;)
	{
		trig waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		if( level.time <= 35 )
		{
			trig SetHintString( "Unable to be Activated" );
			player iprintlnbold( "Not enough time to use this trap!" );
			wait 1;
			level.trapstatus = 1;
			break;
		}
		else
			wait 0.5;
		if( level.jumpers <= 2 )
			{
				trig SetHintString( "Unable to be Activated" );
				player iprintlnbold( "Not enough jumpers alive!" );
				wait 1;
				level.trapstatus = 1;
				break;
			}
		else
			wait 0.5;

		level.sound playsound( "ufo_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: THE ^5FORERUNNERS ^7R^2ET^7URN^7!" );
		level.safe_area notSolid();
		thread rightslow();
		thread leftslow();
		for(;;)
			{
				wait 1;
				
				if( level.s_lefthalf == 1 && level.s_righthalf == 1 )
				{
					level.ufodone = 0;
					level.ufodone_r = 0;
					level.ufodone_f = 0;
					level.s_lefthalf = 0;
					level.s_righthalf = 0;
					level.sound PlaySound("ufoentry");
					wait 3;
					playFx( level.ufoapp , level.botorg.origin );
					//thread trap06ufohover();
					thread trap06ufohoverfx();
					thread trap06ufohoversound();
					thread trap06uforotate();
					thread ufo_lasers();
					level.ufo show();
					level.laser show();
					level.ufo moveto ( ufostart.origin, 3, 0.5, 1 );
					level.ufo waittill( "movedone" );
					right rotatepitch( -90, 0.5, 0.25, 0.25 );
					right waittill( "rotatedone" );
					left rotatepitch( 90, 0.5, 0.25, 0.25 );
					left waittill( "rotatedone" );
					level.safe_area Solid();
					//level.ufo_safe solid();
					player TakeAllWeapons();
					player SetOrigin( level.trap08org.origin );
					player SetClientDvar( "cg_thirdperson", "1" );
					player SetClientDvar( "cg_thirdpersonrange", "700" );
					player AllowSprint(false);
					//player AllowJump(false);
					player hide();
					player setModel( "chicken_static" );
					player SetMoveSpeedScale( 1.9 );
					player thread ufofollow();
					level.trap08clip notSolid();
					level.trap07clip linkto( player );
					level.trap07clip solid();
					thread watchactifail();
					player thread fxforufo();
					player iprintlnbold( "The ufo follows the chicken! You control the chicken!" );
					wait 17;
					level.ufodone_f = 1;
					wait 0.25;
					player iprintlnbold( "The ufo is leaving now!" );
					level.ufo moveto ( ufostart.origin, 3, 0.5, 1 );
					level.ufo waittill( "movedone" );
					wait 2.75;
					player giveWeapon("knife_mp");
					player giveWeapon("tomahawk_mp");
					player SwitchToWeapon( "tomahawk_mp" );
					player SetClientDvar( "cg_thirdperson", "0" );
					player SetClientDvar( "cg_thirdpersonrange", "90" );
					player SetMoveSpeedScale( 1.2 );
					player AllowSprint(true);
					//player AllowJump(true);
					player setorigin( level.trap8fin.origin );
					player setModel( "body_mp_usmc_cqb" );
					player show();
					level.trap07clip notSolid();
					right rotatepitch( 90, 0.5, 0.25, 0.25 );
					right waittill( "rotatedone" );
					left rotatepitch( -90, 0.5, 0.25, 0.25 );
					left waittill( "rotatedone" );
					//level.ufo_safe notSolid();
					level.ufodone = 1;
					level.laser hide();
					level.ufo moveto (ufoend.origin, 3, 0.5, 1 );
					level.ufo waittill( "movedone" );
					playFx( level.ufoapp , level.botorg.origin );
					level.ufo hide();
					level.ufodone_r = 1;
					wait 1;
					right rotatepitch( -90, 2, 1, 1 );
					right waittill( "rotatedone" );
					left rotatepitch( 90, 2, 1, 1 );
					left waittill( "rotatedone" );
					wait 2;
					level.trapstatus = 1;
					break;
				}
				
				else
					continue;
			}
	}
}

/*
forcecrouch()
{
	for(;;)
	{
		if ( self GetStance() != "crouch" )
			{
				self iprintlnbold( "YOU MUST ^1CROUCH ^7IN ORDER TO MOVE!" );
				wait 1;
				continue;
			}
		else
			{
				break;
			}
	}
}
*/

ufo_lasers()
{
 level endon( "endmap" );
 level endon( "trap_time_over" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( level.ufodone_r != 1 )
			{
				level.trap06hurt waittill( "trigger", player );
				if( player.pers["team"] != "axis" && isAlive(player) )
				{
					player FinishPlayerDamage(self, self, 50, 0, "MOD_SUICIDE", "knife_mp", self.origin, self.angles, "none", 0);
					player PlayLocalSound("breathing_hurt");
					wait 0.25;
					continue;
				}
				else
					continue;
			}
		else
			{
				break;
			}
	}
}

/*trap06laserrotate()
{
	for(;;)
	{
		level.laser rotateroll( -90, 3 );
		level.laser waittill( "rotatedone" );
		level.laser rotateroll( 90, 3 );
		level.laser waittill( "rotatedone" );
		wait 2;
	}
}
*/
trap06uforotate()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( level.ufodone_r != 1 )
			{
				level.ufo rotateyaw( 360, 1 );
				level.ufo waittill( "rotatedone" );
				continue;
			}
		else
			{
				break;
			}
	}
}

ufofollow()
{
 level endon( "endmap" );
 level endon( "trap_time_over" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( level.ufodone_f != 1 )
			{
				level.ufo MoveTo(self.origin + ( 0, 0, 101 ), 0.1, .05, .05 );
				level.ufo waittill( "movedone" );
				level.ufo MoveTo(self.origin + ( 0, 0, 100 ), 0.1, .05, .05 );
				level.ufo waittill( "movedone" );
				continue;
			}
		else
			{
				break;
			}
	}
}

trap06ufohoverfx()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( level.ufodone != 1 )
			{
				playFxontag( level.ufofx , level.ufo, "tag_origin" ); //playFx( level.ufofx , level.ufo.origin + (0,0,-10) );
				wait 0.05;
				//level.ufo PlaySound("ufo_hov");
				//wait 1.44;
				continue;
			}
		else
			{
				break;
			}
	}
}

trap06ufohoversound()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( level.ufodone != 1 )
			{
				level.ufo PlaySound("ufo_hov");
				wait 1.44;
				continue;
			}
		else
			{
				break;
			}
	}
}

trap06ufohover()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	for(;;)
	{
		if( level.ufodone != 1 )
			{
				level.ufo movez( -10, 2, 1, 1 );
				level.ufo waittill( "movedone" );
				level.ufo movez( 10, 2, 1, 1 );
				level.ufo waittill( "movedone" );
				continue;
			}
		else
			{
				break;
			}
	}
}

/*trap06ufostuff()
{
	ufostart = getent( "ufostart", "targetname" );
	level.ufo_1 = getent( "ufo_1", "targetname" );
	level.ufo_2 = getent( "ufo_2", "targetname" );
	level.ufo_3 = getent( "ufo_3", "targetname" );
	level.ufo_4 = getent( "ufo_4", "targetname" );
	ufoend = getent( "ufoend", "targetname" );
	right = getent( "floorright", "targetname" );
	left = getent( "floorleft", "targetname" );
	player_start = getent( "ufo_playerstart", "targetname" );
	
	
	
	//looptimes = RandomIntRange( 2, 4 );
	
	for(i=0;i<looptimes;i++)
	{
		level.ufo moveto ( ufostart.origin, 3, 0.5, 1 );
		level.ufo waittill( "movedone" );
		randtime = RandomIntRange( 0, 2 );
		wait randtime;
		randomspot = RandomIntRange( 1, 5 );
		getorg( randomspot );
		level.ufo moveto ( level.uforg.origin, randtime, 0.5, 0.5 );
		level.ufo waittill( "movedone" );
		wait randtime;
		level.ufo moveto ( ufostart.origin, randtime, 0.5, 0.5 );
		level.ufo waittill( "movedone" );
	} 
		level.ufo moveto ( ufostart.origin, 3, 0.5, 1 );
		level.ufo waittill( "movedone" );
		//level.ufo_safe solid();
		self TakeAllWeapons();
		self SetOrigin( level.trap08org.origin );
		self SetClientDvar( "cg_thirdperson", "1" );
		self SetClientDvar( "cg_thirdpersonrange", "300" );
		self AllowSprint(false);
		self AllowJump(false);
		self hide();
		self setModel( "chicken_static" );
		level.ufo MoveTo(self.origin, 0.3, .05, .05 );
		wait 15;
		self giveWeapon("knife_mp");
		self giveWeapon("tomahawk_mp");
		self SwitchToWeapon( "tomahawk_mp" );
		self unlink();
		self SetClientDvar( "cg_thirdperson", "0" );
		self SetClientDvar( "cg_thirdpersonrange", "90" );
		self AllowSprint(true);
		self AllowJump(true);
		self setorigin( level.trap8fin.origin );
		self setModel( "body_mp_usmc_cqb" );
		wait 0.05;
		self show();
		wait 2;
		//level.ufo_safe notSolid();
		level.ufodone = 1;
		level.ufo moveto (ufoend.origin, 3, 0.5, 1 );
		level.ufo waittill( "movedone" );
		playFx( level.ufoapp , level.botorg.origin );
		level.ufo hide();
		level.laser hide();
		level.ufodone_r = 1;
		wait 1;
		right rotatepitch( -90, 2, 1, 1 );
		right waittill( "rotatedone" );
		left rotatepitch( 90, 2, 1, 1 );
		left waittill( "rotatedone" );
		wait 2;
		level.trapstatus = 1;
}
*/

trap07()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 trig = getent( "trap07", "targetname" );
 trig SetHintString( "CALL IN THE ROOMBA" );
 
 level.tophalf = 0;
 level.bothalf = 0;
 

	while(1)
	{
		trig waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		level.sound playsound( "roomba_voice" );
		iprintln( "^0[^5TwitchOS^0]^7: MUST ^2CLEAN ^7EVERYTHING!" );
		thread top7();
		thread bot7();
		thread roomba();
		thread checkwall();
		//thread wallgood();
	}
}

/*
wallgood()
{
	for(;;)
	{
		wait 0.05;
		
		if( level.wallgood == 1 )
		{
			wait 5;
			break;
		}
		else
		{
			continue;
		}
	}
}
*/

trap08() //level.actifx
{
 level endon( "trap_time_over" );
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 level.trig08 SetHintString( "Start a frenzy!" );

	for(;;)
	{
		level.trig08 waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		if( level.time <= 25 )
		{
			level.trig08 SetHintString( "Unable to be Activated" );
			player iprintlnbold( "Not enough time to use this trap!" );
			wait 1;
			level.trapstatus = 1;
			break;
		}
		else
			wait 0.5;
		if( level.jumpers <= 2 )
			{
				level.trig08 SetHintString( "Unable to be Activated" );
				player iprintlnbold( "Not enough jumpers alive!" );
				level.trapstatus = 1;
				break;
			}
		else
			wait 0.5;
		level.deathtrap = 1;
		level.sound playsound( "frenzy" );
		iprintln( "^0[^5TwitchOS^0]^7: ^1DEATH ^7HAS COME! ^1DEATH ^7HAS COME!" );
		player TakeAllWeapons();
		player SetOrigin( level.trap08org.origin );
		player SetClientDvar( "cg_thirdperson", "1" );
		player SetClientDvar( "cg_thirdpersonrange", "300" );
		player AllowSprint(false);
		player thread fxonacti();
		player hide();
		player setModel( "com_french_toiletbowl" );
		level.trap08clip solid();
		level.trap08clip linkto( player );
		thread watchactifail();
		wait 15;
		player giveWeapon("knife_mp");
		player giveWeapon("tomahawk_mp");
		player SwitchToWeapon( "tomahawk_mp" );
		player setModel( "body_mp_usmc_cqb" );
		level.trap08clip notSolid();
		player SetClientDvar( "cg_thirdperson", "0" );
		player SetClientDvar( "cg_thirdpersonrange", "90" );
		player AllowSprint(true);
		player setorigin( level.trap8fin.origin );
		player show();
		wait 5;
		level.trapstatus = 1;
		level.deathtrap = 0;
		level.trig08 SetHintString( "^1Activated" );
		break;
	}

}

fxonabull() 
{
		level endon( "notold" );
		level endon( "endmap" );
		level endon( "endround" );
		self endon("disconnect");
        self endon("death"); 
        for(;;) 
        { 
                self waittill ( "weapon_fired" ); 
                vec = anglestoforward(self getPlayerAngles()); 
                end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000); 
                SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ]; 
                playfx(level.t9bull, SPLOSIONlocation); 
                RadiusDamage( SPLOSIONlocation, 150, 25, 5, self ); 
                earthquake (0.3, 1, SPLOSIONlocation, 350); 
				self playsound( "spark" );
        } 
}

trap09() //level.actifx
{
 level endon( "trap_time_over" );
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 level.trig09 SetHintString( "Be a slayer!" );

	for(;;)
	{
		level.trig09 waittill( "trigger", player );
		if( !player checkTrap( 1 ) )
			continue;
		if( level.time <= 25 )
		{
			level.trig09 SetHintString( "Unable to be Activated" );
			player iprintlnbold( "Not enough time to use this trap!" );
			wait 1;
			level.trapstatus = 1;
			break;
		}
		else
			wait 0.5;
		if( level.jumpers <= 2 )
			{
				level.trig09 SetHintString( "Unable to be Activated" );
				player iprintlnbold( "Not enough jumpers alive!" );
				level.trapstatus = 1;
				break;
			}
		else
			wait 0.5;
		level.deathtrap = 1;
		level.sound playsound( "slayer" );
		iprintln( "^0[^5TwitchOS^0]^7: ^0PAIN ^7IS ^1PLENTIFUL!" );
		player TakeAllWeapons();
		player AllowAds( false );
		player giveWeapon( "defaultweapon_mp" );
		player switchToWeapon( "defaultweapon_mp" );
		player SetOrigin( level.trap08org.origin );
		player thread fxonabull();
		//player thread nonear();
		player thread godmode();
		thread watchactifail();
		wait 15;
		player TakeAllWeapons();
		player AllowAds( true );
		player giveWeapon("knife_mp");
		player giveWeapon("tomahawk_mp");
		player SwitchToWeapon( "tomahawk_mp" );
		level.trap08clip notSolid();
		player setorigin( level.trap8fin.origin );
		wait 5;
		player.maxhealth = 100;
		player.health = 100;
		level.trapstatus = 1;
		level.deathtrap = 0;
		level.trig09 SetHintString( "^1Activated" );
		break;
	}

}

godmode()
{
 self endon("disconnect");
 self endon( "death" );
 self endon("joined_spectators");
 self endon("killed_player");
 level endon( "endmap" );
 level endon( "trap_time_over" );
 
	for(;;)
	{
		if( level.deathtrap == 1 )
		{
			self.maxhealth = 9999;
			self.health = 9999;
		}
		else
		{
			break;
		}
	
		wait 0.1; //added this to stop infinite loops
	}
}

watchactifail()
{
 level endon( "endmap" );
 self endon( "disconnect" );
 self endon( "joined_spectators" );
 self endon( "death" );
 
	trig = getent( "actifail", "targetname" );

	for(;;)
	{
		if( level.deathtrap == 1 || level.ufodone == 0 )
		{
			trig waittill( "trigger", player );
			if( player.pers["team"] == "axis" )
				player SetOrigin( level.trap08org.origin );
			else
				player suicide();
		}
		else
		{
			if( level.trapstatus == 0 )
				continue;
			else
				break;
		}
	wait 0.05; //added this to stop infinite loops
	}
}

fxforufo()
{
	for(;;)
	{
		if( level.ufodone_f != 1 )
			{
				self RadiusDamage( level.ufo.origin + ( 0, 0, -100), 200, 25, 5, self );
				playFx( level.ufofx , level.ufo.origin + ( 0, 0, -100) );
				wait .1;
				continue;
			}
		else
			{
				break;
			}
	}
}

fxonacti()
{
 self endon("disconnect");
 self endon( "death" );
 self endon("joined_spectators");
 self endon("killed_player");
 level endon( "endmap" );
 level endon( "trap_time_over" );
 
 
    for(i=0;i<15;i++)
    {
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 200, 80, 5, self );
        playFx( level.actifx , self.origin );
        wait .1;
    }

}

nonear()
{
 self endon("disconnect");
 self endon( "death" );
 self endon("joined_spectators");
 self endon("killed_player");
 level endon( "endmap" );
 level endon( "trap_time_over" );
 
 
    for(i=0;i<15;i++)
    {
		self RadiusDamage( self.origin, 80, 100, 1, self );
        //playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
        //playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
        //playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
		self RadiusDamage( self.origin, 80, 100, 1, self );
       // playFx( level.actifx , self.origin );
        wait .1;
    }

}

roomba() //1144
{
 
	
	looptimes = RandomIntRange( 3, 5 );
	level.roomba movex( -144, 3 );
	level.roomba waittill( "movedone" );
	level.safe_area notSolid();
	thread roombaleftstart();
	thread roombarightstart();
	for(i=0;i<looptimes;i++)
	{
		movetime = RandomIntRange( 1, 4 );
		level.roomba movex( -1025, movetime );
		level.roomba waittill( "movedone" );
		level.roomba movex( 1025, movetime );
		level.roomba waittill( "movedone" );
	}
	
		thread top7();
		thread bot7();
		thread checkwall();
		for(;;)
		{
			if( level.wallgood == 1 )
				{
					thread roombarightend();
					thread roombaleftend();
					wait 1;
					level.roomba movex( 144, 3 );
					level.roomba waittill( "movedone" );
					level.safe_area solid();
					wait 2;
					level.trapstatus = 1;
					break;
				}
			else
				wait 1;
		}
}

roombaleftstart()
{
	level.slideleft rotatepitch( 45, 0.5, 0.1, 0.25 );
	level.slideleft waittill( "rotatedone" );
}

roombaleftend()
{
	
	level.slideleft rotatepitch( -45, 5, 2, 2 );
	level.slideleft waittill( "rotatedone" );
}

roombarightstart()
{
	level.slideright rotatepitch( -45, 0.5, 0.1, 0.25 );
	level.slideright waittill( "rotatedone" );
}

roombarightend()
{
 	level.slideright rotatepitch( 45, 5, 2, 2 );
	level.slideright waittill( "rotatedone" );
}

hurttodeath()
{
 self endon("disconnect");
 self endon ( "death" );
 self endon("joined_spectators");
 self endon("killed_player");
 
	while( isAlive(self) )
		{ //  FinishPlayerDamage( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime );
			self FinishPlayerDamage(self, self, 25, 0, "MOD_SUICIDE", "knife_mp", self.origin, self.angles, "none", 0);
			self PlayLocalSound("breathing_hurt");
			self.pers["team"] = "axis";
			self RadiusDamage( self.origin, 200, 120, 10, self );
			wait 1.4;
		}
}

plaguefx()
{
 self endon("disconnect");
 self endon( "death" );
 self endon("joined_spectators");
 self endon("killed_player");
 
    while( isAlive( self ) && isDefined( self ) )
    {
        playFx( level.plaguefx , self.origin );
        wait .1;
    }

}

right()
{
 right = getent( "floorright", "targetname" );
	
	right rotatepitch( 90, 0.5, 0.1, 0.25 );
	right waittill( "rotatedone" );
	wait 5;
	right rotatepitch( -90, 5, 2, 2 );
	right waittill( "rotatedone" );
	level.d_righthalf = 1;
}

rightslow()
{
 right = getent( "floorright", "targetname" );
	
	right rotatepitch( 90, 5, 3, 1 );
	right waittill( "rotatedone" );
	level.s_righthalf = 1;
}

leftslow()
{
 left = getent( "floorleft", "targetname" );
 
	left rotatepitch( -90, 5, 3, 1 );
	left waittill( "rotatedone" );
	level.s_lefthalf = 1;
}

left()
{
 left = getent( "floorleft", "targetname" );
 
	left rotatepitch( -90, 0.5, 0.1, 0.25 );
	left waittill( "rotatedone" );
	wait 5;
	left rotatepitch( 90, 5, 2, 2 );
	left waittill( "rotatedone" );
	level.d_lefthalf = 1;
}

bot7()
{
 bot = getent( "rdoorbot", "targetname" );
 
	bot rotatepitch( -90, 0.5, 0.1, 0.25 );
	bot waittill( "rotatedone" );
	level.bothalf = 1;
	wait 3; //change soon
	bot rotatepitch( 90, 5, 2, 2 );
	bot waittill( "rotatedone" );
}

top7()
{
 top = getent( "rdoortop", "targetname" );
	
	top rotatepitch( 90, 0.5, 0.1, 0.25 );
	top waittill( "rotatedone" );
	level.tophalf = 1;
	wait 3; //change soon
	top rotatepitch( -90, 5, 2, 2 );
	top waittill( "rotatedone" );
}

checkwall()
{
	for(;;)
	{
		wait 1;
		if( level.tophalf == 1 && level.bothalf == 1 )
			{
				level.wallgood = 1;
				wait 1;
				break;
			}
		else
			{
				continue;
				wait 1;
			}
	}
}

checkdrop()
{
	for(;;)
	{
		wait 1;
		if( level.d_lefthalf == 1 && level.d_righthalf == 1 )
			{
				wait 3;
				level.safe_area Solid();
				level.trapstatus = 1;
				break;
			}
		else
			{
				continue;
			}
	}
}

doortop()
{
 top = getent( "doortop", "targetname" );
	
	top rotateroll( -90, 3, 1, 2 );
	top waittill( "rotatedone" );
	wait 5;
	//iprintlnbold( "The door to the activator is open. GO KILL HIM!" );
}

doorbot()
{
 bot = getent( "doorbot", "targetname" );
	
	bot rotateroll( 90, 3, 1, 2 );
	bot waittill( "rotatedone" );
	//iprintlnbold( "The door to the activator is open. GO KILL HIM!" );
	
}

trap01stuff()
{
	level endon( "endmap" );
	times = RandomIntRange( 2, 5 );
	
	for( i=0;i<times;i++ )
		{
			time = RandomIntRange( 1, 4 );
			level.trap01splat movez( -192, 0.5 );
			level.trap01splat waittill( "movedone" );
			Earthquake( 0.8, 1, level.trap01splat.origin, 850 );
			level.trap01splat playsound( "hit_metal" );
			wait 1;
			level.trap01splat movez( 192, time);
			level.trap01splat waittill( "movedone" );
			wait time;
		}
	level.trapstatus = 1;
}