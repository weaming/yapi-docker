#! /bin/sh

if [ ! -e "init.lock" ]
then
	sed -i "s/DIY-PORT/"${PORT}"/g" ${HOME}/config.json
	sed -i "s/DIY-AC/"${ADMIN_EMAIL}"/g" ${HOME}/config.json
	sed -i "s/DIY-DB-SERVER/"${DB_SERVER}"/g" ${HOME}/config.json
	sed -i "s/DIY-DB-NAME/"${DB_NAME}"/g" ${HOME}/config.json
	sed -i "s/DIY-DB-PORT/"${DB_PORT}"/g" ${HOME}/config.json

	yapi install -v ${VERSION}
	touch init.lock
fi

cd ${HOME}
node vendors/server/app.js