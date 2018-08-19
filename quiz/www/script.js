var ajaxEchoXML = "<totalquiz><title>Let's identify your body type!?</title><intro>We now know that there are three body types- Vata, Pitta, Kapha. Take this quiz to see to which one you belong!</intro><quiz><questionset num='0'><question>Body Frame?</question><choices><option value='0'>Thin and Lean</option><option value='1'>Medium</option><option value='2'>Well built</option></choices></questionset><questionset num='1'><question>Type of hair?</question><choices><option value='0'>Dry and with split ends</option><option value='1'>Normal, thin and more hairfall</option><option value='2'>Greasy, heavy</option></choices></questionset><questionset num='2'><question>Color of Hair?</question><choices><option value='0'>Pale brown</option><option value='1'>Red or brown</option><option value='2'>Black</option></choices></questionset><questionset num='3'><question> Skin?</question><choices><option value='0'>Dry, Rough</option><option value='1'>Soft,More sweating, Acne.</option><option value='2'>Moist, Greasy</option></choices></questionset><questionset num='4'><question>Complexion?</question><choices><option value='0'>Dark blackish</option><option value='1'>Pink to red.</option><option value='2'>Glowing, white.</option></choices></questionset><questionset num='5'><question>Body Weight?</question><choices><option value='0'>Low, difficult to put on weight.</option><option value='1'>Medium, can easily  gain weight.</option><option value='2'>Overweight, difficult to lose weight.</option></choices></questionset><questionset num='6'><question>Nails?</question><choices><option value='0'>Blackish,small, brittle</option><option value='1'>Reddish, small.</option><option value='2'>Pinkish, big, smooth.</option></choices></questionset><questionset num='7'><question>Size and Color of the Teeth?</question><choices><option value='0'>Very big or very small, irregular, blackish.</option><option value='1'>Medium sized, yellowish.</option><option value='2'>Large, shining white.</option></choices></questionset><questionset num='8'><question>Pace of Performing Work</question><choices><option value='0'>Fast,always in a hurry.</option><option value='1'>Medium,energetic.</option><option value='2'>Slow,steady.</option></choices></questionset><questionset num='9'><question>Mental Activity?</question><choices><option value='0'>Quick, restless</option><option value='1'>Smart intellect, aggressive</option><option value='2'>Calm, stable.</option></choices></questionset>><questionset num='10'><question>Memory?</question><choices><option value='0'>Short term, bad</option><option value='1'>Good memory</option><option value='2'>Long term best</option></choices></questionset>><questionset num='11'><question>grasping power?</question><choices><option value='0'>Grasps quickly but not completely, forgets quickly.</option><option value='1'>Grasps quickly, completely and have good memory</option><option value='2'>Grasps late and retains for long time</option></choices></questionset>









</quiz><results><mostly value='0'><header>Your body type is</header><copy>You're a levelheaded girl who likes having fun within your own comfort zone. Being adventurous is more likely to happen when you feel supported and sure of the outcome.</copy></mostly><mostly value='1'><header>Bold but balanced </header><copy>You're confident enough to go for the gusto—but cautious enough to want to know the risks before you take the plunge. You prefer to be informed, weigh the pros and cons, and maybe even practice ahead of time. Then you'll dive in!</copy></mostly><mostly value='2'><header>Dare devil</header><copy>Adventure? Bring it on! You're open and willing to try new things and not afraid to look a little inexperienced. After all, no one starts out as an expert—trying and learning is how you become one!</copy></mostly></results></totalquiz>"
    
var currentQuestion;
var correctTotal;
var totalQuestions;
var answerArray;
var myReady;
var QArray;
var RArray;
var random;
var centerOffset;
var animateSpeed;
var nextStage;
var onStage;
var prevStage;
    
init();

function init() {
    currentQuestion = 0;
    correctTotal    = 0;
    TotalQuestions  = 0;
    currentQuestion = 0;
    centerOffset    = 500;
    animateSpeed    = 500;
    QArray          = Array();
    RArray          = Array();   
    myReady         = true;
    random          = true;
    
    nextStage       = {opacity: 0,left:'+='+centerOffset};
    onStage         = {opacity: 1,left:'125'};
    prevStage       = {opacity: 0,left:'-='+centerOffset};
    
    $.ajax({
        //type: "GET",
        //url: "Quiz.xml",
        type: "POST",
        url: "/echo/xml/",
        dataType: "xml",
        data: {
            xml: ajaxEchoXML
        },
        success: xmlLoaded
    });
}
    
