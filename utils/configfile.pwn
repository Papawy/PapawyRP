#include <YSI\y_ini>
#include <YSI\y_hooks>

#include "utils/macros.pwn"

enum E_SERVER_CONF
{
	srvSQLHost[STR_LONG],
	srvSQLDb[STR_NORMAL],
	srvSQLPass[STR_LONG_LONG],
	srvSQLUser[STR_NORMAL]
};

new gServerConfig[E_SERVER_CONF];

INI:serverconfig[MySQL](name[], value[])
{
	INI_String("host", gServerConfig[srvSQLHost], STR_LONG);
	INI_String("database", gServerConfig[srvSQLDb], STR_NORMAL);
	INI_String("password", gServerConfig[srvSQLPass], STR_LONG_LONG);
	INI_String("user", gServerConfig[srvSQLUser], STR_NORMAL);

	return 0;
}

hook OnGameModeInit()
{
	if (!INI_Load("serverconfig.ini"))
	{
		printf("[ERROR] Couldn't load serverconfig.ini");
		printf("[HINT] serverconfig.ini should be located inside the scriptfiles folder.");
	}
	else
	{
		printf("[OK] serverconfig.ini loaded !");
		printf("[OK] 	Database Host: '%s'", gServerConfig[srvSQLHost]);
		printf("[OK] 	Database Name: '%s'", gServerConfig[srvSQLDb]);
	}
}