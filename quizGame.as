topScore = questions.length;
scoreLength = Math.floor(50/topScore);

function newGame () {
	currQuestion = -1;
	score = 0;
	scoreReadout = score + "/" + questions.length
	results.gotoAndStop(1);
	askQuestion();
	active = true;
}
function endGame () {
	currQuestion = 33;
	currQuestion>=questions.length
	results.gotoAndPlay(1);
	
}
function askQuestion () {
	currQuestion++;
	if (currQuestion>=questions.length) {
		endGame();
	} else {
		qClip.q = (currQuestion+1)+". "+questions[currQuestion].q;
		qClip.answer1 = questions[currQuestion].answers[0];
		qClip.answer2 = questions[currQuestion].answers[1];
		qClip.answer3 = questions[currQuestion].answers[2];
		qClip.gotoAndPlay(2);
		timer.running = true;
		timer.gotoAndStop(1);
	}
}
function guess (whichGuess) {
	if (active) {
		timer.running = false;
		if (whichGuess == questions[currQuestion].correct) {
			next = results._currentFrame+scoreLength;
			if (next>50) {
				next = 50;
			}
			results.gotoAndStop(next);
			score++;
			scoreReadout = score + "/" + questions.length
			answer.gotoAndStop("correct");
		} else {
			answer.gotoAndStop("incorrect");
		}
	}
}
newGame();
endGame();
stop ();
