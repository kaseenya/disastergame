
var target = argument0;
var disaster = argument1;
var rate = argument2;

var pdamage = disaster.populationDamage
    + disaster.populationDamage_CurRate * target.population
    + disaster.populationDamage_MaxRate * target.populationMax;
var ddamage = disaster.durabilityDamage
    + disaster.durabilityDamage_CurRate * target.durability
    + disaster.durabilityDamage_MaxRate * target.durabilityMax;
    
pdamage = round(pdamage * rate);
ddamage = round(ddamage * rate);
if (pdamage == 0) pdamage = 1;
if (ddamage == 0) ddamage = 1;
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
