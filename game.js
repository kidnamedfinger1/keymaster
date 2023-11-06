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
    score += bossWord.length;
    scoreElement.textContent = score;
    bossFight = false;
    typedWord = "";
    updateLetter();
    updateTypedWord("");
    bossLevel += 1;
}

function normalWon() {
    score++;
    scoreElement.textContent = score;
    if (score % 20 === 0) {
        startBossFight();
    } else {
        updateLetter();
    }
}

function updateLetter() {
    const randomIndex = Math.floor(Math.random() * letters.length);
    const randomLetter = letters[randomIndex];
    updateGeneratedLetter(randomLetter);
}

function startBossFight() {
    bossFight = true;
    const wordLength = Math.floor(Math.random() * 3) + bossLevel;
    bossWord = generateRandomWord(wordLength);
    updateGeneratedLetter(bossWord);
}

function generateRandomWord(length) {
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
    // Check for the debug key combination: q, w, e, r pressed simultaneously
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

    // Check if all four debug keys are pressed simultaneously
    if (debugKeys.q && debugKeys.w && debugKeys.e && debugKeys.r) {
        // Set the score to 100
        score = 125;
        scoreElement.textContent = score;
        bossLevel = 7;
        debugKeys.q = false;
        debugKeys.w = false;
        debugKeys.e = false;
        debugKeys.r = false;
    }
    if (bossFight) {
        if (event.key === "Backspace") {
            typedWord = typedWord.slice(0, -1);
            updateTypedWord(typedWord);
        } else {
            typedWord += event.key.toUpperCase();
            updateTypedWord(typedWord);
        }

        if (typedWord === bossWord) {
            bossWon();
        }
    } else {
        const displayedLetter = generatedLetterElement.textContent;
        typedLetter = event.key.toUpperCase();

        if (typedLetter === displayedLetter) {
            normalWon();
        }
    }

    if (keymasterIndex === letters.length) {
        keymasterIndex = 0;
    }
}

function buyKeymaster() {
    if (!keymasterBought && score >= 25) {
        keymasterBought = true;
        buyKeymasterButton.disabled = true;
        keymasterInterval = setInterval(typeKeymasterLetter, 1000);
    }
}

function handleKeymasterKeyPress() {
    const letterToType = letters[keymasterIndex];

    if (bossFight) {
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
        keymasterLetter.style.display = "block";
        keymasterWord.style.display = "none";
        const displayedLetter = generatedLetterElement.textContent;
        typedLetter = letterToType;
        keymasterLetter.textContent = typedLetter;
        if (typedLetter === displayedLetter) {
            normalWon();
        }
    }
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
