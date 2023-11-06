
const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const lettersPlus = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
let score = 0;
let bossFight = false;
let typedLetter = "";
let bossWord = "";
let typedWord = "";
let secretactivated = false;
let secret;
let keymasterBought = false;
let keymasterIndex = 0;
let keymasterInterval;
let spaceyBought = false;
let spaceyInterval;
let bossLevel = 1;

const debugKeys = {
    q: false,
    w: false,
    e: false,
    r: false,
};

const generatedLetterElement = document.getElementById('generated-letter');
const typedWordElement = document.getElementById('typed-word');
const scoreElement = document.getElementById('score');
const buyKeymasterButton = document.getElementById('buy-keymaster');
const buySpaceyButton = document.getElementById('buy-spacey');
const keymasterLetter = document.getElementById('keymaster-letter');
const keymasterWord = document.getElementById('keymaster-word');
const spaceyLetter = document.getElementById('spacey-letter');

function updateGeneratedLetter(content) {
    // displays the generated letter the player needs to type during non-boss fights
    generatedLetterElement.textContent = content;
}

function updateTypedWord(content) {
    // displays the generated word the player needs to type during boss fights
    typedWordElement.textContent = content;
}

function bossWon() {
    // when the boss fight is won, clear the generated word, add to the score, increase the "boss level", and generate a new letter to type
    score += bossWord.length;
    scoreElement.textContent = score;
    bossFight = false;
    typedWord = "";
    updateLetter();
    updateTypedWord("");
    bossLevel += 1;
}

function normalWon() {
    // when the letter is typed, clear it, add to the score, and generate a new letter to type IF the score is not a multiple of 20, and if it is, then trigger a boss fight
    score++;
    scoreElement.textContent = score;
    if (score % 20 === 0) {
        startBossFight();
    } else {
        updateLetter();
    }
}

function updateLetter() {
    // picks a random letter from the index
    const randomIndex = Math.floor(Math.random() * letters.length);
    const randomLetter = letters[randomIndex];
    updateGeneratedLetter(randomLetter);
}

function startBossFight() {
    // chooses the length of the word generated in the boss fight; proportional to bossLevel
    bossFight = true;
    const wordLength = Math.floor(Math.random() * 3) + bossLevel;
    bossWord = generateRandomWord(wordLength);
    updateGeneratedLetter(bossWord);
}

function generateRandomWord(length) {
    // similar to updateLetter() but does it multiple times to create "words", if the score is greater than 100 then these "words" can include spaces
    let result = "";
    if (score < 100) {
        for (let i = 0; i < length; i++) {
            const randomIndex = Math.floor(Math.random() * letters.length);
            result += letters[randomIndex];
        }
    } else {
        for (let i = 0; i < length; i++) {
            const randomIndex = Math.floor(Math.random() * lettersPlus.length);
            result += lettersPlus[randomIndex];
        }
    }
    return result;
}

function handleKeyPress(event) {
    // debug feature!!!! press Q, W, E, and R simultaneously to set the score to 125 and the bossLevel to 7
   if (event.key === "q") {
        debugKeys.q = true;
        secretactivated = true;
        secret = setInterval(debugTime, 500);
    }
    if (event.key === "w" && secretactivated) {
        debugKeys.w = true;
    }
    if (event.key === "e" && secretactivated) {
        debugKeys.e = true;

    }
    if (event.key === "r" && secretactivated) {
        debugKeys.r = true;
    }

    if (debugKeys.q && debugKeys.w && debugKeys.e && debugKeys.r) {
        score = 125;
        scoreElement.textContent = score;
        bossLevel = 7;
        debugKeys.q = false;
        debugKeys.w = false;
        debugKeys.e = false;
        debugKeys.r = false;
    }
    if (bossFight) {
        // handles player key inputs during boss fights
        if (event.key === "Backspace") {
            // backspace feature, it would be weird if we didn't have that
            typedWord = typedWord.slice(0, -1);
            updateTypedWord(typedWord);
        } else {
            // adds the inputted key to the word that has been typed so far
            typedWord += event.key.toUpperCase();
            updateTypedWord(typedWord);
        }

        if (typedWord === bossWord) {
            // if the word that the player and keymaster typed equals the boss word, you win the fight!
            bossWon();
        }
    } else {
        // for when it's not a boss fight
        const displayedLetter = generatedLetterElement.textContent;
        typedLetter = event.key.toUpperCase();

        if (typedLetter === displayedLetter) {
            // checks if the player typed the right letter, if so they win
            normalWon();
        }
    }
}

function buyKeymaster() {
    // the player can buy the keymaster if their score is high enough. After buying, the button is disabled
    if (!keymasterBought && score >= 25) {
        keymasterBought = true;
        buyKeymasterButton.disabled = true;
        keymasterInterval = setInterval(typeKeymasterLetter, 1000);
    }
}

