// personal assistant agent 

/* Task 2 Start of your solution */
// Task 2.3

option("vibrations").

best_option :- option("vibrations").

// Task 2.1
+mattress(State) : true <-
    .print("MATTRESS: ", State).

+blinds(State) : true <-
    .print("BLINDS: ", State).

+lights(State) : true <-
    .print("LIGHTS: ", State).

+owner_state(State) : true <-
    .print("OWNER: ", State).

+upcoming_event(Event) : true <-
    !react_to_event_now(Event).
    .print("UPCOMING EVENT: ", Event).

// Task 2.2
@react_to_event_now_plan
+!react_to_event_now(Event) : owner_state(State) <-
    if (State == "asleep") {
        !start_wake_up_routine;
        .print("Starting wake-up routine");
    }
    if (State == "awake") {
        .print("Enjoy your day!");
    }.

+!start_wake_up_routine : best_option & owner_state(State) <-
    if(State == "awake") {
        -start_wake_up_routine;
    }
    if (option("vibrations")) {
        setVibrationsMode;
        .print("Vibrations mode activated");
        +option("natural_light");
        +start_wake_up_routine;
    }
    if (option("natural_light")) {
        raiseBlinds;
        .print("Lights mode activated");
        +option("artificial_light");
        +start_wake_up_routine;
    }
    if (option("artificial_light")) {
        turnOnLights;
        .print("Blinds mode activated");
        +start_wake_up_routine;
    }.

    



/* Task 2 End of your solution */

/* Import behavior of agents that work in CArtAgO environments */
{ include("$jacamoJar/templates/common-cartago.asl") }