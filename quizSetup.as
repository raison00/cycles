stop ();
quizData = new XML();
quizData.load("quizData.xml");
// initialize main questions array
questions = [];
// parse the data from the XML document
function parseData () {
	quiz = quizData.firstChild.childNodes;
	for (i=0; i<quiz.length; i++) {
		// get the question
		xmlQuestion = quiz[i];
		if (xmlQuestion.nodeName == "question") {
			// make a new object
			n = questions.length;
			questions[n] = new Object();
			// initialize variables
			questions[n].q = "";
			questions[n].answers = [];
			questions[n].correct = 0;
			// populate the question object
			for (j=0; j<xmlQuestion.childNodes.length; j++) {
				thisNode = xmlQuestion.childNodes[j];
				if (thisNode.nodeName == "q") {
					questions[n].q = thisNode.firstChild.nodeValue;
				} else if (thisNode.nodeName == "answer") {
					questions[n].answers.push(thisNode.firstChild.nodeValue);
				} else if (thisNode.nodeName == "correct") {
					questions[n].correct = (thisNode.firstChild.nodeValue.valueOf()-1);
				}
			}
		}
	}
	gotoAndStop("start game")
}