function handleKeymasterKeyPress() {
    // handles the keymaster
    const letterToType = letters[keymasterIndex];

    if (bossFight) {
        /* checks if the letter the keymaster is on matches the letter at that position of the generated word, and if so types it. 
         For example, if the generated boss word is "tsdjf" and the keymaster index is on "s", 
         it adds "s" to the typed word IF "t" has been typed but not other letters. */
        keymasterLetter.style.display = "none";
        keymasterWord.style.display = "block";
        let temp = typedWord;
        temp += letterToType;
        keymasterWord.textContent = temp;
        let tempcheck = (temp.length - 1);
        if (temp[tempcheck] === bossWord[tempcheck]) {
            typedWord += letterToType;
            updateTypedWord(typedWord);
        }
        if (typedWord === bossWord) {
            bossWon();
        }
    } else {
        // for non-boss fights. the keymaster checks if the letter its on matches the gnerated letter. If so, it types it. 
        keymasterLetter.style.display = "block";
        keymasterWord.style.display = "none";
        const displayedLetter = generatedLetterElement.textContent;
        typedLetter = letterToType;
        keymasterLetter.textContent = typedLetter;
        if (typedLetter === displayedLetter) {
            normalWon();
        }
    }
    // goes to the next letter. If a, goes to b, if c goes to d, etc
    keymasterIndex++;
}

function typeKeymasterLetter() {
    if (keymasterIndex < letters.length) {
        handleKeymasterKeyPress();
    } else {
        keymasterIndex = 0;
    }
}

function buySpacey() {
    if (!spaceyBought && score >= 100) {
        spaceyBought = true;
        buySpaceyButton.disabled = true;
        spaceyInterval = setInterval(typeSpaceySpace, 5000);
    }
}

function typeSpaceySpace() {
    if (bossFight) {
        if (bossWord.indexOf(' ') > -1) {
            let temp = typedWord;
            temp += " ";
            keymasterWord.textContent = temp;
            let tempcheck = (temp.length - 1);
            if (temp[tempcheck] === bossWord[tempcheck]) {
                typedWord += " ";
                updateTypedWord(typedWord);
            }
            if (typedWord === bossWord) {
                bossWon();
            }
        }
    }
}

function debugTime() {
    debugKeys.q = false;
    debugKeys.w = false;
    debugKeys.e = false;
    debugKeys.r = false;
    secretactivated = false;
    clearInterval(secret);
}
// Function to export the game save
// Function to export the game save as a JSON file
function exportGameSave() {
    const gameSave = {
        score,
        bossFight,
        typedLetter,
        bossWord,
        typedWord,
        secretactivated,
        keymasterBought,
        keymasterIndex,
        spaceyBought,
        bossLevel
    };

    const gameSaveJSON = JSON.stringify(gameSave);
    const blob = new Blob([gameSaveJSON], {
        type: 'application/json'
    });
    const url = URL.createObjectURL(blob);

    const a = document.createElement('a');
    a.style.display = 'none';
    a.href = url;
    a.download = 'game-save.json';
    document.body.appendChild(a);
    a.click();
    URL.revokeObjectURL(url);
}

// Function to import a game save from a JSON file
function importGameSave() {
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function(e) {
        const importedGameSave = JSON.parse(e.target.result);

        // Update the game state with the imported data
        score = importedGameSave.score;
        bossFight = importedGameSave.bossFight;
        typedLetter = importedGameSave.typedLetter;
        bossWord = importedGameSave.bossWord;
        typedWord = importedGameSave.typedWord;
        secretactivated = importedGameSave.secretactivated;
        keymasterBought = importedGameSave.keymasterBought;
        if (keymasterBought) {
            buyKeymasterButton.disabled = true;
            keymasterInterval = setInterval(typeKeymasterLetter, 1000);
        }
        keymasterIndex = importedGameSave.keymasterIndex;
        spaceyBought = importedGameSave.spaceyBought;
        if (spaceyBought) {
            buySpaceyButton.disabled = true;
            spaceyInterval = setInterval(typeSpaceySpace, 5000);
        }
            bossLevel = importedGameSave.bossLevel;

        // Update the UI to reflect the imported game state
        scoreElement.textContent = score;

        if (bossFight) {
            updateGeneratedLetter(bossWord);
        } else {
            updateLetter();
        }
    };

    reader.readAsText(file);
}

// Event listeners for export and import buttons
document.getElementById('export-save').addEventListener('click', exportGameSave);
document.getElementById('import-save-button').addEventListener('click', () => {
    document.getElementById('import-save').click();
});

document.getElementById('import-save').addEventListener('change', importGameSave);

buyKeymasterButton.addEventListener('click', buyKeymaster);
buySpaceyButton.addEventListener('click', buySpacey);
document.addEventListener('keydown', handleKeyPress);
updateLetter();
