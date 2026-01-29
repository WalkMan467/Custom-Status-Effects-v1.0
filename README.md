# Custom Status Effects
> Welcome to the Custom Status Effects Datapack
> You can temporarily modify an entity's attributes by adjusting its values
> Currently the multiplication formula is supported and more functions and new custom states will be added later
> Supports adding multiple custom state IDs and attrubute stacking effects that repeatedly apply attributes for duplicate IDs

## How to use?

### Custom Attribute Status

> Apply custom attributes status effects to the target

> attribute: The attributes you want to apply
> duration: Duration (1t / 0.05s)
> base: The initial value applied
> value: The value added upon repeated stacking
> max: The maximum value limit
> id: You can define the ID as you wish to see the effect, Effects with the same ID and modified attribute will stack; otherwise a new independent one will be created

```hs
function cse:sys/status_effects/use {attribute:"movement_speed",duration:100,base:0.1,value:0.1,max:0.2, id:"global2"}
```

### Bleeding Status

> When the subject is afflicted with this status
all accumulated dmg other than Bleeding DoT will be recorded
and the subject will take base DoT dmg plus the previously accumulated dmg based on the set duration in seconds

> duration: Duration (1t / 0.05s)
> tick_rate: Interval for Dot Dmg
> dot: Base bleeding dmg dealt
> max: The maximum value limit

```hs
function cse:status_effects/apply/bleeding/use {duration:100, tick_rate:40, dot:20, max:100}
```