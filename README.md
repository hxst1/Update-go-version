
# Update-go-version Linux/Mac
#### Update the version of go on your machine

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&pause=1000&color=F71164&width=435&lines=by+Edu+Ruiz)](https://git.io/typing-svg)

## - Normal script execution

1. Give maximum permissions to the script `chmod +x ./script.sh`
2. `./script.sh (version)` example: `./script.sh 1.19.2`

## - Script execution in project

1. Add the script in the .husky folder
  - if you don't have a husky install now: [Husky install](https://typicode.github.io/husky/#/?id=automatic-recommended)

2. Give maximum permissions to the script `chmod +x ./husky/script.sh`

3. Add to the package.json the scripts to update the version
  ```json
    "scripts": {
        "setup": "./.husky/script.sh 1.19.2",
        "start": "yarn setup | go run src/main.go"
      }
  ```
4. You can now run it with yarn or npm `yarn start` or `npm run start`
  - if you use npm modify the start script to the following ` "start": "npm run setup | go run src/main.go"`

<br>

**Note:** This script may contain errors, anything or improvement you can contact me on discord [EyA#1799](https://discord.com/users/398174691027714059)

