{$INCLUDE 'SpellTemplate.dws'};

procedure CreateData(Entity : TEntity; SpellGroup, ChargeGroup : integer);
begin
  PrepareSpellData(Entity, SpellGroup, ChargeGroup, False, {@SBL_Tier}2);
  Entity.Blackboard.SetValue(eiUnitProperties, [SpellGroup], [upSpellCharm, upSpellAlly]);
  Entity.Blackboard.SetIndexedValue(eiResourceCost, [SpellGroup], reGold, GetCardBaseCost({@SBL_Tier}2, Entity.CardLeague(SpellGroup), Entity.CardLevel(SpellGroup), False, True, False) + 20);

  Entity.Blackboard.SetValue(eiAbilityTargetCount, [SpellGroup], 1);
  Entity.Blackboard.SetValue(eiAbilityTargetType, [SpellGroup], ctCoordinate);
  // effect
  Entity.Blackboard.SetValue(eiWelaUnitPattern, [SpellGroup], 'Spells\Green\HealingGardenSpell');

  {$IFDEF CLIENT}
    TTooltipUnitAbilityComponent.CreateGrouped(Entity, [SpellGroup], 'HealingGarden')
      .IsCardDescription
      .Keyword('Domain')
      .PassInteger('energy_amount', 1, 'energy')
      .PassInteger('energy_cooldown', 3)
      .PassInteger('charge_amount', 6, 'counter');
    TTooltipUnitAbilityComponent.CreateGrouped(Entity, [SpellGroup], 'EnchantmentHealth')
      .Keyword('Enchanted')
      .PassPercentage('health_amount_percentage', 30, 'health')
      .PassInteger('health_amount', 50, 'health');

    Entity.Blackboard.SetIndexedValue(eiCardStats, [SpellGroup], reMetaAttack, 0);
    Entity.Blackboard.SetIndexedValue(eiCardStats, [SpellGroup], reMetaDefense, 8);
    Entity.Blackboard.SetIndexedValue(eiCardStats, [SpellGroup], reMetaUtility, 0);
  {$ENDIF}
end;

procedure AddSpell(Entity : TEntity; CardInfo : TCardInfo; Slot : integer);
var SpellGroup, ChargeGroup : integer;
begin
  SpellGroup := Entity.ReserveFreeGroup();
  ChargeGroup := Entity.ReserveFreeGroup();
  PrepareSpell(Entity, SpellGroup, ChargeGroup, Slot, CardInfo);
  CreateData(Entity, SpellGroup, ChargeGroup);

  {$IFDEF SERVER}
    TWelaEffectFactoryComponent.CreateGrouped(Entity, [SpellGroup])
      .PassCardValues;
    TBrainWelaCommanderComponent.CreateGrouped(Entity, [SpellGroup]);
  {$ENDIF}

  {$IFDEF CLIENT}
    TSpelltargetVisualizerShowPatternComponent.CreateGrouped(Entity, [SpellGroup]);

    TIndicatorShowTextComponent.CreateGrouped(Entity, [SpellGroup])
      .ShowResource(reCharmCount)
      .ResourceGroup([])
      .Color($FF03a9a3)
      .SpelltargetVisualizer;
  {$ENDIF}
end;