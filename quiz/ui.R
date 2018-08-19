library(shiny)
setwd("F:/FYP")
dataset=read.csv("DS2.csv")
shinyUI(fluidPage(
  titlePanel("IDENTIFY YOUR BODY TYPE AND ENTER YOUR SYMPTOMS!"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("rd",
                   label = "Body frame:",
                   choices = list("Thin and lean" = 1,"Medium" = 2,"Fat" = 3)),
      radioButtons("rd1",
                   label = "Type of hair:",
                   choices = list("Dry" = 1,"Normal" = 2,"Oily" = 3)),
      
      radioButtons("rd2",
                   label = "Color of hair:",
                   choices = list("Pale Brown"=1,"Red or brown"=2,"Black"=3)),
      radioButtons("rd3",
                   label = "Skin:",
                   choices = list("Dry"=1,"Soft"=2,"Moist"=3)),
      radioButtons("rd4",
                   label = "Complexion:",
                   choices = list("Dark"=1,"Fair"=2,"White"=3)),
      radioButtons("rd5",
                   label = "Body Weight:",
                   choices = list("Low, difficult to put on weight"=1,"Medium, can easily  gain weight"=2,"Overweight, difficult to lose weight"=3)),
      radioButtons("rd6",
                   label = "Nails:",
                   choices = list("Brittle"=1,"small"=2," big, smooth"=3)),
      radioButtons("rd7",
                   label = "Size and Color of the Teeth:",
                   choices = list("Irregular"=1,"Medium sized, yellowish"=2,"Large, shining white"=3)),
      radioButtons("rd8",
                   label = "Pace of Performing Work:",
                   choices = list("Fast,always in a hurry"=1,"Medium,energetic"=2,"Slow,steady"=3)),
      radioButtons("rd9",
                   label = "Mental Activity:",
                   choices = list("Quick, restless"=1,"Smart intellect"=2,"Calm, stable"=3)),
      radioButtons("rd10",
                   label = "Memory:",
                   choices = list("Short term, bad"=1,"Good memory"=2,"Long term best"=3)),
      radioButtons("rd11",
                   label = "Grasping power:",
                   choices = list("Grasps quickly but not completely, forgets quickly"=1,"Grasps quickly, completely and have good memory"=2,"Grasps late and retains for long time"=3)),
      radioButtons("rd12",
                   label = "Sleep Pattern:",
                   choices = list("Interrupted, less"=1,"Moderate"=2,"Sleepy,lazy"=3)),
      radioButtons("rd13",
                   label = "Intolerance to Weather Conditions:",
                   choices = list("Aversion to cold"=1,"Aversion to heat"=2,"Aversion to moist,rainy and cool weather"=3)),
      radioButtons("rd14",
                   label = "Reactions Under Adverse Situations:",
                   choices = list("Anxiety,Worry,irritability"=1,"Anger, aggression"=2,"Calm, reclusive, sometimes depressive"=3)),
      radioButtons("rd15",
                   label = "Mood:",
                   choices = list("Changes quickly, have frequent mood swings"=1,"Changes slowly"=2,"Stable constant"=3)),
      radioButtons("rd16",
                   label = "Eating habit:",
                   choices = list("Eats quickly without chewing properly"=1,"Eats at a moderate speed"=2,"Chews food properly"=3)),
      radioButtons("rd17",
                   label = "Hunger:",
                   choices = list("Irregular, Any time"=1,"Sharp hunger"=2,"Can skip any meal easily"=3)),
      radioButtons("rd18",
                   label = "Body temperature:",
                   choices = list("Less than normal, hands and feet are cold"=1,"More than normal,face and forehead hot"=2,"Normal, hands and feet slightly cold"=3)),
      radioButtons("rd19",
                   label = "Joints:",
                   choices = list("Weak, noise on movement"=1,"Healthy with opimal strength"=2,"Heavy weight bearing"=3)),
      radioButtons("rd20",
                   label = "Nature:",
                   choices = list("Timid, jealous"=1,"Egoistic, fearless"=2,"Forgiving, grateful, not greedy"=3)),
      radioButtons("rd21",
                   label = "Body energy:",
                   choices = list("Becomes low in Evening, fatigues after less work"=1,"Moderate gets tired after medium work"=2,"Excellent energy throughout day, not easily fatigued "=3)),
      radioButtons("rd22",
                   label = "Eyeball:",
                   choices = list("Unsteady, fast moving"=1,"Moving slowly"=2,"Steady"=3)),
      radioButtons("rd23",
                   label = "Quality of voice:",
                   choices = list("Rough with broken words"=1,"Fast, commanding"=2,"Soft and deep"=3)),
      radioButtons("rd24",
                   label = "Dreams:",
                   choices = list("Sky, wind, Flying objects and confusion"=1,"Fire, light, bright, colours, violence"=2,"Water pools, gardens and good relationships"=3)),
      radioButtons("rd25",
                   label = "Social relations:",
                   choices = list("Makes less friends, prefers solitude"=1,"Good number of friends"=2,"Loves to socialize, Relationships are long lasting"=3)),
      radioButtons("rd26",
                   label = "Wealth:",
                   choices = list("Spends without thinking much"=1,"Saves but spends on valuable things"=2,"Prefers more savings"=3)),
      radioButtons("rd27",
                   label = "Bowel movements:",
                   choices = list("Dry, blackish, scanty stools"=1,"Soft, yellowish, Loose stools"=2,"Heavy, thick, sticky stools"=3)),
      radioButtons("rd28",
                   label = "Walking pace:",
                   choices = list("Quick, fast with long steps"=1,"Average, steady"=2,"Slow with short steps "=3)),
      radioButtons("rd29",
                   label = "Communication skills:",
                   choices = list("Fast, irrelevant talk, speech not clear"=1,"Good speaker with genuine argumentative skills"=2,"Authoritative, firm and litte speech"=3))
      
      
      
      
    ),
    mainPanel(
      verbatimTextOutput("ncount"),
      selectInput('A','Symptom1',names(dataset),selected = NULL),
      selectInput('B','Symptom2',names(dataset),selected = NULL),
      selectInput('C','Symptom3',names(dataset),selected = NULL),
      selectInput('D','Symptom4',names(dataset),selected = NULL
                  ),
      
      verbatimTextOutput("console") 
     # verbatimTextOutput("symp2"),
     # verbatimTextOutput("symp3"), 
     # verbatimTextOutput("symp4")
      
      #verbatimTextOutput("result")
      #verbatimTextOutput("medicine"),
      #verbatimTextOutput("herb")
    )
  )
)) 