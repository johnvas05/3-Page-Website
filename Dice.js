function rollDice() {
    let first = Math.floor(Math.random() * 6) + 1;
    let second = Math.floor(Math.random() * 6) + 1;
    result = first + second;
    if ((result % 2) === 0) {
        alert("You won!");
    }else{
        alert("You lost :(");
    }
}



