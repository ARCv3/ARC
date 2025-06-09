# ARC V3

Arc V3 is the next generation of the open source ARC discord bot. The application now is complete with a web management dashboard coded in react JS and an API coded in express JS. 

All three services are connected together using a central mongo database. The app also includes a database explorer deployed automatically (mongo-express)

## Running the system

The arc system can be run easily using the docker-compose file provided

First you should set up your `.env` file as follows
```ini
# COMMONS
MONGODB_URI=
DISCORD_CLIENT_ID=
DISCORD_CLIENT_SECRET=

# ARC3
GUILD_ID=
TOKEN=

# ARC3 API
CLIENT_REDIRECT_URI=
DIRECT_URL=
DISCORD_REDIRECT_URI=
FULLCHAIN=
HOSTED_URL=
JWT_SECRET=
API_PORT=
PRIVKEY=

# UNITY
UNITY_PORT=
UNITY_API_BASE_URI=
UNITY_BASE_URI=
UNITY_DEBUG=
USE_HTTPS=
STATUS_SITE_URL=
SITE_TITLE=
SITE_DESCRIPTION_META=
SITE_DESCRIPTION=
SITE_HERO_IMAGE=

# MONGO
MONGO_INITDB_ROOT_PASSWORD=

# AWS
AWS_REGION=
AWS_ACCOUNT_ID=
AWS_UNITY_REPO_NAME=
AWS_ARC3_REPO_NAME=
AWS_ARC3_API_REPO_NAME=

```

Then, simply install docker and docker compose and then run it with the deploy script
```
./deploy.sh
```

## Components

![Untitled Diagram drawio](https://github.com/IzzyDotExe/ARC3/assets/44146685/a109f9aa-51c6-4270-84bb-a865214e9c2c)

### Arc3 + Discord Bot Client

Arc3 is a discord bot written in C# using the Discord.NET library to control the discord bot client. It interacts with the mongodb database as it's sole source of truth. 

### Arc3-api

Arc3-Api is an api written in expressJS that serves information from the mongo databse. It provides all the necessay routes for `Arc3-Dash` to work which is the web frontend. Arc3-Api serves the frontend at the root / http route and also uses oauth2 authentication to protect routes.

### Arc3-dash

Arc3-Dash is a web frontend dashboard to manage and visualize data in the Arc3 system. Importantly, it is served by the `Arc3-Api` and thus levereages the same authentication available through that.

### Arc3-tasks

Arc3-Tasks is a collection of node scripts that perform various useful actions for the arc system such as backups, restores, cleanup, data compliance, etc...

### Ofelia Scheduler

This is a scheduler component that is used to trigger various actions inside of `Arc3-Tasks` by default it does an automated backup every 24 hours and a cleanup of data every 12 hours.

## Development

You can see some of the instructions in the default readmes given by create-react-app and such. There is also some vscode configs given as part of the project where you can run and debug every part of the system individually.
