FULL_PATH_TO_SCRIPT="$(realpath "$0")"
SCRIPT_DIRECTORY="$(dirname "$FULL_PATH_TO_SCRIPT")"
cd "$SCRIPT_DIRECTORY"../
# setup husky hooks
npx husky-init && npm install

npx husky add .husky/commit-msg 'npx --no-install commitlint --edit "$1"'

# setup commitlint config
npm install --save-dev @commitlint/cli commitlint-config-gitmoji

# configure commitlint to use emojis
cp $SCRIPT_DIRECTORY"/commitlint.config.js.example" $SCRIPT_DIRECTORY"/../commitlint.config.js"

# install commitzen cli for easier commit creation
npm install --save-dev commitizen cz-customizable

# copy configuration files to commitzen
cp $SCRIPT_DIRECTORY"/.czrc.example" $SCRIPT_DIRECTORY"/../.czrc"
# copy cz-customizable example config
cp $SCRIPT_DIRECTORY"/.cz-config.js.example" $SCRIPT_DIRECTORY"/../.cz-config.js"

# add following to your scripts section at package.json file, and `npm run cm`
"cm": "cz"
# add these config to your package.json if .czrc not works
"config": {
    "commitizen": {
      "path": "cz-customizable"
    }
  }