function xmlLoaded(data){
    makeHTML(data);
    reset();
}
    
function reset(){
    
    $(".questionSet").animate(nextStage, 0);
    $(".results").animate(nextStage, 0);
    
    currentQuestion = 0;
    correctTotal    = 0;
    currentQuestion = 0;
    answerArray     = new Array();
    
    nextQuestion();
}


function nextQuestion(){  
  
    if(currentQuestion>0){
            $(QArray[currentQuestion-1]).animate(prevStage, animateSpeed);
    }

    if(currentQuestion<totalQuestions){
        $(QArray[currentQuestion]).animate(onStage, animateSpeed);
        var optionArray = $(QArray[currentQuestion]).find("li");
        /*for( var A in optionArray){
            //$(optionArray[A]).css('opacity', '0');
            //$(optionArray[A]).delay(animateSpeed).animate({opacity:1}, 1000);
        }
        */
    }       
        
    if(currentQuestion==totalQuestions){
        var mostLikely = getResults(answerArray);
         $(RArray[mostLikely]).animate(onStage, animateSpeed);
    }
}
    
function makeHTML(data) {
    /////////////////////////////////////////////////////
    //  Create HTML elements
    /////////////////////////////////////////////////////
    var title         = $("<div/>", {id:"title", text:$(data).find("title").text()});
    var intro         = $("<div/>", {id:"intro", text:$(data).find("intro").text()});
    var questionStage = $("<div/>", {id:"questionStage"});
    var quiz          = $("<ol/>",  {id:"allQuestions"});
            
    var questionsetArray = data.getElementsByTagName("questionset");
    var Qshuffle         = shuffleArray(questionsetArray.length);
        
    totalQuestions = questionsetArray.length;

    for (var A = 0; A < questionsetArray.length; A++) {
        var num = (random)? Qshuffle[A]: A;
  
        var questionset = $("<li/>",   {class:"questionSet",id:'QS'+num});
        var question    = $("<span/>", {class:"question",text:$(questionsetArray[num]).find("question").text()});
        var choices     = $("<ol/>",   {class:"choices"});

        var optionArray = questionsetArray[num].getElementsByTagName("option");
        var Oshuffle    = shuffleArray(optionArray.length);

        for (var B = 0; B < optionArray.length; B++) {
            
            var num2   = (random)? Oshuffle[B]: B;

            var link   = $("<a/>",  {class:"option",href:"#"});           
            var option = $("<li/>", {text:$(optionArray[num2]).text()});

            $(link).append(option);
            $(choices).append(link);
                
            $(link).on('click', {
                choice: $(optionArray[num2]).attr("value")
            }, clickHandler);

        }
                
        $(questionset).append(question).append(choices);              
        $(quiz).append(questionset);
                
        QArray.push(questionset);
    }

    $('#Qstage').append(title).append(intro).append(quiz);

    var resultsArray = data.getElementsByTagName("mostly");

    for (var C = 0; C < resultsArray.length; C++) {
        var results      = $("<div/>", {class:"results"})  
        var resultsTitle = $("<span/>",{class:"resultsTitle", text:$(resultsArray[C]).find("header").text()}); 
        var resultsBody  = $("<span/>",{class:"resultsBody",  text:$(resultsArray[C]).find("copy").text()}); 
                
        $(results).append(resultsTitle).append(resultsBody);
        $('#Qstage').append(results);
                
        RArray.push(results);
    }
}

function clickHandler(e) {
            
    var ChoiceNum = e.data.choice;
    
    if (answerArray[ChoiceNum] === undefined){
        answerArray[ChoiceNum] = 1;
    }else{
        answerArray[ChoiceNum]++;
    }
            
    currentQuestion ++;
    nextQuestion();
}

function getResults(rArray){
                
    var returnNum  = 0;
    var largestNum = 0;
                
    for( var i = 0; i < rArray.length; i++){
        if(rArray[i]>largestNum){
            largestNum = rArray[i];
            returnNum = i;
        }
    }        
    return returnNum;
}
                
function shuffleArray(num) {
    var s = Array();
    var i = num;
    while (i--) s.push(i);
    return arrayShuffle(s);
}

function arrayShuffle(oldArray) {
    var newArray = oldArray.slice();
    var len = newArray.length;
    var i = len;
    while (i--) {
        var p = parseInt(Math.random() * len);
        var t = newArray[i];
        newArray[i] = newArray[p];
        newArray[p] = t;
    }
    return newArray;
}
