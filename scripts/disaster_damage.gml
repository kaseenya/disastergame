
var target = argument0;
var disaster = argument1;
var rate = argument2;

if (object_is_ancestor(target.object_index, Building))
{
    var pdamage = disaster.populationDamage
        + disaster.populationDamage_CurRate * target.population
        + disaster.populationDamage_MaxRate * target.populationMax;
    var ddamage = disaster.durabilityDamage
        + disaster.durabilityDamage_CurRate * target.durability
        + disaster.durabilityDamage_MaxRate * target.durabilityMax;
        
    if (target.basement)
    {
        switch(disaster.object_index)
        {
        case Rain:
            pdamage *= 1.3;
            ddamage *= 1.3;
            break;
        case Typhoon:
            ddamage *= 1.3;
            break;
        case Storm:
            pdamage *= 0.5;
            break;
        }
    }
        
    pdamage = round(pdamage * rate);
    ddamage = round(ddamage * rate);
    target.population -= pdamage;
    target.durability -= ddamage;
    get_damage_rate(disaster, target.gid, target.material);
    
    if (target.population <= 0)
    {
        target.population = 0;
    }
    if (target.durability <= 0)
    {
        target.durability = 0;
        with(target) instance_destroy();
    }
}
