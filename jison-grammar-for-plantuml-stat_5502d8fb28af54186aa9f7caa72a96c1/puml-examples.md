## Simple State

    @startuml
    
    [*] --> State1
    State1 --> [*]
    State1 : this is a string
    State1 : this is another string
    
    State1 -> State2
    State2 --> [*]
    
    @enduml


## Composite state

    @startuml
    scale 350 width
    [*] --> NotShooting
    
    state NotShooting {
      [*] --> Idle
      Idle --> Configuring : EvConfig
      Configuring --> Idle : EvConfig
    }
    
    state Configuring {
      [*] --> NewValueSelection
      NewValueSelection --> NewValuePreview : EvNewValue
      NewValuePreview --> NewValueSelection : EvNewValueRejected
      NewValuePreview --> NewValueSelection : EvNewValueSaved
      
      state NewValuePreview {
         State1 -> State2
      }
      
    }
    @enduml
    
## Long name

    @startuml
    scale 600 width
    
    [*] -> State1
    State1 --> State2 : Succeeded
    State1 --> [*] : Aborted
    State2 --> State3 : Succeeded
    State2 --> [*] : Aborted
    state State3 {
      state "Accumulate Enough Data\nLong State Name" as long1
      long1 : Just a test
      [*] --> long1
      long1 --> long1 : New Data
      long1 --> ProcessData : Enough Data
    }
    State3 --> State3 : Failed
    State3 --> [*] : Succeeded / Save Result
    State3 --> [*] : Aborted
     
    @enduml
    
## Concurrent state

    @startuml
    [*] --> Active
    
    state Active {
      [*] -> NumLockOff
      NumLockOff --> NumLockOn : EvNumLockPressed
      NumLockOn --> NumLockOff : EvNumLockPressed
      --
      [*] -> CapsLockOff
      CapsLockOff --> CapsLockOn : EvCapsLockPressed
      CapsLockOn --> CapsLockOff : EvCapsLockPressed
      --
      [*] -> ScrollLockOff
      ScrollLockOff --> ScrollLockOn : EvCapsLockPressed
      ScrollLockOn --> ScrollLockOff : EvCapsLockPressed
    }
    
    @enduml
    
## Arrow direction

    @startuml
    
    [*] -up-> First
    First -right-> Second
    Second --> Third
    Third -left-> Last
    
    @enduml

## Notes

    @startuml
    
    [*] --> Active
    Active --> Inactive
    
    note left of Active : this is a short\nnote
    
    note right of Inactive
      A note can also
      be defined on
      several lines
    end note
    
    @enduml


    @startuml
    
    [*] --> NotShooting
    
    state "Not Shooting State" as NotShooting {
      state "Idle mode" as Idle
      state "Configuring mode" as Configuring
      [*] --> Idle
      Idle --> Configuring : EvConfig
      Configuring --> Idle : EvConfig
    }
    
    note right of NotShooting : This is a note on a composite state
    
    @enduml
    
## Skinparam

    @startuml
    skinparam backgroundColor LightYellow
    skinparam state {
      StartColor MediumBlue
      EndColor Red
      BackgroundColor Peru
      BackgroundColor<<Warning>> Olive
      BorderColor Gray
      FontName Impact
    }
    
    [*] --> NotShooting
    
    state "Not Shooting State" as NotShooting {
      state "Idle mode" as Idle <<Warning>>
      state "Configuring mode" as Configuring
      [*] --> Idle
      Idle --> Configuring : EvConfig
      Configuring --> Idle : EvConfig
    }
    
    NotShooting --> [*]
    @enduml