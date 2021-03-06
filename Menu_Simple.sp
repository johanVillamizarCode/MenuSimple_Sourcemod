#pragma semicolon 1

//we can define terms that we will use in some other part of the source code
#define DEBUG
#define PLUGIN_AUTHOR "Panncode"
#define PLUGIN_VERSION "1.0.1"

//libraries that we will use
#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	//is the information that will be displayed about the plugin
	name = "Menu Simple",
	author = PLUGIN_AUTHOR,
	description = "Code example for creating a simple menu",
	version = PLUGIN_VERSION,
	url = "https://www.johanvillamizar.com"
};

public void OnPluginStart()
{
	//in the same way we could put that this menu can be opened with some flag
	RegConsoleCmd("sm_menu", command_menu, "This command will open the menu");
}

public Action command_menu(int client, int args){
	
	Menu menuSimple = new Menu(MenuSimple_Callback);
	menuSimple.SetTitle("Menu Simple"); //title that will have this menu
	menuSimple.AddItem("opt_1", "Stats"); //normal menu option
	menuSimple.AddItem("opt_2", "Vip Zone");
	menuSimple.AddItem("opt_3", "OwnerZone");
	menuSimple.AddItem("opt_4", "Menu Admin SM"); //this option is normal but I will use it to call another plugin
	menuSimple.Display(client, 30); //It is important to be able to show the menu
	menuSimple.ExitButton = true; //It adds the option to leave
	return Plugin_Handled;
}

public int MenuSimple_Callback(Menu menuSimple, MenuAction action, int param1, int param2){

	switch(action){
		case MenuAction_Select:{
			char item[32];
			menuSimple.GetItem(param2, item, sizeof(item));
			if (StrEqual(item, "opt_1")){
				//Action that this option should do
			}
			else if(StrEqual(item, "opt_2")){
				//Action that this option should do
			}
			else if(StrEqual(item, "opt_3")){
				//Action that this option should do
			}
			else if(StrEqual(item, "opt_4")){
				FakeClientCommandEx(param1, "sm_admin");//this option calls a console command from a different plugin
			}
		}
	}
}