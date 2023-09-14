const http = require('https');
const fs = require('fs/promises');
const path = require('path');
const { exec } = require("child_process");

const baseUrl = "https://raw.githubusercontent.com/ONLYOFFICE"
const inputPath = "sdkjs";
const outPath = "jsdoc";
const downloadFiles = true;
const parseDocs = true;

const files = {
    "sdkjs/master": {
        "word.js": "word/apiBuilder.js",
        "cell.js": "cell/apiBuilder.js",
        "slide.js": "slide/apiBuilder.js",
        "wordPluginMethods.js": "word/api_plugins.js",
        "cellPluginMethods.js": "cell/api_plugins.js",
        "slidePluginMethods.js": "slide/api_plugins.js",
        "sharedPluginMethods.js": "common/apiBase_plugins.js",
        "pluginBase.js": "common/plugins/plugin_base_api.js"
    },
    "sdkjs-forms/master": {
        "form.js": "apiBuilder.js",
        "formPluginMethods.js": "apiPlugins.js"
    }
};

(async () => {
    let inputFolder = path.join(__dirname, inputPath);

    if (downloadFiles) {
        try {
            await fs.rm(inputFolder, { recursive: true });
        } catch { }

        await fs.mkdir(inputFolder);

        console.log("downloading files..");
        for (let repo in files) {
            for (let file in files[repo]) {
                console.log(`downloading ${repo}/${files[repo][file]} -> ${file}`);
                await downloadFile(`${baseUrl}/${repo}/${files[repo][file]}`, path.join(inputFolder, file));
            }
        }
    }

    if (parseDocs) {
        let tmpFolder = path.join(__dirname, "tmp");
        let jsdocFolder = path.join(__dirname, outPath);

        try {
            await fs.rm(tmpFolder, { recursive: true });
            await fs.rm(jsdocFolder, { recursive: true });
        } catch { }

        await fs.cp(inputFolder, tmpFolder, { recursive: true });

        console.log("removing anonymous functions..");
        await reformatScripts(tmpFolder);

        console.log("generating docs..");
        await generateJsDocs(jsdocFolder);
    }

})();

async function downloadFile(url, pathToSave) {
    return new Promise((resolve, reject) => {
        http.get(url, async res => {
            let file = await fs.open(pathToSave, "w");
            let stream = file.createWriteStream();

            res.pipe(stream);

            stream.on("finish", () => {
                stream.close(() => {
                    file.close();
                    resolve(true);
                });
            })
        });
    });
}

async function reformatScripts(folder) {
    const reg = /\(function\s?\(window\,\s?builder\)\s*?{([\s\S]*)}/m;

    let files = await fs.readdir(folder);

    for (let file of files) {
        console.log(`processing ${file}`);
        let filePath = path.join(folder, file);
        let content = (await fs.readFile(filePath)).toString();
        let matches = content.match(reg);
        if (matches != null) {
            fs.writeFile(filePath, matches[1]);
        }
    }
}

async function generateJsDocs(outputFolder) {
    let outFolder = path.join(__dirname, "out");
    let tmpFolder = path.join(__dirname, "tmp");

    await fs.mkdir(outputFolder);

    let files = await fs.readdir(tmpFolder);
    for (let file of files) {
        console.log(`processing ${file}`);
        try {
            await fs.rm(outFolder, { recursive: true });
        } catch { }
        await fs.mkdir(outFolder);

        await execute(`node node_modules/jsdoc/jsdoc.js tmp/${file}  -t . -c ./conf.json`);
        await fs.rename("out", path.join(outputFolder, file.slice(0, file.lastIndexOf("."))));
    }
}

async function execute(cmd) {
    return new Promise((resolve, reject) => {
        exec(cmd, (error, stdout) => {
            if (error) {
                reject(error);
            }
            resolve(stdout);
        });
    });
}